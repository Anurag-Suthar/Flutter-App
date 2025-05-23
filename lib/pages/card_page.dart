import 'package:fluter_catalog/core/store.dart';
import 'package:fluter_catalog/models/cart.dart';
import 'package:fluter_catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [_CardList().p32().expand(), Divider(), _CardTotal()],
      ),
    );
  }
}

class _CardTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as AppStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _, status) {
              return "\$${_cart.totalPrice}".text.xl5
                  .color(context.theme.hintColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                AppTheme.getButtonColor(context),
              ),
            ),

            onPressed:
                () => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying not supported yet".text.make()),
                  ),
                },
            child: "Buy".text.color(Vx.white).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as AppStore).cart;
    return VxBuilder(
      mutations: {RemoveMutation},
      builder: (context, store, status) {
        return _cart.items.isEmpty
            ? "Nothing to Show".text
                .color(context.theme.hintColor)
                .xl3
                .makeCentered()
            : ListView.builder(
              itemCount: _cart.items.length,
              itemBuilder:
                  (context, index) => ListTile(
                    leading: Icon(Icons.done),
                    title: _cart.items[index].name.text.make(),
                    // subtitle: "Item $index".text.make(),
                    trailing: IconButton(
                      onPressed: () => {RemoveMutation(_cart.items[index])},
                      icon: Icon(Icons.delete),
                    ),
                  ),
            );
      },
    );
  }
}
