
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VillaWidget extends StatefulWidget {
  const VillaWidget({super.key,required this.image,required this.price,required this.title,required this.area,required this.bedrooms,required this.bathrooms,required this.location,required this.daysAgo,this.logo,this.status='للبيع',this.onTap,this.onFavoriteTap});

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
  final VoidCallback? onTap;
  final ValueChanged<bool>? onFavoriteTap;

  @override
  State<VillaWidget> createState() => _VillaWidgetState();
}

class _VillaWidgetState extends State<VillaWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(22.r),
      child: Container(
        width: 400.w,
        height: 178.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(color: Colors.grey.shade300,width: 0.8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context,error,stackTrace) => Container(color: Colors.grey.shade300),
                      ),
                      Positioned(
                        top: 10.h,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 7.h),
                          decoration: BoxDecoration(
                            color: Color(0xffeeeeee),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(2.r),
                            ),
                          ),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xff00647a),
                              fontFamily: 'noto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                                widget.onFavoriteTap?.call(isFavorite);
                              },
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                                size: 21.sp,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '${widget.price} ج.م',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'noto',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                            fontFamily: 'noto',
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _feature(widget.area,Icons.crop_square),
                              _feature('${widget.bathrooms}',Icons.bathtub_outlined),
                              _feature('${widget.bedrooms}',Icons.bed_outlined),
                            ],
                          ),
                        ),
                        SizedBox(height: 9.h),
                        Row(
                          children: [
                            Icon(Icons.location_on,size: 14.sp,color: Colors.grey),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Text(
                                widget.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey.shade600,
                                  fontFamily: 'noto',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.h),
                        Expanded(
                          child: Directionality(
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
                                        width: 43.w,
                                        height: 30.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  )
                                else
                                  SizedBox(width: 43.w),
                                const Spacer(),
                                Icon(Icons.access_time,size: 13.sp,color: Colors.grey),
                                SizedBox(width: 3.w),
                                Text(
                                  widget.daysAgo,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade600,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _feature(String value,IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 11.sp,color: Colors.black87,fontFamily: 'noto'),
        ),
        SizedBox(width: 2.w),
        Icon(icon,size: 16.sp,color: Colors.black87),
      ],
    );
  }
}
