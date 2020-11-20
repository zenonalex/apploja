import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widget/app_drawer.dart';
import '../widget/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
      ),
    );
  }
}
