import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './widgets/subject_box.dart';
import './widgets/action_box.dart';
import './widgets/lesson_box.dart';
import '../youtube_player_screen/youtube_player_screen.dart';
import '../../../data/lessons_data.dart';
import '../lesson_screen/lessons_screen.dart';
import '../../../services/audio_player_controller.dart';

class LearningEnrichmentScreen extends StatefulWidget {
  const LearningEnrichmentScreen({Key? key}) : super(key: key);

  @override
  _LearningEnrichmentScreenState createState() =>
      _LearningEnrichmentScreenState();
}

class _LearningEnrichmentScreenState extends State<LearningEnrichmentScreen> {
  final audioPlayer = Get.find<AudioPlayerController>();

  final List<Map<String, dynamic>> _subjects = [
    {
      'title': 'Descriptive Text',
      'icon': Icons.description_outlined,
      'lightIcon': null,
      'asset': null,
      'lightAsset': null,
    },
    {
      'title': 'Law of Newton',
      'asset': 'assets/images/reflection.png',
      'lightAsset': 'assets/images/reflection_white.png',
      'icon': null,
      'lightIcon': null,
    },
    {
      'title': 'Areas and Volume',
      'asset': 'assets/images/geometri.png',
      'lightAsset': 'assets/images/geometri_white.png',
      'icon': null,
      'lightIcon': null,
    },
  ];

  int _currentSubjectIndex = 0;
  int _currentActionIndex = 0;

  @override
  void initState() {
    audioPlayer.pause();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.resume();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<List<Map<String, dynamic>>> _lessons = [
      [
        {
          'title': 'Vocabulary',
          'icon': Icons.collections_bookmark_sharp,
          'function': () {},
        },
        {
          'title': 'Characteristics',
          'icon': Icons.pattern,
          'function': () {},
        },
        {
          'title': 'Structure',
          'icon': Icons.account_tree_outlined,
          'function': () {},
        },
        {
          'title': 'Example sentences',
          'icon': Icons.short_text_rounded,
          'function': () {},
        },
        {
          'title': 'Example Text',
          'icon': Icons.article_rounded,
          'function': () {},
        },
      ],
      [
        {
          'title': '1st Law of Newton',
          'icon': Icons.looks_one,
          'function': () {},
        },
        {
          'title': '2nd Law of Newton',
          'icon': Icons.looks_two,
          'function': () {},
        },
        {
          'title': '3rd Law of Newton',
          'icon': Icons.looks_3,
          'function': () {},
        },
      ],
      [
        {
          'title': 'Cube',
          'icon': CupertinoIcons.cube_fill,
          'function': () {},
        },
        {
          'title': 'Beam',
          'icon': CupertinoIcons.cube_box,
          'function': () {},
        },
        {
          'title': 'triangular prism',
          'icon': CupertinoIcons.add,
          'function': () {},
        },
        {
          'title': 'Square pyramid',
          'icon': CupertinoIcons.add,
          'function': () {},
        },
        {
          'title': 'Pentagon pyramid',
          'icon': CupertinoIcons.add,
          'function': () {},
        },
        {
          'title': 'Tube',
          'icon': CupertinoIcons.add,
          'function': () {},
        },
        {
          'title': 'Cone',
          'icon': CupertinoIcons.add,
          'function': () {},
        },
        {
          'title': 'Ball',
          'icon': CupertinoIcons.globe,
          'function': () {},
        },
      ],
    ];

    final List<List<Map<String, dynamic>>> _actions = [
      [
        {
          'title': 'Transportation Vocabulary',
          'imageUrl':
              'https://drive.google.com/uc?id=1D4rfclrFBHhHAlyl9IdpP19bvG4FJRiF',
          'function': () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const YoutubePlayerScreen(videoId: 'kSa-F4eXkwc')));
          },
        },
        {
          'title': 'Describing a Place',
          'imageUrl':
              'https://drive.google.com/uc?id=1cMlAGEmnGMpwSuzif6Vcj2SZDsQcO8rW',
          'function': () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const YoutubePlayerScreen(videoId: 'WKUZVA4agoQ')));
          },
        }
      ],
      [
        {
          'title': 'First Low of Newton',
          'imageUrl':
              'https://drive.google.com/uc?id=1lMGFdH0i9ZZ05oF2eyTqmM64mwCRfKjA',
          'function': () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const YoutubePlayerScreen(videoId: '5oi5j11FkQg')));
          },
        },
        {
          'title': 'Second Low of Newton',
          'imageUrl':
              'https://drive.google.com/uc?id=1ugYSOBwc4ZlqG8mnBbY8ne-BkiBurSIg',
          'function': () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const YoutubePlayerScreen(videoId: '8YhYqN9BwB4')));
          },
        },
        {
          'title': 'Third law of Newton',
          'imageUrl':
              'https://drive.google.com/uc?id=1yJXQQL8pYQMIz-IqPjt6cM-v46rZW1gI',
          'function': () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const YoutubePlayerScreen(videoId: 'TVAxASr0iUY')));
          },
        }
      ],
      [
        {
          'title': 'Areas and Volume',
          'imageUrl':
              'https://drive.google.com/uc?id=172cVDai-YgBq5GZyveVlYYrEFFkuEEuR',
          'function': null,
        },
      ],
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// APP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Wrap(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                            size: 24.r,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            'Learning enrichment',
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.border_color_sharp,
                    size: 24.r,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),

              /// Subject Box
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _subjects.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentSubjectIndex = index;
                        });
                      },
                      child: SubjectBox(
                        assetImage: _subjects[index]['asset'],
                        lightAssetImage: _subjects[index]['lightAsset'],
                        icon: _subjects[index]['icon'],
                        isSelected: _currentSubjectIndex == index,
                        title: _subjects[index]['title'],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              /// ACTION BOX
              SizedBox(
                height: 260.h,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    _currentActionIndex != 0
                        ? Positioned(
                            left: 0.w,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 32.r,
                              color: Colors.grey[400],
                            ),
                          )
                        : const SizedBox(),
                    _currentActionIndex + 1 !=
                                _actions[_currentSubjectIndex].length &&
                            _actions[_currentSubjectIndex].length != 1
                        ? Positioned(
                            right: 0.w,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 32.r,
                              color: Colors.grey[400],
                            ),
                          )
                        : const SizedBox(),
                    PageView.builder(
                      clipBehavior: Clip.none,
                      allowImplicitScrolling: true,
                      controller: PageController(
                        viewportFraction:
                            _actions[_currentSubjectIndex].length == 1
                                ? 1.0
                                : 0.8,
                      ),
                      onPageChanged: (index) {
                        setState(() {
                          _currentActionIndex = index;
                        });
                        debugPrint(
                            _actions[_currentSubjectIndex][index]['imageUrl']);
                      },
                      itemCount: _actions[_currentSubjectIndex].length,
                      itemBuilder: (context, index) {
                        return Transform.scale(
                          scale: index == _currentActionIndex ? 1 : 0.8,
                          child: ActionBox(
                            url: _actions[_currentSubjectIndex][index]
                                ['imageUrl'],
                            title: _actions[_currentSubjectIndex][index]
                                ['title'],
                            onTap: _actions[_currentSubjectIndex][index]
                                ['function'],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Lessons',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: _lessons[_currentSubjectIndex].length,
                  itemBuilder: (_, index) {
                    return LessonBox(
                      icon: _lessons[_currentSubjectIndex][index]['icon'],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonScreen(
                            lessonData: _currentSubjectIndex == 0
                                ? lessonData.english
                                : _currentSubjectIndex == 1
                                    ? lessonData.physics
                                    : lessonData.math,
                            subjectIndex: _currentSubjectIndex,
                            lessonIndex: index,
                          ),
                        ),
                      ),
                      title: _lessons[_currentSubjectIndex][index]['title'],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
