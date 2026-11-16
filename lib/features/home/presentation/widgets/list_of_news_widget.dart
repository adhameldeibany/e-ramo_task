import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_e_ramo/features/home/presentation/widgets/news_widget.dart';
import '../../../../Core/config/app_assets.dart';


class ListOfNewsWidget extends StatelessWidget {
  const ListOfNewsWidget({super.key});

  final List<Map<String, String>> markets = const [
    {
      'title': 'أحدث سوق إيجاري',
      'description': 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      'image': Home.banner1,
    },
    {
      'title': 'أحدث سوق عقاري',
      'description': 'تعرف على أحدث الأخبار والتطورات في سوق العقارات وأهم الفرص المتاحة.',
      'image': Home.banner1,
    },
    {
      'title': 'أفضل الفرص العقارية',
      'description': 'اكتشف مجموعة من الفرص العقارية المميزة التي تناسب احتياجاتك.',
      'image': Home.banner1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: markets.length,
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final market = markets[index];
            return NewsWidget(
              image: market['image']!,
              title: market['title']!,
              description: market['description']!,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
