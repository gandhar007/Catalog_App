import 'package:catalouge/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl2.red800.make(),
            AddToCart(catalog: catalog).wh(120,50),
          ],
        ).p24(),
      ),
      appBar: AppBar(
        title: catalog.productName.text.color(context.accentColor).bold.make(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
                child: VxArc(
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  height: 30,
                  child: Container(
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.productName.text.bold.xl4.color(context.accentColor).make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                        10.heightBox,
                        "kuahfukacbsachj bcgufbwenxhdjkahskhu u iudghuaisduigsduiui  aiusdhuiadhuiashduiahduh iuaduihiusahduiahduiahdaxjash "
                            .text.textStyle(context.captionStyle).make().p16(),
                      ],
                    ).py64(),
              color: context.cardColor,
            ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
