import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      'http://englishclass.com',
      'https://www.juraganles.com/2018/01/kumpulan-soal-bangun-ruang-lengkap-plus-kunci-jawaban.html',
      'https://afrizatul.com/contoh-soal-dan-pembahasan-volume-bangun-ruang-dan-luas-permukaan-balok',
      'https://filosofiberselimutmatematika.blogspot.com/2020/05/kumpulan-soal-dan-pembahasan-lengkap-tentang-gaya-dan-hukum-newton.html',
      'https://www.avkimia.com/2017/10/bank-soal-ipa-kelas-8-smp-materi-hukum-hukum-newton-tentang-gerak.html',
    ];
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pop(context);
      },
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 1,
          minChildSize: 0.3,
          builder: (context, controller) => SingleChildScrollView(
            controller: controller,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 8.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'References',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: size.height,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(20.r),
                        itemCount: references.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 10.h),
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
        ),
      ),
    );
  }
}
