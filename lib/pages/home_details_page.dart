// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluter_catalog/models/catalog.dart';
import 'package:fluter_catalog/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
    : assert(catalog != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: AppTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child:
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,

              children: [
                "\$${catalog.price}".text.bold.xl4.red800.make(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppTheme.darkBluishColor,
                      ),
                    ),
                    onPressed: () => {},
                    child: "Buy".text.xl.color(Vx.white).make(),
                  ).wh(100, 50),
                ),
              ],
            ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convex,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child:
                      Column(
                        children: [
                          catalog.name.text.xl4
                              .color(AppTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                          "Deserunt adipisicing in non aute. Consectetur elit deserunt veniam cillum quis aliquip nulla ea deserunt aute. Incididunt pariatur amet aute quis dolor qui id dolore non voluptate non. Ea pariatur excepteur laborum deserunt officia nostrud officia. Laboris magna sit nostrud tempor consectetur anim. Dolore ex sit veniam et nostrud velit nostrud reprehenderit."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16(),
                        ],
                      ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
