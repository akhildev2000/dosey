import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartHelper extends ChangeNotifier {
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

  Widget appBar({required BuildContext context}) {
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(50.r),
              ),
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

  Widget item({required String name, required String image}) {
    return Padding(
      padding: EdgeInsets.all(13.r),
      child: Container(
        width: double.infinity,
        height: 250.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(0.5, 1),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(fontSize: 20.sp),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 25.r,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          incrementCount();
                          
                        },
                        icon: Icon(
                          EvaIcons.plusCircle,
                          color: Colors.orange.shade400,
                          size: 20.dg,
                        ),
                      ),
                      Text(count.toString()),
                      IconButton(
                        onPressed: () {
                          decrementCount();
                        },
                        icon: Icon(
                          EvaIcons.minusCircle,
                          color: Colors.orange.shade400,
                          size: 20.dg,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
