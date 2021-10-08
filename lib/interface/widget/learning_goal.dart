import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './cached_svg.dart';

class LearningGoal extends StatelessWidget {
  const LearningGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final learningGoal = <String>[
      'Siswa dapat menyusun teks deskripsi berisi karakteristik kendaraan transportasi kota',
      'Siswa mampu menyimpulkan penerapan Hukum Newton dari suatu fenomena ',
      'Siswa mampu menghitung luas dan volume geometri dari objek pada kendaraan transportasi kota. ',
    ];
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.3,
        maxChildSize: 1.0,
        builder: (context, contoller) {
          return SingleChildScrollView(
            controller: contoller,
            child: Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: 20.h,
                    right: 20.w,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 24.r,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 28.h,
                      horizontal: 20.w,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Learning goal',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CachedSvg(
                          svgUrl:
                              'https://drive.google.com/uc?id=1BCjZ57grYVjc2-IoshXqlg_w6zr82Gf9',
                          width: 250.w,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 200.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...learningGoal.asMap().entries.map((entry) {
                                final goal = entry.value;
                                final index = entry.key + 1;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 25.h,
                                        width: 25.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          index.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Flexible(
                                        child: Text(
                                          goal,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }).toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
