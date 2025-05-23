import 'package:fluter_catalog/models/catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // collection of ids - store ids of each image
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (totalValue, current) => totalValue + current.price);

  // add item to cart
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item from cart
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
