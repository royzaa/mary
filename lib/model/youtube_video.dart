import 'package:flutter/material.dart';

class YoutubeVideo {
  const YoutubeVideo({
    required this.videoId,
    required this.subjectId,
    required this.subjectTitle,
    required this.videoTitle,
    this.assetImage,
    this.icon,
  });
  final String videoId, subjectId, subjectTitle, videoTitle;
  final String? assetImage;
  final IconData? icon;
}
