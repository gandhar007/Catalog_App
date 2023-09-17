import 'package:catalouge/models/cart.dart';
import 'package:catalouge/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class MyStore extends VxStore
{
  late CatalogModel catalog;
  late CartModel cart;

  MyStore()
  {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}