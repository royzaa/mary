import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCard extends StatefulWidget {
  const ResultCard({
    Key? key,
    required this.mediaQuery,
    required this.score,
  }) : super(key: key);

  final Size mediaQuery;
  final int score;

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2300), vsync: this);
    animation = IntTween(begin: 0, end: widget.score).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    animationController.forward();

    // print('counter: ${animation.value}');
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: widget.mediaQuery.width.w,
      height: widget.mediaQuery.height * 0.6,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.35),
            offset: const Offset(0, 10),
            spreadRadius: 3,
            blurRadius: 20,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 25.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Text(
              'Congratulation',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: widget.mediaQuery.width.w * 0.5,
            child: Text(
              'Your experiences have increased by',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: widget.mediaQuery.width * 0.45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.white,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SfRadialGauge(
                  axes: [
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      startAngle: 0,
                      endAngle: 0,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle:
                          AxisLineStyle(thickness: 4.r, color: Colors.white),
                      pointers: [
                        RangePointer(
                          enableDragging: true,
                          enableAnimation: true,
                          animationDuration: 2000,
                          animationType: AnimationType.bounceOut,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 8.w,
                          color: Theme.of(context).primaryColor,
                          value: widget.score.toDouble(),
                          pointerOffset: -1,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(24.r),
                  width: widget.mediaQuery.width.w * 0.25,
                  height: widget.mediaQuery.width.h * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                        blurRadius: 20.r,
                        spreadRadius: 3,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedBuilder(
                        animation: animationController,
                        builder: (BuildContext context, Widget? child) {
                          return Text(
                            '${animation.value}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      Text(
                        'points',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Keep up your spirit!",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
