import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../services/my_cache_manager.dart';

class CachedNetworkLottie extends StatefulWidget {
  const CachedNetworkLottie({
    Key? key,
    required this.lottieUrl,
    required this.height,
    required this.width,
    this.controller,
    this.onLoad,
  }) : super(key: key);
  final String lottieUrl;
  final double height;
  final double width;
  final AnimationController? controller;
  final void Function(LottieComposition)? onLoad;

  @override
  _CachedNetworkLottieState createState() => _CachedNetworkLottieState();
}

class _CachedNetworkLottieState extends State<CachedNetworkLottie>
    with SingleTickerProviderStateMixin {
  final MyCacheManager _myCacheManager = Get.find<MyCacheManager>();
  File lottieFile = File('');

  @override
  void initState() {
    _myCacheManager.cacheForLottie(widget.lottieUrl).then((value) {
      setState(() {
        lottieFile = value;
        debugPrint('lottiefile : ${lottieFile.path}');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return lottieFile.path.isNotEmpty
        ? LottieBuilder.file(
            lottieFile,
            controller: widget.controller,
            onLoaded: widget.onLoad,
            animate: true,
            height: widget.height,
            width: widget.width,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          )
        : LottieBuilder.network(
            widget.lottieUrl,
            controller: widget.controller,
            onLoaded: widget.onLoad,
            animate: true,
            height: widget.height,
            width: widget.width,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            frameBuilder: (context, child, lottieCompotition) {
              if (!(lottieCompotition == null)) {
                return child;
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
  }
}
