import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/cached_svg.dart';

class LearningGuideCard extends StatelessWidget {
  const LearningGuideCard({
    Key? key,
    required this.num,
    required this.svgUrl,
    required this.title,
  }) : super(key: key);
  final int num;
  final String title, svgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 235.w,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Colors.white,
          width: 1.7.r,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10.h,
            left: 5.w,
            child: Text(
              '$num',
              style: TextStyle(
                color: Colors.white24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 140.sp,
              ),
            ),
          ),
          Positioned(
            bottom: 25.h,
            right: 20.w,
            child: SizedBox(
              width: 140.w,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color.fromRGBO(36, 21, 95, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.h,
            right: 16.w,
            child: CachedSvg(
              svgUrl: svgUrl,
              width: 200.w,
            ),
          ),
        ],
      ),
    );
  }
}
