import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartLearningButton extends StatelessWidget {
  const StartLearningButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.125.h,
        minWidth: size.width * 0.4.w,
        maxWidth: size.width * 0.5.w,
        minHeight: size.height * 0.08.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => ElevatedButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
          },
          style: ElevatedButton.styleFrom(
            maximumSize: Size(constraints.maxWidth, constraints.maxHeight),
            minimumSize: Size(constraints.minWidth, constraints.minHeight),
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            primary: const Color.fromRGBO(
              255,
              135,
              127,
              1,
            ),
            shadowColor: const Color.fromRGBO(
              255,
              135,
              127,
              0.25,
            ),
            elevation: 20,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraints.maxWidth - 40.w - 24.w - 15.w,
                child: FittedBox(
                  child: Text(
                    'Start learning',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
