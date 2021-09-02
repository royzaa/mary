import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartLearningButton extends StatelessWidget {
  const StartLearningButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.125,
        minWidth: size.width * 0.4,
        maxWidth: size.width * 0.5,
        minHeight: size.height * 0.08,
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
              borderRadius: BorderRadius.circular(30),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraints.maxWidth - 40 - 24 - 15,
                child: const FittedBox(
                  child: Text(
                    'Start learning',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
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
