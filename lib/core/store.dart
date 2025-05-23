import 'package:fluter_catalog/models/cart.dart';
import 'package:fluter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AppStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  AppStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
