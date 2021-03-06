import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

import '../widgets/ui_elements/logout_list_tile.dart';

import '../scoped_models/main.dart';

class ProductsAdminPage extends StatelessWidget {
  final MainModel model;

  ProductsAdminPage(this.model);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
      ListTile(
          leading: Icon(Icons.shop),
          title: Text('All Products'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          }),
      Divider(height: 2.0),
      LogoutListTile()
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text('Manage Products'),
                bottom: TabBar(tabs: <Widget>[
                  Tab(text: 'Create Product', icon: Icon(Icons.create)),
                  Tab(text: 'My Products', icon: Icon(Icons.list))
                ])),
            drawer: _buildSideDrawer(context),
            body: TabBarView(children: <Widget>[
              ProductCreatePage(),
              ProductListPage(model)
            ])));
  }
}
