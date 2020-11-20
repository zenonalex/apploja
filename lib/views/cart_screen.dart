import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';
import '../widget/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Card(
          elevation: 8,
          margin: EdgeInsets.all(25),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Chip(
                  label: Text(
                    'R\$ ${cart.totalAmount}',
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.headline6.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                Spacer(),
                FlatButton(
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(cart);
                    cart.clear();
                  },
                  child: Text("COMPRAR"),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cart.itemsCount,
            itemBuilder: (ctx, i) => CartItemWidget(cartItems[i]),
          ),
        ),
      ]),
    );
  }
}
