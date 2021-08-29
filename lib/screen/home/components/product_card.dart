import 'package:animatedapp/constant.dart';
import 'package:animatedapp/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  final VoidCallback? press;

  const ProductCard({Key? key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius:
                BorderRadius.all(Radius.circular(defaultPadding * 1.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product!.title!,
              child: Image.asset(product!.image!),
            ),
            Text(
              product!.title!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Fruits",
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
