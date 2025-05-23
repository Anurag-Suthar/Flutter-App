import 'package:fluter_catalog/core/store.dart';
import 'package:fluter_catalog/models/cart.dart';
import 'package:fluter_catalog/models/catalog.dart';
import 'package:fluter_catalog/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as AppStore).cart;

    return VxBuilder(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, store, mutation) {
        final bool isInCart = _cart.items.contains(catalog);

        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              AppTheme.getButtonColor(context),
            ),
          ),
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog);
            }
          },
          child:
              isInCart
                  ? Icon(Icons.done, color: context.canvasColor)
                  : Icon(
                    CupertinoIcons.cart_badge_plus,
                    color: context.canvasColor,
                  ),
        );
      },
    );
  }
}
