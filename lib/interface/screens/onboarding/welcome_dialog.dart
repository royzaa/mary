import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/shared_preferences.dart';

class WelcomeDialog extends StatefulWidget {
  const WelcomeDialog({Key? key}) : super(key: key);

  @override
  State<WelcomeDialog> createState() => _WelcomeDialogState();
}

class _WelcomeDialogState extends State<WelcomeDialog> {
  final formKey = GlobalKey<FormState>();
  bool validate() {
    bool status = false;
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      status = true;
    } else {
      status = false;
    }
    return status;
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Dialog(
        insetAnimationCurve: Curves.easeInCirc,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 30.h,
            ),
            // width: size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: size.height * 0.15.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  padding: EdgeInsets.all(15.r),
                  child: SvgPicture.network(
                    'https://drive.google.com/uc?id=1oRPlh_GlRFhR4FcT9i1jBhWsqF6-jXQz',
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) => const Center(
                      child: PlaceholderLines(
                        count: 3,
                        animate: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Hi, what\'s your name?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12.5.h,
                ),
                Text(
                  'Would you like to introduce your self to us? I am very happy to meet you',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Form(
                  key: formKey,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) {
                      if (name == '' || name!.isEmpty) {
                        return 'Please input your name corectly';
                      } else {
                        return null;
                      }
                    },
                    controller: controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 24.r,
                      ),
                      labelText: 'Your name',
                      labelStyle: const TextStyle(color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                  onPressed: () {
                    if (validate()) {
                      DataSharedPreferences.setTitle(controller.text);
                      Navigator.pop(context, controller.text);
                    }
                  },
                  child: SizedBox(
                    width: size.width * 0.5.w,
                    child: Text(
                      'Let\'s go!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.r,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text(
                    'Exit, I\'ll try later',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.r),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
