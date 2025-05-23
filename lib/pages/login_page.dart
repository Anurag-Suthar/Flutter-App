import 'dart:developer';

import 'package:fluter_catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:fluter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String _username = "";
  bool _isLoading = false;

  void _handleLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    const correctUsername = "admin";
    const correctPassword = "1234";

    setState(() {
      _isLoading = true;
    });

    // Simulate a delay like an API call (optional)
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });

      if (username == correctUsername && password == correctPassword) {
        log("Login successful for $username");
        Navigator.pushNamed(context, AppRoutes.homeRoute);
      } else {
        log("Login failed");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset("assets/images/login-img.png", fit: BoxFit.contain),
            const SizedBox(height: 16),
            "Welcome $_username".text.xl4.color(context.theme.hintColor).make(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: "Enter User Name",
                      labelText: "User Name",
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? "Username required"
                                : null,
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? "Password required"
                                : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppTheme.getButtonColor(
                          context,
                        ), // Set background color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed:
                            _isLoading
                                ? null
                                : () {
                                  if (_formKey.currentState!.validate()) {
                                    _handleLogin();
                                  }
                                },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor:
                              Colors.transparent, // Make button transparent
                          shadowColor: Colors.transparent, // Remove shadow
                        ),
                        child:
                            _isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : "Login".text.xl
                                    .color(context.theme.cardColor)
                                    .make(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
