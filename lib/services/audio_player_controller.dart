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

  Future<String> _fileLocation() async {
    String? musicPath;
    final localDirectory = await getApplicationDocumentsDirectory();
    final musicDirectory = Directory('${localDirectory.path}/music');
    File file = File(musicDirectory.path + musicFileName);
    if (await musicDirectory.exists() && await file.exists()) {
      musicPath = file.path;
    } else {
      musicPath = musicUrl;
    }

    return musicPath;
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
    _fileLocation().then((value) {
      _musicPath = value;
      play();
    });

    _audioPlayer!.onPlayerCompletion.listen((_) {
      debugPrint('music complete');
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
      isLocal: _musicPath!.contains('https') ? false : true,
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
