
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBuildingWidget extends StatelessWidget {
  const SearchBuildingWidget({
    super.key,
    required this.image,
    required this.cityName,
    required this.saleCount,
    required this.rentCount,
    this.onTap,
  });

  final String image;
  final String cityName;
  final int saleCount;
  final int rentCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 194.w,
        height: 260.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.7,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: Colors.grey.shade300);
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.65),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  cityName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'noto',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: 10.w,
                bottom: 12.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عقارات للبيع : $saleCount',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontFamily: 'noto',
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'عقارات للإيجار : $rentCount',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontFamily: 'noto',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
