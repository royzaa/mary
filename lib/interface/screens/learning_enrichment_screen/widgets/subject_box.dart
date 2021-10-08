import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/cached_image.dart';

class SubjectBox extends StatelessWidget {
  const SubjectBox({
    Key? key,
    this.assetImage,
    this.lightAssetImage,
    this.icon,
    required this.isSelected,
    required this.title,
  }) : super(key: key);
  final bool isSelected;
  final IconData? icon;
  final String? assetImage;
  final String? lightAssetImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: isSelected ? 105.h : 95.h,
        width: isSelected ? 90.w : 85.w,
        curve: Curves.easeInQuart,
        padding: EdgeInsets.all(15.r),
        margin: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
            color:
                isSelected ? Theme.of(context).primaryColor : Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            boxShadow: [
              isSelected
                  ? BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      blurRadius: 50,
                      spreadRadius: 2,
                      offset: const Offset(0, 20),
                    )
                  : const BoxShadow(
                      color: Color.fromRGBO(137, 137, 137, 0.25),
                      blurRadius: 50,
                      spreadRadius: 5,
                      offset: Offset(0, 20),
                    ),
            ]),
        child: Column(
          children: [
            if (icon != null)
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.black,
                  size: 36.r,
                ),
              ),
            if (assetImage != null && lightAssetImage != null)
              Expanded(
                flex: 1,
                child: Image.asset(
                  isSelected ? lightAssetImage! : assetImage!,
                  fit: BoxFit.contain,
                ),
              ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ));
  }
}
