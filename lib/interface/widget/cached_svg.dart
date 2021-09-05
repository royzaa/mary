import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';

import '../../services/my_cache_manager.dart';

class CachedSvg extends StatefulWidget {
  const CachedSvg({
    Key? key,
    required this.svgUrl,
    this.height,
    this.width,
  }) : super(key: key);
  final String svgUrl;
  final double? height;
  final double? width;

  @override
  _CachedSvgState createState() => _CachedSvgState();
}

class _CachedSvgState extends State<CachedSvg> {
  final MyCacheManager _myCacheManager = Get.find<MyCacheManager>();
  File svgFile = File('');

  @override
  void initState() {
    _myCacheManager.cacheForSvg(widget.svgUrl).then((value) {
      setState(() {
        svgFile = value;
        debugPrint('svgFile : ${svgFile.path}');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return svgFile.path.isNotEmpty
        ? SvgPicture.file(
            svgFile,
            fit: BoxFit.cover,
            height: widget.height,
            width: widget.width,
            placeholderBuilder: (context) => const Center(
              child: PlaceholderLines(
                count: 3,
                animate: true,
              ),
            ),
          )
        : SvgPicture.network(
            widget.svgUrl,
            fit: BoxFit.cover,
            height: widget.height,
            width: widget.width,
            placeholderBuilder: (context) => const Center(
              child: PlaceholderLines(
                count: 3,
                animate: true,
              ),
            ),
          );
  }
}
