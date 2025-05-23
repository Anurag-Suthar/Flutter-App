// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 4));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items =
        List.from(
          productsData,
        ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, AppRoutes.cartRoute)},
        backgroundColor: AppTheme.getButtonColor(context),
        child: Icon(CupertinoIcons.cart, color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),

              if (CatalogModel.items.length != 0 &&
                  CatalogModel.items.isNotEmpty)
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
