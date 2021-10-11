import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionBox extends StatelessWidget {
  const ActionBox({
    Key? key,
    required this.url,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String url, title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    debugPrint(url + '.jpg');
    return Container(
      height: 260.h,
      //clipBehavior: Clip.none,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(url,
                width: MediaQuery.of(context).size.width,
                height: 260.h,
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.6),
                color: Colors.black26,
                colorBlendMode: BlendMode.darken,
                cacheHeight: 260.h.toInt(),
                loadingBuilder: (context, child, loading) {
              if (loading != null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              return child;
            }),
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 170.w,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (onTap != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(153.w, 53.h),
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        onPressed: onTap,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 102, 255, 0.15),
                                  offset: Offset(0, 5),
                                  spreadRadius: 5,
                                  blurRadius: 20),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 28.r,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Play video',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
