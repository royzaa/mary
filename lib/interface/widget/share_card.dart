import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import './cached_image.dart';

final globalKey = GlobalKey();

class ShareCard extends StatelessWidget {
  const ShareCard({Key? key, required this.score}) : super(key: key);
  final int score;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RepaintBoundary(
      key: globalKey,
      child: AspectRatio(
        aspectRatio: 18 / 11,
        child: Container(
          width: size.width,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(79, 88, 170, 1),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                top: -12.h,
                right: -100.w,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/city.png',
                    fit: BoxFit.fitWidth,
                    width: 620.w,
                    color: const Color.fromRGBO(79, 88, 170, 1),
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Positioned(
                right: 35.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Let\'s play Mary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      'My Wonderful City Vehicles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 23.w,
                child: SizedBox(
                  width: 125.w,
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
                                value: score.toDouble(),
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
                            Text(
                              'Hi, I got',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 10.sp,
                              ),
                            ),
                            Text(
                              '$score',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'in Mary',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 18.r,
                right: 35.w,
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CachedImage(
                        imageUrl:
                            'https://drive.google.com/uc?id=1FoA5L4NfOUjfJGbsaYcmOMoOm6BEQeEi',
                        height: 18.r,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'MARY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> createCard() async {
  bool status = false;
  try {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 4);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final dir = Directory.systemTemp;
      final File file = File('${dir.path}/card.png');
      await file.writeAsBytes(pngBytes, mode: FileMode.write);
      status = true;
    }
  } catch (e) {
    debugPrint('failed to write card: $e');
  }
  return status;
}
