import 'package:flutter/material.dart';
import 'package:catalouge/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item}) : assert(item!=null), super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){},
        leading: Image.network(item.image),
        title: Text(item.productName),
        subtitle: Text(item.desc),
        contentPadding: const EdgeInsets.fromLTRB(10,10,5,5),
        trailing: Text(
            "\$${item.price}",
          textScaleFactor:1.3,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
    );
  }
}
