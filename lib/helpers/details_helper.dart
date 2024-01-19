import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsHelper extends ChangeNotifier {
  int count = 0;
  int get getCount => count;

  incrementCount() {
    count++;
    notifyListeners();
  }

  decrementCount() {
    if (count > 0) {
      count--;
    }
    notifyListeners();
  }

  Widget appBar(
      {required BuildContext context,
      required void Function() onPress,
      required String image}) {
    return Container(
      padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 20.r),
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.orange.shade400,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0.r),
            child: IconButton(
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
          ),
          Container(
              padding: EdgeInsets.only(left: 40.r),
              height: 200.h,
              width: 300.w,
              child: Image.network(image))
        ],
      ),
    );
  }

  Widget content({
    required String name,
    required String desc,
    required String location,
    required void Function() onPress,
    required String price,
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(fontSize: 25.sp),
              ),
              Container(
                width: 55.w,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '4.0 ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                    Icon(
                      EvaIcons.star,
                      color: Colors.white,
                      size: 15.dg,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            desc,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 8,
            style: GoogleFonts.poppins(fontSize: 12.sp),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$location, 5km ',
                style:
                    GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.indianRupeeSign,
                      size: 15.dg,
                      color: Colors.white,
                    ),
                    Text(
                      ' $price.0 ',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Included: ',
                    style: GoogleFonts.poppins(fontSize: 15.sp),
                  ),
                  const Icon(
                    FontAwesomeIcons.bowlRice,
                    size: 15,
                  ),
                  Text(
                    ' Sambar, Chutney.',
                    style: GoogleFonts.poppins(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(color: Colors.black45),
        ],
      ),
    );
  }

  Widget addtoCart({required void Function() ontap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(15.r),
          child: GestureDetector(
            onTap: ontap,
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add to Cart',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    FontAwesomeIcons.cartPlus,
                    color: Colors.white,
                    size: 15.dg,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
