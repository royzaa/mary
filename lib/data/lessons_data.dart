import '../model/lesson.dart';

const lessonData = Lesson(
  english: [
    EnglishLesson(
      content: """•	Kosa kata terkait Jenis kendaraan
o	Fire Engine
o	Police Car
o	Ambulance
o	Car
o	Sports Car
o	Taxi
o	Limousine
o	Digger
o	Bulldozer
o	Steam Roller
o	Crane
o	Tractor
o	Cement Mixer
o	Garbage Truck
o	Dump Truck
o	Combine Harvester
o	Airplane
o	Helicopter
o	Hot air Balloon
o	Blimp
o	Space Shuttle
o	Row Boat
o	Ferry
o	Ship 
o	Speed Boat
o	Jet Ski
o	Sail Boat
o	Yacht
o	Gondola
o	Submarine
o	Train
o	Van
o	Minivan
o	Pickup Truck
o	ATV
o	Tractor trainer
o	Camper
o	Bicycle
o	Kick Scooter
o	Skateboard
o	Carriage
o	Scooter
o	Motorcycle
o	Race Car
o	SUV
o	Ski Chairlift
o	Cableway
o	Bus
o	Trolleybus
o	Tram
o	Subway
""",
      name: 'Vocabulary',
    ),
    EnglishLesson(
      content: """•	Sifat-sifat/ ciri-ciri teks descriptive
o	Ciri-ciri yang dimiliki oleh teks deskripsi yaitu teksnya berisi deskripsi yang fokus hanya pada satu objek saja. Biasanya deskripsinya detail. Misalnya Descriptive Text tentang hewan. Teks tersebut dapat berupa memuat beragam informasi tentang deskripsi fisik, makanan, habitat dan asal usul, perkembangbiakkan, hingga fakta-fakta unik terkait hewan tersebut. Ciri lainnya dari Descriptive Text yaitu grammar tenses yang dipakai adalah simple present tense.
""",
      name: 'Characteristics',
    ),
    EnglishLesson(
      content: """•	Structure Descriptive Text
o	Setiap teks pasti terdiri dari beberapa bagian yang menyusunnya. Setiap teks memiliki struktur yang berbeda-beda tergantung dari jenis teksnya sendiri. Struktur Descriptive Text terdiri dari dua bagian. Bagian pertama adalah Identification (Identifikasi), dan bagian kedua adalah Description (Deskripsi). Identification (Identifikasi) berisi tentang topik objek apa yang akan dibahas. Sedangkan Description (deskripsi) berisi tentang gambaran suatu objek mengenai detail objek tersebut seperti keadaan fisik objek, asal-usul hingga fakta-fakta unik lainnya.
""",
      name: 'Structure Text',
    ),
    EnglishLesson(
      content: """•	Kalimat Deskripsi Sederhana
o	The ambulance color is white (ambulans berwarna putih)
o	The truck color is yellow (truk berwarna kuning)
o	The train color is blue (kereta berwarna biru)
o	The hot air balloon is so colorful (balon terbang itu sangat berwarna)
""",
      name: 'Example sentences',
    ),
    EnglishLesson(
      content: """•	Text Deskripsi tentang kendaraan transportasi kota
I have a car. It is my means of transportation. Almost everybody I go to work by car. Therefore, Maintening the car is very crucial. It needs to be serviced regularly. Beside servicing the engine, I have to pay attention to all the tyres. Inside my car there are some important tools such as scissor, lead, pick, jack for wheel alarmed. It is very important to change the tyre when it is flat. My car doesn’t need to have a nail to change a generator, a tyre compressor, a tyre changer and did all tyre lifter, but I should check all tyres regularly before driving.
""",
      name: 'Example text',
    )
  ],
  math: [
    MathLesson(
      volume: 'V = s x s x s',
      areas: 'L = 6 x (s x s)',
      name: 'Kubus',
      imageAsset: 'assets/images/kubus.png',
      cubeArea: 'L = s x s',
      circumference: 'K = 12 x s',
    ),
    MathLesson(
      volume: 'V = p x l x t',
      areas: 'L = 2 x ( pl + lt + pt)',
      name: 'Balok',
      imageAsset: 'assets/images/balok.png',
      spaceDiagonal: 'd = √( p2+ l2 + t2 )',
      circumference: 'K = 4 x (p + l + t)',
    ),
    MathLesson(
      volume: 'V = luas alas x t',
      areas: 'L = keliling alas x t + 2 x luas alas segitiga',
      name: 'Prisma Segitiga',
      imageAsset: 'assets/images/prisma segitiga.png',
    ),
    MathLesson(
      volume: 'V = 1/3 x p x l x t',
      areas: 'L = Luas alas + Luas selubung limas',
      name: 'Limas Segiempat',
      imageAsset: 'assets/images/limas segi empat.png',
    ),
    MathLesson(
      volume: 'V = 1/3 x luas alas x t',
      areas: 'L = Luas alas + Luas selubung limas',
      name: 'Limas Segitiga',
      imageAsset: 'assets/images/limas segi tiga.png',
    ),
    MathLesson(
      volume: 'V = π x r2 x t',
      areas: 'L = (2 x luas alas) + (keliling alas x tinggi)',
      name: 'Tabung',
      imageAsset: 'assets/images/tabung.png',
    ),
    MathLesson(
      volume: 'V = 1/3 x π x r2 x t',
      areas: 'L = ( π x r2 ) + ( π x r x s)',
      name: 'Kerucut',
      imageAsset: 'assets/images/kerucut.png',
    ),
    MathLesson(
      volume: 'V = 4/3 x π x r3',
      areas: 'L = 4 x π x r2',
      name: 'Bola',
      imageAsset: 'assets/images/bola.png',
    ),
  ],
  physics: [
    PhysicsLesson(
      content: """•	Hukum 1 Newton
o	Hukum I Newton ini menjelaskan bahwa setiap benda yang diam akan tetap diam, dan setiap benda yang sedang bergerak akan terus bergerak, selama tidak ada resultan gaya yang diberikan atau bekerja pada benda tersebut.
o	Contoh penerapan Hukum I Newton, yaitu pada saat kita sedang naik bus yang bergerak dengan kecepatan tetap (konstan). Tubuh kita ada pada posisi duduk nyaman. Namun, ketika supir bus mengerem mendadak. Maka, otomatis tubuh kita pada saat itu akan terdorong ke depan.
""",
      name: 'First law',
    ),
    PhysicsLesson(
      content: """•	Penerapan GLBB
o	GLBB merupakan suatu gerakan benda yang lintasanya lurus dengan percepatan tetap. Ciri utama GLBB adalah bahwa dari waktu ke waktu kecepatan benda berubah, semakin lama semakin cepat atau lambat, sehingga gerakan pada benda dari waktu ke waktu bisa mengalami percepatan atau perlambatan. GLB merupakan gerakan suatu benda dengan lintasan berupa garis lurus.
o	Contoh penerapan GLBB pada transportasi kota yaitu
	Pada saat naik sepeda dijalan yang menurun
	pesawat yang sedang lepas landas
o	Contoh GLBB diperlambat yaitu :
	motor atau mobil yang direm
	mengayuh sepeda dijalan tanjakan
""",
      name: 'Second law',
    ),
    PhysicsLesson(
      content: """•	Hukum Newton 3
o	Hukum III Newton ini berkaitan dengan gaya aksi dan reaksi. Maksudnya adalah setiap benda yang kita berikan gaya aksi, maka benda tersebut akan kembali memberikan gaya reaksi yang sama besar terhadap kita. Tapi inget ya, arahnya berlawanan. Jadi, Hukum III Newton dapat ditulis dengan persamaan Faksi = -Freaksi.
o	Contoh dari Hukum III Newton ini adalah pada saat kamu mendayung perahu. Coba perhatikan deh. Sewaktu kamu menggerakkan dayung ke arah belakang, perahu yang kamu kendarai akan bergerak ke depan. Hal ini terjadi karena ada gaya aksi yang kita berikan melalui dayung (kita mendayung adalah gaya aksi), sehingga perahu akan memberikan gaya reaksi yang sama besar tetapi arahnya berlawanan, yaitu dengan bergerak ke depan.
""",
      name: 'Third law',
    )
  ],
);
