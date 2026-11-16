import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_e_ramo/Core/config/app_assets.dart';

class HeaderHomeWidget extends StatefulWidget {
  const HeaderHomeWidget({super.key});

  @override
  State<HeaderHomeWidget> createState() => _HeaderHomeWidgetState();
}

class _HeaderHomeWidgetState extends State<HeaderHomeWidget> {
  final TextEditingController searchController = TextEditingController();

  String city = 'القاهرة';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: SvgPicture.asset(
                          width: 34.sp,
                          height: 34.sp,
                          Home.menu),
                    ),
                    SizedBox(width: 16.w,),
                    InkWell(
                      onTap: (){},
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                              width: 34.sp,
                              height: 34.sp,
                              Home.notification),
                          _badge('2'),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w,),
                    InkWell(
                      onTap: (){},
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            width: 34.sp,
                              height: 34.sp,
                              Home.message),
                          _badge('5'),
                        ],
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'القاهرة', child: Text('القاهرة')),
                    PopupMenuItem(value: 'الجيزة', child: Text('الجيزة')),
                    PopupMenuItem(value: 'الإسكندرية', child: Text('الإسكندرية')),
                  ],
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_arrow_down),
                      Text(
                        city,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: 42.sp,
                decoration: BoxDecoration(
                  color: Color(0xffeeeeef),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    debugPrint('Search: $value');
                  },
                  decoration: InputDecoration(
                    hintText: 'كيف يمكننا مساعدتك',
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey, fontFamily: 'noto'),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: -2.5.h),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String number) {
    return Positioned(
      right: 2,
      bottom: -3,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          number,
          style: TextStyle(color: Colors.white, fontSize: 9),
        ),
      ),
    );
  }
}
