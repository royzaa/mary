import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/cached_image.dart';

class Attribution extends StatelessWidget {
  const Attribution({Key? key, required this.brandName, required this.logoUrl})
      : super(key: key);
  final String brandName;
  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: CachedImage(
            imageUrl: logoUrl,
            width: size.width * 0.8,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Text(
            brandName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
