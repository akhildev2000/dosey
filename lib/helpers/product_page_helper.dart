import 'package:dosa_wala/services/manage_data.dart';
import 'package:dosa_wala/views/detail_screen.dart';
import 'package:dosa_wala/views/home_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProductPageHelper extends ChangeNotifier {
  Widget appBar({required String image, required BuildContext context}) {
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
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const HomePage(),
                      type: PageTransitionType.leftToRight));
            },
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
          SizedBox(height: 300.h, child: Image.network(image)),
        ],
      ),
    );
  }

  Widget headerText({required name}) {
    return Container(
      padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 10.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 25.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' A popular breakfast food in Southern India ',
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                width: 70.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter',
                      style: GoogleFonts.poppins(fontSize: 15.sp),
                    ),
                    Icon(
                      FontAwesomeIcons.arrowUpWideShort,
                      size: 15.dg,
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider(color: Colors.grey)
        ],
      ),
    );
  }

  Widget listView({required BuildContext context, required collection}) {
    return SizedBox(
      height: 500.h,
      child: FutureBuilder(
          future: Provider.of<ManageData>(context).fetchData(collection),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data.isEmpty) {
              return const Center(
                child: Text('Coming Soon'),
              );
            }
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailsScreen(
                                  queryDocumentSnapshot: snapshot.data[index]),
                              type: PageTransitionType.leftToRight));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.r, right: 10.r, top: 5.r),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0.r),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 130.h,
                                  width: 100.w,
                                  child: Image.network(
                                    snapshot.data[index].data()['image'],
                                    fit: BoxFit.cover,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data[index].data()['name'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      width: 65.w,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                    ),
                                    SizedBox(height: 15.h),
                                    Text(
                                      '30-45 mins',
                                      style:
                                          GoogleFonts.poppins(fontSize: 15.sp),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['location'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 13.sp,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    Text(
                                      'Nearer, 3km',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13.sp,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(EvaIcons.moreVertical)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
