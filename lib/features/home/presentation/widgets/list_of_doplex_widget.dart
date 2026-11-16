
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/special_building_widget.dart';
import '../../../../Core/config/app_assets.dart';
import 'apartment_widget.dart';

class ListOfDoplexWidget extends StatefulWidget {
  const ListOfDoplexWidget({super.key});
  @override
  State<ListOfDoplexWidget> createState() => _ListOfDoplexWidgetState();
}

class _ListOfDoplexWidgetState extends State<ListOfDoplexWidget> {
  int selectedFilter = 0;
  final List<Map<String, dynamic>> buildings = [
    {'type': 'بيع', 'image': Home.doplex, 'price': '4,000,000'},
    {'type': 'إيجار', 'image': Home.doplex, 'price': '25,000'},
    {'type': 'بيع', 'image': Home.doplex, 'price': '3,500,000'},
    {'type': 'إيجار', 'image': Home.doplex, 'price': '18,000'},
    {'type': 'بيع', 'image': Home.doplex, 'price': '5,000,000'},
  ];

  List<Map<String, dynamic>> get filteredBuildings {
    if (selectedFilter == 1) {
      return buildings.where((item) => item['type'] == 'بيع').toList();
    }
    if (selectedFilter == 2) {
      return buildings.where((item) => item['type'] == 'إيجار').toList();
    }
    return buildings;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                _filterItem('الكل', 0),
                _divider(),
                _filterItem('للبيع', 1),
                _divider(),
                _filterItem('للإيجار', 2),
              ],
            ),
          ),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 171.h,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: filteredBuildings.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                final building = filteredBuildings[index];
                return SizedBox(
                  width: 378.w,
                  child: ApartmentWidget(
                    image: building['image'],
                    price: building['price'],
                    title: 'دوبلكس للبيع تشطيب سوبر ...',
                    area: '8,725sqft',
                    bedrooms: 5,
                    bathrooms: 10,
                    location: 'الشيخ زايد الجيزة',
                    daysAgo: 'منذ 4 أيام',
                    logo: Home.logo2,
                    status: building['type'] == 'بيع' ? 'للبيع' : 'للإيجار',
                    onTap: () {},
                    onFavoriteTap: (value) {},
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _filterItem(String title, int index) {
    final isSelected = selectedFilter == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'noto',
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(height: 14.h, width: 1, color: Colors.grey.shade300);
  }
}
