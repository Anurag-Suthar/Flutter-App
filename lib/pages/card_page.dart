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
  const _CardTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$1000".text.xl5.color(context.theme.hintColor).make(),
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

class _CardList extends StatefulWidget {
  const _CardList({super.key});

  @override
  State<_CardList> createState() => __CardListState();
}

class __CardListState extends State<_CardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder:
          (context, index) => ListTile(
            leading: Icon(Icons.done),

            title: "Item $index".text.make(),
            subtitle: "Item $index".text.make(),
            trailing: IconButton(onPressed: () => {}, icon: Icon(Icons.delete)),
          ),
    );
  }
}
