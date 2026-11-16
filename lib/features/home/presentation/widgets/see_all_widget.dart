
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    super.key,
    required this.title,
    this.actionText = 'مشاهدة الكل',
    this.onActionTap,
  });

  final String title;
  final String actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onActionTap,
            child: Text(
              actionText,
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff6C6C6C),
                fontFamily: 'noto',
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'noto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
