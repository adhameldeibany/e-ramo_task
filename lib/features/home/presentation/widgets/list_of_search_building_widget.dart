
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/search_building_widget.dart';
import '../../../../Core/config/app_assets.dart';

class ListOfSearchBuildingWidget extends StatelessWidget {
  const ListOfSearchBuildingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cities = [
      SearchBuildingWidget(
        image: Home.cairo,
        cityName: 'القاهرة',
        saleCount: 505,
        rentCount: 1002,
        onTap: () {},
      ),
      SearchBuildingWidget(
        image: Home.giza,
        cityName: 'الجيزة',
        saleCount: 505,
        rentCount: 1002,
        onTap: () {},
      ),
      SearchBuildingWidget(
        image: Home.cairo,
        cityName: 'القاهرة',
        saleCount: 505,
        rentCount: 1002,
        onTap: () {},
      ),
    ];
    return SizedBox(
      height: 260.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: cities.length,
          separatorBuilder: (context,index) => SizedBox(width: 14.w),
          itemBuilder: (context,index) => cities[index],
        ),
      ),
    );
  }
}
