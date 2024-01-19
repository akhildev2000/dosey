import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosa_wala/helpers/details_helper.dart';
import 'package:dosa_wala/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.queryDocumentSnapshot});
  final QueryDocumentSnapshot queryDocumentSnapshot;
  @override
  Widget build(BuildContext context) {
    var detailsHelper = Provider.of<DetailsHelper>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailsHelper.appBar(
            context: context,
            onPress: () {
              Navigator.pop(context);
            },
            image: queryDocumentSnapshot['image'],
          ),
          detailsHelper.content(
              name: queryDocumentSnapshot['name'],
              desc: queryDocumentSnapshot['desc'],
              location: queryDocumentSnapshot['location'],
              onPress: () {},
              price: queryDocumentSnapshot['price']),
          detailsHelper.addtoCart(ontap: () {
            Navigator.push(
              context,
              PageTransition(
                child: CartScreen(
                  queryDocumentSnapshot: queryDocumentSnapshot,
                ),
                type: PageTransitionType.leftToRight,
              ),
            );
          }),
        ],
      ),
    );
  }
}
