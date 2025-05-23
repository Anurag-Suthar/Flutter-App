// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fluter_catalog/core/store.dart';
import 'package:fluter_catalog/models/cart.dart';
import 'package:fluter_catalog/utils/routes.dart';
import 'package:fluter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:fluter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fluter_catalog/models/catalog.dart';
import 'package:fluter_catalog/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 4));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    // print(catalogJson);
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    print("product $productsData");
    CatalogModel.items =
        List.from(
          productsData,
        ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as AppStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _, states) {
          return FloatingActionButton(
            onPressed:
                () => {Navigator.pushNamed(context, AppRoutes.cartRoute)},
            backgroundColor: AppTheme.getButtonColor(context),
            child: Icon(CupertinoIcons.cart, color: Colors.white),
          ).badge(
            color: context.theme.canvasColor,
            size: 22,
            count: cart.items.length,
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),

              if (CatalogModel.items.isNotEmpty)
                CataLogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
