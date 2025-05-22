import 'package:fluter_catalog/models/catalog.dart';
import 'package:fluter_catalog/pages/home_details_page.dart';
import 'package:fluter_catalog/utils/routes.dart';
import 'package:fluter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:fluter_catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CataLogList extends StatelessWidget {
  const CataLogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog),
                ),
              ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
    : assert(catalog != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CataLogImage(image: catalog.image),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg
                      .color(context.theme.hintColor)
                      .bold
                      .make(),
                  catalog.desc.text
                      .textStyle(context.captionStyle)
                      .color(context.theme.hintColor)
                      .make(),
                  10.heightBox,
                  OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,

                    children: [
                      "\$${catalog.price}".text.bold.xl
                          .color(context.theme.hintColor)
                          .make(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              AppTheme.getButtonColor(context),
                            ),
                          ),

                          onPressed: () => {},
                          child: "Add to cart".text.color(Vx.white).make(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
