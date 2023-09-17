import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalouge/models/cart.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
         _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              mutations: const {RemoveMutation},
              builder: (context, store, status){
                return "\$${_cart.totalPrice}".text.xl4.color(context.theme.hintColor).make();
              }
              ),
          30.widthBox,
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not Supported yet...".text.make(),
                ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.highlightColor),
              ),
              child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget
{
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty? "Nothing to Show".text.xl3.color(context.accentColor).makeCentered() :ListView.builder(
      itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            onPressed: (){
              RemoveMutation(_cart.items[index]);
            },
            icon: const Icon(Icons.remove_circle_outline),
          ),
          title: _cart.items[index].productName.text.make(),
        ),
    );
  }
}


