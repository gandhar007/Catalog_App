class CatalogModel
{
  static List<Item> items = [];

  //Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item
{
  final int id;
  final String productName;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.productName, required this.desc, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<String,dynamic> map)
  {
    return Item(
        id: map["id"],
        productName: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"],
    );
  }

  toMap() => {
    "id": id,
    "name": productName,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,
  };

}