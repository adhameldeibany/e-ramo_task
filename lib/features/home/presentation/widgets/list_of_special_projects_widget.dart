
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/special_building_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/special_projects_widget.dart';
import '../../../../Core/config/app_assets.dart';

class ListOfSpecialProjectsWidget extends StatelessWidget {
  const ListOfSpecialProjectsWidget({super.key});
  final List<Map<String, dynamic>> buildings = const [
    {'image': Home.banner1, 'title1': 'كمبوند الشيخ زايد'},
    {'image': Home.banner1, 'title1': 'كمبوند الشيخ زايد'},
    {'image': Home.banner1, 'title1': 'كمبوند الشيخ زايد'},
    {'image': Home.banner1, 'title1': 'كمبوند الشيخ زايد'},
    {'image': Home.banner1, 'title1': 'كمبوند الشيخ زايد'},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemCount: buildings.length,
          separatorBuilder: (context, index) => SizedBox(width: 16.w),
          itemBuilder: (context, index) {
            final building = buildings[index];
            return SizedBox(
              width: 220.w,
              child: SpecialProjectsWidget(
                image: building['image'],
                title1: building['title1'],
                title: 'شقة سكنية للبيع تشطيب سوبر لوكس',
                area: '8,725 sqft',
                bedrooms: 5,
                bathrooms: 10,
                location: 'الشيخ زايد الجيزة',
                daysAgo: 'منذ 4 أيام',
                logo: Home.logo2,
                onTap: () {},
                onFavoriteTap: (value) {},
              ),
            );
          },
        ),
      ),
    );
  }
}
