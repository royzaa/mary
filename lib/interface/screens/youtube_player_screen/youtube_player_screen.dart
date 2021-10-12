import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mary/model/youtube_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/youtube_videos_data.dart';
import '../../../services/audio_player_controller.dart';

class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen({
    Key? key,
    required this.videoId,
  }) : super(key: key);
  final String videoId;

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen>
    with SingleTickerProviderStateMixin {
  YoutubePlayerController? controller;
  late YoutubePlayer player;
  AnimationController? _animationController;
  late YoutubeVideo youtubeVideo;
  late List<YoutubeVideo> otherVideos;
  bool togglePlayIcon = false;
  final audioController = Get.find<AudioPlayerController>();
  late int currentVideoIndex;
  late String currentVideoId;

  @override
  void initState() {
    audioController.pause();
    controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
    );
    player = YoutubePlayer(
      controller: controller!,
      width: 312.w,
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 350,
      ),
    );

    youtubeVideo =
        youtubeVideosData.firstWhere((data) => data.videoId == widget.videoId);
    currentVideoId = youtubeVideo.videoId;
    otherVideos = youtubeVideosData
        .where((data) => data.subjectId == youtubeVideo.subjectId)
        .toList();
    currentVideoIndex =
        otherVideos.indexWhere((data) => data.videoId == widget.videoId);
    controller!.addListener(() {
      if (controller!.value.hasPlayed) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    controller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    audioController.play();
    controller!.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  void skipNext() {
    if (currentVideoIndex < (otherVideos.length - 1)) {
      currentVideoIndex += 1;

      final videoId = otherVideos[currentVideoIndex].videoId;
      setState(() {
        currentVideoId = videoId;
        controller!.load(videoId);
      });
    } else {
      currentVideoIndex = 0;
      final videoId = otherVideos[currentVideoIndex].videoId;
      setState(() {
        currentVideoId = videoId;
        controller!.load(videoId);
      });
    }
  }

  void skipPrevious() {
    if (currentVideoIndex != 0) {
      currentVideoIndex -= 1;
      final videoId = otherVideos[currentVideoIndex].videoId;
      setState(() {
        currentVideoId = videoId;
        controller!.load(videoId);
      });
    } else {
      currentVideoIndex = otherVideos.length - 1;
      final videoId = otherVideos[currentVideoIndex].videoId;
      setState(() {
        currentVideoId = videoId;
        controller!.load(videoId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const fontColor = Color.fromRGBO(48, 95, 114, 1);

    final size = MediaQuery.of(context).size;
    double maxScrollExtent = size.height.h * 0.7;
    const bottomSheetHeight = 0.436;
    RxDouble scrollViewPort = (size.height.h * bottomSheetHeight).obs;
    RxDouble videoPosiiton =
        controller!.value.position.inMilliseconds.toDouble().obs;
    return YoutubePlayerBuilder(
      player: player,
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[100],
            title: Text(
              'Video Player',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 23.h,
                width: 23.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10.r),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 13.r,
                ),
              ),
            ),
          ),
          body: SizedBox(
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(137, 137, 137, 0.25),
                                blurRadius: 50,
                                spreadRadius: 5,
                                offset: Offset(0, 20),
                              ),
                            ],
                          ),
                          child: player,
                        ),
                        SizedBox(
                          height: 53.h,
                        ),
                        SizedBox(
                          width: 312.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Duration(
                                        milliseconds:
                                            videoPosiiton.value.toInt())
                                    .toString()
                                    .split('.')
                                    .first,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(
                                width: 220.w,
                                child: Obx(
                                  () {
                                    return Slider(
                                      value: videoPosiiton.value,
                                      min: 0,
                                      max: controller!
                                          .metadata.duration.inMilliseconds
                                          .toDouble(),
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      thumbColor: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.7),
                                      inactiveColor: Colors.grey,
                                      label: controller!.value.position
                                          .toString()
                                          .split('.')
                                          .first,
                                      onChanged: (value) {
                                        controller!.seekTo(Duration(
                                            milliseconds: value.toInt()));
                                        _animationController!.reverse();
                                      },
                                    );
                                  },
                                ),
                              ),
                              Text(
                                controller!.metadata.duration
                                    .toString()
                                    .split('.')
                                    .first,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  height: size.height,
                  width: size.width,
                  child: DraggableScrollableSheet(
                    initialChildSize: bottomSheetHeight,
                    maxChildSize: 1.0,
                    minChildSize: bottomSheetHeight,
                    builder: (context, scrollController) {
                      if (scrollController.hasClients) {
                        if (scrollController.position.activity!.isScrolling) {
                          debugPrint(
                              'scroll position: ${scrollController.position.viewportDimension.h}');
                          Future.delayed(const Duration(milliseconds: 1), () {
                            scrollViewPort.value =
                                scrollController.position.viewportDimension.h;
                          });
                          debugPrint('max height position:' +
                              size.height.h.toString());
                        }
                      }
                      return NotificationListener<ScrollNotification>(
                        onNotification: (notif) {
                          if (notif is ScrollStartNotification) {
                            setState(() {
                              togglePlayIcon = !togglePlayIcon;
                            });
                          } else if (notif is ScrollEndNotification) {
                            setState(() {
                              togglePlayIcon = !togglePlayIcon;
                            });
                          }

                          return true;
                        },
                        child: Container(
                          height: size.height,
                          width: size.width,
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35.r),
                              topRight: Radius.circular(35.r),
                            ),
                          ),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Center(
                                  child: Container(
                                    width: 100.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                if (youtubeVideo.assetImage != null)
                                  Image.asset(
                                    youtubeVideo.assetImage!,
                                    height: 27.h,
                                    fit: BoxFit.cover,
                                  ),
                                if (youtubeVideo.icon != null)
                                  Icon(
                                    youtubeVideo.icon,
                                    color: Theme.of(context).primaryColor,
                                    size: 27.h,
                                  ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  youtubeVideo.subjectTitle,
                                  style: TextStyle(
                                    color: fontColor,
                                    fontSize: 22.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  'Now playing',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: fontColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.w,
                                        vertical: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.4),
                                      ),
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: fontColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller!.metadata.title,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: fontColor,
                                            ),
                                          ),
                                          Text(
                                            '${controller!.metadata.duration.inMinutes} minutes ${controller!.metadata.duration.toString().split(':')[2].split('.').first} seconds',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                if (true) ...[
                                  Text(
                                    'Other related videos',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: fontColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: otherVideos.length - 1,
                                    itemBuilder: (context, index) {
                                      final anotherList = otherVideos
                                          .where((data) =>
                                              data.videoId != currentVideoId)
                                          .toList();
                                      return GestureDetector(
                                        onTap: () {
                                          controller!
                                              .load(anotherList[index].videoId);
                                          setState(() {
                                            currentVideoId =
                                                anotherList[index].videoId;
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 15.h),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 15.w,
                                                  vertical: 5.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.4),
                                                ),
                                                child: Text(
                                                  '${index + 2}',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: fontColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      anotherList[index]
                                                          .videoTitle,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: fontColor,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   '${anotherList[index].metadata.duration.inMinutes} minutes ${anotherList[index].metadata.duration.toString().split(':')[2].split('.').first} seconds',
                                                    //   style: TextStyle(
                                                    //     color: Theme.of(context)
                                                    //         .primaryColor,
                                                    //     fontSize: 12.sp,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Obx(() {
                    Future.delayed(const Duration(milliseconds: 1), () {
                      debugPrint('view 1: ' +
                          ((maxScrollExtent - scrollViewPort.value) /
                                  maxScrollExtent)
                              .toString());
                      debugPrint(
                          'view 2: ' + ((scrollViewPort.value).toString()));
                    });

                    return Opacity(
                      opacity: ((maxScrollExtent - scrollViewPort.value) < 0
                              ? 0
                              : (maxScrollExtent - scrollViewPort.value)) /
                          (maxScrollExtent - size.height.h * bottomSheetHeight),
                      child: Container(
                        height: 86.h,
                        width: size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.r),
                            topRight: Radius.circular(35.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: skipPrevious,
                              icon: Icon(
                                Icons.skip_previous,
                                size: 24.r,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                final currentPosition =
                                    controller!.value.position.inSeconds;
                                controller!.seekTo(
                                    Duration(seconds: currentPosition - 10));
                                _animationController!.reverse();
                              },
                              icon: Icon(
                                Icons.fast_rewind,
                                size: 24.r,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12.r),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    togglePlayIcon = !togglePlayIcon;
                                    togglePlayIcon
                                        ? _animationController!.forward()
                                        : _animationController!.reverse();
                                  });
                                  togglePlayIcon
                                      ? controller!.pause()
                                      : controller!.play();
                                },
                                icon: AnimatedIcon(
                                  progress: _animationController!,
                                  icon: AnimatedIcons.pause_play,
                                  size: 27.r,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                final currentPosition =
                                    controller!.value.position.inSeconds;
                                controller!.seekTo(
                                    Duration(seconds: currentPosition + 10));
                                _animationController!.reverse();
                              },
                              icon: Icon(
                                Icons.fast_forward,
                                size: 24.r,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: skipNext,
                              icon: Icon(
                                Icons.skip_next,
                                size: 24.r,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
