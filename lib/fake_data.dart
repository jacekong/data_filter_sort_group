import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:test_a/pd_model.dart';
import 'package:test_a/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String, Object?>> _products= prods;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(onSurface: Colors.red),
      onPressed: () {
        productsFilter();
      },
      child: Text('ElevatedButton'),
    ));
  }

  // 1. a function to filter out active prods
  void productsFilter() {
    // Filter out items that have isActive set to false or have null price
    List<Map<String, dynamic>> activeProducts = _products
        .where((product) =>
            product['isActive'] == 'true' && product['price'] != null)
        .toList();

    // Sort items by price from highest to lowest
    activeProducts.sort(
        (a, b) => double.parse(b['price']).compareTo(double.parse(a['price'])));

    // group by cate id
    var groupByCat = groupBy(activeProducts, (Map obj) => obj['categoryId']);

    print(groupByCat);
  
  }

}

class CatIndex {
  String catId;
  double index;
  CatIndex({required this.catId, required this.index});
}

// List sortedProductAndCategory() {
//   /// 1. filter all active products
//   ///
//   /// 2. sort by price and price for each category, group by category id
//   ///
//   /// ex. cat1->300 cat1->200 cat1->100 cat2->290 cat2->200 cat2->190
// }

main() {}
