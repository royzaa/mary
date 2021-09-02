import 'package:flutter/material.dart';

class ReferencModalBottom extends StatelessWidget {
  const ReferencModalBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> references = [
      'Permendikbud nomor 37 tahun 2018',
      'https://www.youtube.com/watch?v=kSa-F4eXkwc',
      'https://www.youtube.com/watch?v=WKUZVA4agoQ',
      'https://www.youtube.com/watch?v=5oi5j11FkQg',
      'https://www.youtube.com/watch?v=TVAxASr0iUY',
      'https://www.youtube.com/watch?v=8YhYqN9BwB4',
      'http://math2.org/math/geometry/areasvols.html',
    ];
    Size size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 1,
      minChildSize: 0.3,
      builder: (context, controller) => SingleChildScrollView(
        controller: controller,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 8,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'References',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.45,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    itemCount: references.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        references[index],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
