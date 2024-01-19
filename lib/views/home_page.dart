import 'package:dosa_wala/helpers/home_page_helper.dart';
import 'package:dosa_wala/services/manage_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

///Sec-1 APPBAR
//Sec-2 HEADERTEXT
//Sec-3 CATEGORY
//Sec-4 TODAY'SSPECIAL
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homehelper = Provider.of<HomePageHelper>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () => Provider.of<ManageData>(context).fetchData('fav'),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Sec-1 APPBAR
              homehelper.appBar(context),

              //Sec-2 HEADERTEXT
              homehelper.headerText(
                text1: 'Welcome to ',
                text2: '\ntaste of India',
                text1size: 30,
                text2size: 32,
              ),
              SizedBox(height: 20.h),

              //Sec-3 CATEGORY
              homehelper.catText(),
              Padding(
                padding: EdgeInsets.only(left: 10.r),
                child: SizedBox(
                  height: 118.h,
                  child: homehelper.iconCategory(
                    collection: 'menu',
                    context: context,
                  ),
                ),
              ),

              //Sec-4 TODAY'SSPECIAL
              Padding(
                padding: EdgeInsets.only(left: 20.r, top: 15.r),
                child: Text(
                  '''Today's Special''',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                  height: 263.h,

                  ///width: 300.w,
                  child: homehelper.todaysSpecial(
                      context: context, collection: 'Idli')),
            ],
          ),
        ),
      ),
    );
  }
}
