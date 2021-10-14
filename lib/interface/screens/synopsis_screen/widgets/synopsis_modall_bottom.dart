import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './start_learning_button.dart';

class SynopsisModalBottom extends StatelessWidget {
  const SynopsisModalBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      minChildSize: 0.4,
      maxChildSize: 1,
      initialChildSize: 0.4,
      builder: (contex, controller) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.r),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.r),
                ),
              ),
              padding: EdgeInsets.only(left: 25.w, top: 55.h, right: 40.w),
              child: SingleChildScrollView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Wonderful City Vehicles',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '''        I have a car, a city car. The car is very helpful for my family. It transports the family members to the workplaces and schools or to somewhere we want to go.
        My car is white just like snow. That is why I call it Snow White.  What makes the specific of the snow white is the interior of it. The seats are covered with cream and black leather. There is the “VS” logo in the head of the seats. Not only about the seat cover, I also put two accessories behind the front seats. I hang two cream accessories to put bottles and tissue in. They make us tide. Besides, I put three little dash bins in my Snow White, in front, in the middle, and I the back. The bins make my car clean. I always throw the trash after getting out of the car.
''',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              top: -30.h,
              child: const StartLearningButton(),
            )
          ],
        ),
      ),
    );
  }
}
