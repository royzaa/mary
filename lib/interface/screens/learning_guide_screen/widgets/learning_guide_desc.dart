import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearningGuideDesc extends StatefulWidget {
  const LearningGuideDesc({
    Key? key,
    required this.desc,
  }) : super(key: key);
  final String desc;

  @override
  State<LearningGuideDesc> createState() => _LearningGuideDescState();
}

class _LearningGuideDescState extends State<LearningGuideDesc> {
  final GlobalKey textKey = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (textKey.currentContext != null) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tips',
            style: TextStyle(
              fontSize: 17.sp,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Builder(builder: (context) {
                if (textKey.currentContext != null) {
                  final box =
                      textKey.currentContext!.findRenderObject() as RenderBox;
                  return Container(
                    width: 1.5,
                    height: box.size.height,
                    color: Colors.grey,
                  );
                } else {
                  return const SizedBox();
                }
              }),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: SizedBox(
                  width: 220.w,
                  child: Text(
                    widget.desc,
                    key: textKey,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
