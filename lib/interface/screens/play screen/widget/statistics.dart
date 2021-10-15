import 'package:flutter/material.dart';
import 'package:mary/interface/widget/cached_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/shared_preferences.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late List<int> allQuizTrack;
  int totalMark = 0;
  late int expectedMark;
  double accuracy = 0;
  late List<int> completion;
  int totalCorrectQuestion = 0;
  late double completionProgress;
  @override
  void initState() {
    allQuizTrack = DataSharedPreferences.getQuizTracking();
    debugPrint(allQuizTrack.toString());
    if (allQuizTrack.isNotEmpty) {
      expectedMark = allQuizTrack.length * 100;
      for (var e in allQuizTrack) {
        totalMark += e;
      }
      accuracy = totalMark / expectedMark * 100;
    }

    final firstQuizCompletion = DataSharedPreferences.getFirstQuizCompletion();
    debugPrint(firstQuizCompletion.toString());
    for (var e in firstQuizCompletion) {
      totalCorrectQuestion += e;
    }

    final secondQuizCompletion =
        DataSharedPreferences.getSecondQuizCompletion();
    debugPrint(secondQuizCompletion.toString());
    for (var e in secondQuizCompletion) {
      totalCorrectQuestion += e;
    }

    completionProgress = totalCorrectQuestion / 200 * 100;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    animation = IntTween(
      begin: 0,
      end: accuracy.toInt(),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutSine),
    );

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return allQuizTrack.isEmpty
        ? SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                CachedSvg(
                  svgUrl:
                      'https://drive.google.com/uc?id=1_HNwq3v80pFZKOpI7R5iiNjZ0oxjyHgI',
                  fit: BoxFit.contain,
                  width: 250.w,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Oops you don\'t have any statistics, try the quiz!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        : NotificationListener(
            child: SizedBox(
              height: 110.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// accuracy
                  SizedBox(
                    width: 144.w,
                    height: 144.w,
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
                              axisLineStyle: AxisLineStyle(
                                thickness: 4.w,
                                color: Colors.white,
                              ),
                              pointers: [
                                RangePointer(
                                  onValueChanged: (value) {
                                    debugPrint(value.toString());
                                  },
                                  enableDragging: true,
                                  enableAnimation: true,
                                  animationDuration: 2000,
                                  animationType: AnimationType.bounceOut,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 10.w,
                                  color: Theme.of(context).primaryColor,
                                  value: accuracy,
                                  pointerOffset: -3,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(24.r),
                          width: size.width.w * 0.25,
                          height: size.width.h * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.25),
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
                                    '${animation.value} %',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ),
                              Text(
                                'Accuracy',
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
                  SizedBox(
                    width: 20.w,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Completion',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: SfLinearGauge(
                              showTicks: false,
                              showLabels: false,
                              maximum: 100,
                              minimum: 0,
                              axisTrackStyle: LinearAxisTrackStyle(
                                edgeStyle: LinearEdgeStyle.bothCurve,
                                thickness: 6.w,
                              ),
                              barPointers: [
                                LinearBarPointer(
                                  value: completionProgress,
                                  animationType: LinearAnimationType.slowMiddle,
                                  color: Colors.yellow,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  enableAnimation: true,
                                  thickness: 8.w,
                                  position: LinearElementPosition.cross,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '$completionProgress %',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Container(
                        color: Colors.grey[200],
                        height: 1,
                        width: 140.w,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total correct answer :   ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${(totalMark / 20).round()}',
                            style: TextStyle(
                              color: const Color.fromRGBO(
                                255,
                                135,
                                123,
                                1,
                              ),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Container(
                        color: Colors.grey[200],
                        height: 1,
                        width: 140.w,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Number of try :   ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${allQuizTrack.length} times',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
