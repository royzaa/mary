import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';

import '../../../services/shared_preferences.dart';

final formKey = GlobalKey<FormState>();

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Dialog(
      insetAnimationCurve: Curves.easeInCirc,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          height: size.width < 330 ? size.height * 0.8 : size.height * 0.6,
          // width: size.width * 0.7,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(15),
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
                const Text(
                  'Hi, what\'s your name?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Would you like to introduce your self to us? I am very happy to meet you',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
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
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      labelText: 'Your name',
                      labelStyle: TextStyle(color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  onPressed: () {
                    if (validate()) {
                      DataSharedPreferences.setTitle(controller.text);
                      Navigator.pop(context, controller.text);
                    }
                  },
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: const Text(
                      'Let\'s go!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    'Exit, I\'ll try later',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
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
