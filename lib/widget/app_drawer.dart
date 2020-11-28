import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: Text('Bem-vindo usuário!'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Loja'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.HOME,
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Pedidos'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.ORDERS,
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Gerenciar produtos'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.PRODUCTS,
            );
          },
        ),
      ]),
    );
  }
}
