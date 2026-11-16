
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_e_ramo/Core/config/app_assets.dart';
import 'package:task_e_ramo/Core/config/app_color.dart';

class HomeFirstBannerSlider extends StatefulWidget {
  const HomeFirstBannerSlider({super.key});

  @override
  State<HomeFirstBannerSlider> createState() =>
      _HomeFirstBannerSliderState();
}

class _HomeFirstBannerSliderState
    extends State<HomeFirstBannerSlider> {
  final PageController controller = PageController();

  int currentIndex = 0;
  Timer? timer;

  final List<String> images = [
    Home.banner1,
    Home.banner1,
    Home.banner1,
    Home.banner1,
  ];

  void nextPage() {
    if (!controller.hasClients) return;

    if (currentIndex < images.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      controller.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (!controller.hasClients) return;

    if (currentIndex > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      controller.animateToPage(
        images.length - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 5),
          (timer) {
        nextPage();
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 2.5,
          child: PageView.builder(
            controller: controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'منزل أحلامك الآن متوفر',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'noto',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'مشروع كمبوند الشيخ زايد أكثر من 200 شقة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontFamily: 'noto',
                        ),
                      ),
                      SizedBox(height: 15.h),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 91.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'تواصل الآن',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: 'noto',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: nextPage,
                      child: Image.asset(
                        Home.right,
                        width: 35.sp,
                        height: 35.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: previousPage,
                      child: Image.asset(
                        Home.left,
                        width: 35.sp,
                        height: 35.sp,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
                (index) {
              return GestureDetector(
                onTap: () {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: currentIndex == index ? 9 : 8,
                  height: currentIndex == index ? 9 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? const Color(0xff00647a)
                        : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
