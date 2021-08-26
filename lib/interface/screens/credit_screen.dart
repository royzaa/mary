import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 230,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.network(
              'https://drive.google.com/uc?id=16VEIhLUl9S9jMQr2DFr1YjD2JmN6LkcE',
              width: 200,
              fit: BoxFit.cover,
              placeholderBuilder: (context) => const Center(
                child: PlaceholderLines(
                  count: 3,
                  animate: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Oops.. under construction',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
