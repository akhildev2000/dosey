
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsHelper extends ChangeNotifier {
  Widget appBar(
      {required BuildContext context, required void Function() onPress}) {
    return Container(
      padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 20.r),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.orange.shade400,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPress,
            icon: Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Icon(
                EvaIcons.arrowBackOutline,
                size: 25.dg,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget header({required String image}) {
    return Container(
      child: Image.network(image),
    );
  }
}
