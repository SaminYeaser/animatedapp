import 'product.dart';

class ProductItem {
  int? quality;
  final Product? product;

  ProductItem({this.quality = 1,required this.product});

  void increment(){
    quality = quality! + 1 ;
  }
}
