import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';

import '../../services/my_cache_manager.dart';

class CachedImage extends StatefulWidget {
  const CachedImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
  }) : super(key: key);
  final String imageUrl;
  final double? height;
  final double? width;

  @override
  _CachedImageState createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  final MyCacheManager _myCacheManager = Get.find<MyCacheManager>();
  File imageFile = File('');

  @override
  void initState() {
    _myCacheManager.cacheForSvg(widget.imageUrl).then((value) {
      setState(() {
        imageFile = value;
        debugPrint('imageFile : ${imageFile.path}');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return imageFile.path.isNotEmpty
        ? Image.file(
            imageFile,
            fit: BoxFit.cover,
            height: widget.height,
            width: widget.width,
          )
        : Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            height: widget.height,
            width: widget.width,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                child: PlaceholderLines(
                  count: 3,
                  animate: true,
                ),
              );
            },
          );
  }
}
