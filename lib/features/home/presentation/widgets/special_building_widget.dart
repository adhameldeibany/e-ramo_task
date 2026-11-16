
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SpecialBuildingWidget extends StatefulWidget {
  const SpecialBuildingWidget({super.key,required this.image,required this.price,required this.title,required this.area,required this.bedrooms,required this.bathrooms,required this.location,required this.daysAgo,this.logo,this.status='للبيع',this.isFeatured=true,this.initialFavorite=false,this.onTap,this.onFavoriteTap});
  final String image;
  final String price;
  final String title;
  final String area;
  final int bedrooms;
  final int bathrooms;
  final String location;
  final String daysAgo;
  final String? logo;
  final String status;
  final bool isFeatured;
  final bool initialFavorite;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onFavoriteTap;
  @override
  State<SpecialBuildingWidget> createState() => _SpecialBuildingWidgetState();
}
class _SpecialBuildingWidgetState extends State<SpecialBuildingWidget> {
  late bool isFavorite;
  static const Color primaryColor = Color(0xffFFBF00);
  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteTap?.call(isFavorite);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(38.r),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(38.r),
          border: Border.all(color: primaryColor,width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(37.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImage(),
              _buildDetails(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildImage() {
    return SizedBox(
      height: 155.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 102.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.r)),
              ),
              child: Center(
                child: Text(
                  widget.status,
                  style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'noto'),
                ),
              ),
            ),
          ),
          if (widget.isFeatured)
            Positioned(
              right: 0,
              bottom: 8,
              child: Container(
                height: 22.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), bottomLeft: Radius.circular(30.r)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star,color: Colors.black,size: 15.sp),
                    SizedBox(width: 4.w),
                    Text('مميز',style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.bold,fontFamily: 'noto',color: Colors.black)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
  Widget _buildDetails() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w,7.h,10.w,10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '${widget.price} ج.م',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'noto'),
                ),
              ),
              GestureDetector(
                onTap: toggleFavorite,
                child: Icon(isFavorite?Icons.favorite:Icons.favorite_border,color: Colors.red,size: 22.sp),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 13.sp,color: Colors.grey.shade600,fontFamily: 'noto'),
          ),
          SizedBox(height: 12.h),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _feature(icon: Icons.crop_square,value: widget.area),
                _feature(icon: Icons.bathtub_outlined,value: '${widget.bathrooms}'),
                _feature(icon: Icons.bed_outlined,value: '${widget.bedrooms}'),
              ],
            ),
          ),
          SizedBox(height: 11.h),
          Row(
            children: [
              Icon(Icons.location_on,size: 15.sp,color: Colors.grey.shade600),
              SizedBox(width: 3.w),
              Expanded(
                child: Text(
                  widget.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 11.sp,color: Colors.grey.shade700,fontFamily: 'noto'),
                ),
              ),
            ],
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                if (widget.logo != null)
                  Column(
                    children: [
                      Text(
                        'بواسطة',
                        style: TextStyle(fontSize: 11.sp,color: Colors.black,fontFamily: 'noto'),
                      ),
                      Image.asset(
                        widget.logo!,
                        width: 48.w,
                        height: 35.h,
                        fit: BoxFit.contain,
                        errorBuilder: (context,error,stackTrace) => SizedBox(width: 48.w,height: 35.h),
                      ),
                    ],
                  )
                else
                  SizedBox(width: 48.w),
                const Spacer(),
                Icon(Icons.access_time,size: 14.sp,color: Colors.grey.shade600),
                SizedBox(width: 4.w),
                Text(
                  widget.daysAgo,
                  style: TextStyle(fontSize: 11.sp,color: Colors.grey.shade600,fontFamily: 'noto'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _feature({required IconData icon,required String value}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value,style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontFamily: 'noto')),
        SizedBox(width: 3.w),
        Icon(icon,size: 17.sp,color: Colors.black87),
      ],
    );
  }
}
