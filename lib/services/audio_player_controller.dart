import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class AudioPlayerController extends GetxController {
  AudioPlayer? _audioPlayer;

  Duration _position = const Duration();

  StreamSubscription? _positionSubscription;

  final musicUrl =
      'https://drive.google.com/uc?id=1tZbpXNFuFkQzqy4v3UhwiObAYjeZhLqq';

  Future<String> _localPath() async {
    String? musicLocalPath;
    final localDirectory = await getApplicationDocumentsDirectory();
    final musicDirectory = Directory('${localDirectory.path}/music');
    if (await musicDirectory.exists()) {
      musicLocalPath = musicDirectory.path;
    } else {
      musicDirectory.create(recursive: true);
      musicLocalPath = musicDirectory.path;
    }

    return musicLocalPath;
  }

  String? _musicPath;

  String musicFileName = 'good_morning.mp3';

  @override
  void onInit() {
    _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

    _positionSubscription =
        _audioPlayer!.onAudioPositionChanged.listen((duration) {
      _position = duration;
    });
    _localPath().then((value) {
      _musicPath = value + musicFileName;
      play();
    });

    _audioPlayer!.onPlayerCompletion.listen((_) {
      debugPrint('music compelte');
      resume();
    });

    super.onInit();
  }

  @override
  void dispose() {
    _audioPlayer!.dispose();
    _positionSubscription!.cancel();
    super.dispose();
  }

  Future play() async {
    final playPosition = _position.inMilliseconds > 0 ? _position : null;

    await _audioPlayer!.play(
      _musicPath!,
      isLocal: true,
      position: playPosition,
      stayAwake: true,
    );

    debugPrint('music is playing');
  }

  Future pause() async {
    await _audioPlayer!.pause();
    debugPrint('music is paused');
  }

  Future resume() async {
    await _audioPlayer!.resume();
    debugPrint('music is resume');
  }
}
