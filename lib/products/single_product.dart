import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/category_product.dart';
import 'package:http/http.dart' as http;


class SingleProduct extends StatefulWidget {

  static const routeName = '/single-product';

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context)?.settings.arguments;
    // print(productId);
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var productId = routeArgs['id'].toString();
    var productName = routeArgs['product_name'].toString();
    var productImage = routeArgs['podcut_image'];
    var productPrice = routeArgs['product_price'].toString();
    var shortDescription = routeArgs['short_description'].toString();
    var description = routeArgs['description'].toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$productName $productImage $productPrice $shortDescription $description',
        ),
      ),
      body: Text('$productId $productName $productImage $productPrice $shortDescription $description'),
    );
  }
}
