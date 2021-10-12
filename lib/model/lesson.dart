class MathLesson {
  final String volume, areas, name, imageAsset;
  final String? spaceDiagonal, circumference, cubeArea;
  const MathLesson({
    required this.volume,
    required this.areas,
    required this.name,
    required this.imageAsset,
    this.spaceDiagonal,
    this.circumference,
    this.cubeArea,
  });
}

class EnglishLesson {
  final String name, content;
  const EnglishLesson({
    required this.content,
    required this.name,
  });
}

class PhysicsLesson {
  final String name, content;
  const PhysicsLesson({
    required this.content,
    required this.name,
  });
}

class Lesson {
  final List<EnglishLesson> english;
  final List<PhysicsLesson> physics;
  final List<MathLesson> math;

  const Lesson({
    required this.english,
    required this.math,
    required this.physics,
  });
}
