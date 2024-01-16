import 'package:dosa_wala/services/manage_data.dart';
import 'package:dosa_wala/views/detail_screen.dart';
import 'package:dosa_wala/views/product_list.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

//This helper class contains widgets used in home page
class HomePageHelper extends ChangeNotifier {
  List<String> menu = [
    'assets/images/ksadya.png',
    'assets/images/Puttu.png',
  ];

//This widget contains app bar of home page
  Widget appBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.house,
                      color: Colors.orange.shade300,
                      size: 18.dg,
                    ),
                  ),
                  Text(
                    'Home',
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0.r),
                child: Text(
                  textAlign: TextAlign.center,
                  'TC 27/1869, Flat Number 211..',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0.r),
            child: IconButton(
              onPressed: () {},
              icon: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Icon(
                  FontAwesomeIcons.userAstronaut,
                  size: 26,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
//--------------------------------------------------------------//

//This widget is the heading for category
  Widget catText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.h,
          width: 80.w,
          decoration: const BoxDecoration(color: Colors.grey),
        ),
        Text(
          '''What's on your mind''',
          style:
              GoogleFonts.poppins(fontSize: 15.sp, color: Colors.grey.shade600),
        ),
        Container(
          height: 1.h,
          width: 80.w,
          decoration: const BoxDecoration(color: Colors.grey),
        ),
      ],
    );
  }
//----------------------------------------------------------------------//

//This widget is for icons in category in home page
  Widget iconCategory({required BuildContext context, required collection}) {
    return Padding(
      padding: EdgeInsets.all(5.r),
      child: FutureBuilder(
          future: Provider.of<ManageData>(context, listen: false)
              .fetchData(collection),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: ProductListScreen(
                                queryDocumentSnapshot: snapshot.data[index]),
                            type: PageTransitionType.leftToRight),
                      );
                    },
                    child: SizedBox(
                      width: 111.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80.h,
                            child: Image.network(
                              snapshot.data[index].data()['image'],
                            ),
                          ),
                          Text(
                            snapshot.data[index].data()['name'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
//---------------------------------------------------------------------//

//This widget is todays special
  Widget todaysSpecial(
      {required BuildContext context, required String collection}) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: FutureBuilder(
          future: Provider.of<ManageData>(context).fetchData(collection),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
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
                      padding: EdgeInsets.only(left: 15.0.r),
                      child: Container(
                        width: 275.w,
                        height: 233.5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0.5, 1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40.0.r),
                                  child: SizedBox(
                                    height: 170.h,
                                    child: Image.network(
                                        snapshot.data[index].data()['image']),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                      height: 55.h,
                                      child: Image.asset(
                                          'assets/images/chiillman.png')),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5.r, right: 15.r, top: 5.r),
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade400,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data[index].data()['name'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Price',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18.sp,
                                                color: Colors.white),
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.indianRupeeSign,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['price'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 55.w,
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
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
//------------------------------------------------------------------------//

//This widget is header text in home page
  Widget headerText({
    required String text1,
    required double text1size,
    required String text2,
    required double text2size,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 20.r, left: 15.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 90.h,
            child: Image.asset('assets/images/man.jpg'),
          ),
          SizedBox(
            width: 20.h,
          ),
          RichText(
            text: TextSpan(
              text: text1,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: text1size.sp,
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: text2,
                  style: GoogleFonts.poppins(
                    color: Colors.orange.shade400,
                    fontSize: text2size.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //-------------------------------------------------------------------//
}
