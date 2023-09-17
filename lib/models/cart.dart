import 'package:catalouge/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel{

  //catalog field
  late CatalogModel _catalog;

  //Collection of ID's: Stores id of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog)
  {
    _catalog = newCatalog;
  }

  //Get items in the Cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price
  num get totalPrice => items.fold(0,(total,current) => total + current.price);

  //Remove Item
  void remove (Item item)
  {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart._itemIds.remove(item.id);
  }
}