import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosa_wala/helpers/product_page_helper.dart';
import 'package:dosa_wala/services/manage_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.queryDocumentSnapshot});
  final QueryDocumentSnapshot queryDocumentSnapshot;
  @override
  Widget build(BuildContext context) {
    var productHelper = Provider.of<ProductPageHelper>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productHelper.appBar(
              context: context, image: queryDocumentSnapshot['image']),
          productHelper.headerText(name: queryDocumentSnapshot['name']),
          FutureBuilder(
            future: Provider.of<ManageData>(context)
                .fetchData(queryDocumentSnapshot['name']),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return productHelper.listView(
                  collection: queryDocumentSnapshot['name'], context: context);
            },
          ),
        ],
      ),
    );
  }
}
