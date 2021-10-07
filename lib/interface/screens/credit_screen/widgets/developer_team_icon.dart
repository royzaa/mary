import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeveloperTeamIcon extends StatelessWidget {
  const DeveloperTeamIcon({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.roles,
    required this.sosmed,
    required this.sosmedUrl,
    required this.index,
  }) : super(key: key);
  final String name;
  final String imageUrl;
  final List<String> roles;
  final String sosmed;
  final String sosmedUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      enableFeedback: true,
      tooltip: 'look our profile',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      color: Colors.white,
      elevation: 20,
      offset: const Offset(0, -32),
      child: imageUrl == ''
          ? Container(
              height: 120.h,
              width: 60.w,
              margin: EdgeInsets.only(right: 20.w, left: index == 0 ? 20.w : 0),
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor),
              child: Icon(
                Icons.person,
                color: Colors.grey[200],
                size: 36.r,
              ),
            )
          : Container(
              height: 120.h,
              width: 60.w,
              margin: EdgeInsets.only(right: 20.w, left: index == 0 ? 20.w : 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: imageUrl == ''
                    ? Container(
                        height: 80.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[200],
                          size: 36.r,
                        ),
                      )
                    : Container(
                        height: 80.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                title: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Roles:',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              ...roles.map(
                (role) => Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  child: Text(
                    role,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 5.h,
              ),
              ListTile(
                title: Text(
                  '@' + sosmed,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                leading: const Icon(Icons.location_history_rounded),
                onTap: () async {
                  HapticFeedback.mediumImpact();
                  await canLaunch(sosmedUrl)
                      ? await launch(sosmedUrl)
                      : throw 'Could\'t access url';
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
