import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosa_wala/helpers/cart_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.queryDocumentSnapshot});
  final QueryDocumentSnapshot queryDocumentSnapshot;
  @override
  Widget build(BuildContext context) {
    var cartHelper = Provider.of<CartHelper>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          cartHelper.appBar(context: context),
          cartHelper.item(
              name: queryDocumentSnapshot['name'],
              image: queryDocumentSnapshot['image']),
        ],
      ),
    );
  }
}
