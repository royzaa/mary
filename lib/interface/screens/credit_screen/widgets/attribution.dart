import 'package:flutter/material.dart';

class Attribution extends StatelessWidget {
  const Attribution({Key? key, required this.brandName, required this.logoUrl})
      : super(key: key);
  final String brandName;
  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Image.network(
            logoUrl,
            width: size.width * 0.8,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            brandName,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
