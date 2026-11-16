
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/config/app_assets.dart';

class NavBarPages extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int>? onTap;

  const NavBarPages({super.key,this.initialIndex = 2,this.onTap});

  @override
  State<NavBarPages> createState() => _NavBarPagesState();
}

class _NavBarPagesState extends State<NavBarPages> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }
  final Color activeColor = const Color(0xff005879);
  final Color inactiveColor = const Color(0xff50545A);

  final List<Map<String, dynamic>> items = [
    {'title': 'عقاراتي', 'icon': Navbar.buildings},
    {'title': 'العروض', 'icon': Navbar.offers},
    {'title': 'الرئيسية', 'icon': Navbar.Group},
    {'title': 'السوق', 'icon': Navbar.market},
    {'title': 'المطورون', 'icon': Navbar.developers},
  ];

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onTap?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 10.w,
            right: 10.w,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r), topRight: Radius.circular(15.r)),
              ),
            ),
          ),
          Positioned(
            left: 25.w,
            right: 25.w,
            top: 38.h,
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 7,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildItem(0),
                  _buildItem(1),
                  SizedBox(width: 65.w),
                  _buildItem(3),
                  _buildItem(4),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8.h,
            child: GestureDetector(
              onTap: () => changeTab(2),
              child: Container(
                width: 76.w,
                height: 76.w,
                decoration: BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4.w),
                  boxShadow: [
                    BoxShadow(
                      color: activeColor.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.home_outlined,color: Colors.white,size: 35.sp),
                    Positioned(
                      right: 17.w,
                      top: 23.h,
                      child: Container(
                        width: 15.w,
                        height: 15.w,
                        decoration: BoxDecoration(
                          color: activeColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white,width: 1.5),
                        ),
                        child: Icon(Icons.search,color: Colors.white,size: 10.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            child: Container(
              width: 142.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: const Color(0xffBFC5CD),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => changeTab(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 55.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              items[index]['icon'],
              width: 25.sp,
              height: 25.sp,
              color: isSelected ? activeColor : inactiveColor,
            ),
            SizedBox(height: 5.h),
            Text(
              items[index]['title'],
              style: TextStyle(
                fontFamily: 'noto',
                fontSize: 12.sp,
                color: isSelected ? activeColor : inactiveColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
