import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dosa_wala/helpers/details_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.queryDocumentSnapshot});
  final QueryDocumentSnapshot queryDocumentSnapshot;
  @override
  Widget build(BuildContext context) {
    var detailsHelper = Provider.of<DetailsHelper>(context);
    return Scaffold(
      body: Column(
        children: [
          detailsHelper.appBar(
              context: context,
              onPress: () {
                Navigator.pop(context);
              }),
          detailsHelper.header(
            image: queryDocumentSnapshot['image'],
          ),
        ],
      ),
    );
  }
}
