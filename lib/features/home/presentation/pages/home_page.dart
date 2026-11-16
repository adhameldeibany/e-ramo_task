import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/header_home_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/home_first_banner_slider.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/home_second_banner_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/list_of_apartment_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/list_of_doplex_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/list_of_news_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/list_of_search_building_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/list_of_special_building_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/list_of_special_projects_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/list_of_villa_widget.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/see_all_widget.dart';
import 'package:task_e_ramo/features/navbar/presentation/pages/nav_bar_pages.dart';
import '../../../../Core/config/app_assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffFFFFFF),
      bottomNavigationBar: NavBarPages(
        initialIndex: 2,
        onTap: (index) {
          if (index == 2) {
            setState(() {});
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 165.w,
                      height: 28.h,
                      child: Image.asset(Home.logo)
                  ),
                ],
              ),
              SizedBox(height: 41.h,),
              HeaderHomeWidget(),
              SizedBox(height: 16.h,),
              HomeFirstBannerSlider(),
              SizedBox(height: 80.h,),
              SeeAllWidget(title: 'عقارات مميزة في مصر'),
              SizedBox(height: 16.h,),
              ListOfSpecialBuildingWidget(),
              SizedBox(height: 80.h,),
              SeeAllWidget(title: 'اهم المشاريع العقارية في مصر'),
              SizedBox(height: 16.h,),
              ListOfSpecialProjectsWidget(),
              SizedBox(height: 80.h,),
              SeeAllWidget(title: 'إبحث عن عقارك بالمدينة'),
              SizedBox(height: 16.h,),
              ListOfSearchBuildingWidget(),
              SizedBox(height: 80.h,),
              HomeSecondBannerWidget(),
              SizedBox(height: 80.h,),
              SeeAllWidget(title: 'أحدث الشقق في مصر'),
              SizedBox(height: 16.h,),
              ListOfApartmentWidget(),
              SizedBox(height: 80.h,),
              SeeAllWidget(title: 'أحدث الفيلات في مصر'),
              SizedBox(height: 16.h,),
              ListOfVillaWidget(),
              SizedBox(height: 80.h,),
              SeeAllWidget(title: 'أحدث الدوبلكس في مصر'),
              SizedBox(height: 16.h,),
              ListOfDoplexWidget(),
              SizedBox(height: 80.h,),
              SeeAllWidget(title: 'اهم الأخبار'),
              SizedBox(height: 16.h,),
              ListOfNewsWidget(),
              SizedBox(height: 40.h,),
            ],
          ),
        ),
      ),
    );
  }
}
