import '../model/lesson.dart';

const lessonData = Lesson(
  english: [
    EnglishLesson(
      content: """•	Vocabulary related to vehicles 
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
      content: """• Characteristics of descriptive text
o The characteristics possessed by descriptive text are that the text contains a description that focuses on only one object. Usually the description is detailed. For example, Descriptive Text about animals. The text can contain various information about physical descriptions, food, habitat and origins, breeding, to unique facts related to these animals. Another characteristic of Descriptive Text is that the grammar tenses used are simple present tense.""",
      name: 'Characteristics',
    ),
    EnglishLesson(
      content: """•	Structure of descriptive Text
o Each text must consist of several parts that compose it. Each text has a different structure depending on the type of text itself. Descriptive Text structure consists of two parts. The first part is Identification, and the second part is Description. Identification contains the topic of what object will be discussed. While the description contains a description of an object regarding the details of the object such as the physical state of the object, its origin to other unique facts.
""",
      name: 'Structure Text',
    ),
    EnglishLesson(
      content: """•	Instance of simple descriptive sentences
o	The ambulance color is white (ambulans berwarna putih)
o	The truck color is yellow (truk berwarna kuning)
o	The train color is blue (kereta berwarna biru)
o	The hot air balloon is so colorful (balon terbang itu sangat berwarna)
""",
      name: 'Example sentences',
    ),
    EnglishLesson(
      content: """• Text Description about city transportation vehicles
I have a car. It is my means of transportation. Almost everybody I go to work by car. Therefore, Maintening the car is very crucial. It needs to be serviced regularly. Beside servicing the engine, I have to pay attention to all the tyres. Inside my car there are some important tools such as scissor, lead, pick, jack for wheel alarmed. It is very important to change the tyre when it is flat. My car doesn’t need to have a nail to change a generator, a tyre compressor, a tyre changer and did all tyre lifter, but I should check all tyres regularly before driving.
""",
      name: 'Example text',
    )
  ],
  math: [
    MathLesson(
      volume: 'V = s x s x s',
      areas: 'L = 6 x (s x s)',
      name: 'Cube',
      imageAsset: 'assets/images/kubus.png',
      cubeArea: 'L = s x s',
      circumference: 'K = 12 x s',
    ),
    MathLesson(
      volume: 'V = length (l) x weight (w) x height (h)',
      areas: 'L = 2 x ( lw + wh + ht)',
      name: 'Block',
      imageAsset: 'assets/images/balok.png',
      spaceDiagonal: 'd = √( l2+ w2 + h2 )',
      circumference: 'K = 4 x (l + w + h)',
    ),
    MathLesson(
      volume: 'V = luas alas x t',
      areas: 'L = Lateral area (3 side) + 2 x area of the base',
      name: 'Triangular Prism',
      imageAsset: 'assets/images/prisma segitiga.png',
    ),
    MathLesson(
      volume: 'V = 1/3 x length x weight x height',
      areas: 'L = Area of base + Lateral area (4 side)',
      name: 'Rectangular Pyramid',
      imageAsset: 'assets/images/limas segi empat.png',
    ),
    MathLesson(
      volume: 'V = 1/3 x area of base x h',
      areas: 'L = Area of base + Lateral area (3 side)',
      name: 'Triangular Pyramid',
      imageAsset: 'assets/images/limas segi tiga.png',
    ),
    MathLesson(
      volume: 'V = π x r2 x h',
      areas: 'L = (2 x area of base) + (circumference x height)',
      name: 'Cylinder',
      imageAsset: 'assets/images/tabung.png',
    ),
    MathLesson(
      volume: 'V = 1/3 x π x r2 x h',
      areas: 'L = ( π x r2 ) + ( π x r x s)',
      name: 'Cone',
      imageAsset: 'assets/images/kerucut.png',
    ),
    MathLesson(
      volume: 'V = 4/3 x π x r3',
      areas: 'L = 4 x π x r2',
      name: 'Ball',
      imageAsset: 'assets/images/bola.png',
    ),
  ],
  physics: [
    PhysicsLesson(
      content: """•	Newton's 1st Law
o Newton's first law explains that any object at rest will remain at rest, and any object in motion will continue to move, as long as no resultant force is exerted or acts on the object.
o Examples of the application of Newton's First Law, namely when we are riding a bus moving at a constant speed (constant). Our bodies are in a comfortable sitting position. However, when the bus driver braked suddenly. So, automatically our bodies at that time will be pushed forward.""",
      name: 'First law',
    ),
    PhysicsLesson(
      content: """• Implemented Constant Acceleration
o Constant Acceleration (GLBB - Gerak Lurus Berubah Beraturan) is a motion of an object in a straight line with a constant acceleration. The main characteristic of GLBB is that from time to time the speed of objects changes, getting faster or slower, so that the movement of objects from time to time can experience acceleration or deceleration. GLB is the movement of an object with a trajectory in the form of a straight line.
o Examples of the application of GLBB in urban transportation are
 When riding a bicycle on a downhill road
 Airplane taking off
o Examples of GLBB being slowed are:
 Motorized or braked car
 pedaling a bicycle on an incline
""",
      name: 'Second law',
    ),
    PhysicsLesson(
      content: """•	Newton's 3rd Law
o Newton's third law is related to the forces of action and reaction. The point is that every object that we give an action force, then the object will return to give an equal reaction force to us. But remember, yes, in the opposite direction. So, Newton's third law can be written as Faction = -Freaction.
o An example of Newton's third law is when you row a boat. Take a look. When you move the oar backwards, the boat you are riding will move forward. This happens because there is an action force that we apply through the oars (we rowing is an action force), so the boat will exert an equal reaction force but in the opposite direction, namely by moving forward.""",
      name: 'Third law',
    )
  ],
);
