import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextApi {
  static final _speech = SpeechToText();

  static bool isListening = _speech.isListening;

  static Future<bool> init({
    required void Function(String) onStatus,
  }) async {
    final isAvailable = await _speech.initialize(
        onStatus: (status) => onStatus(status),
        onError: (e) => debugPrint('error in speech initialize: $e'),
        finalTimeout: const Duration(milliseconds: 4000),
        debugLogging: true);

    return isAvailable;
  }

  static void startListen({
    required void Function(String text) onResult,
  }) {
    _speech.listen(
      partialResults: false,
      onResult: (speechRecognition) =>
          onResult(speechRecognition.recognizedWords),
      // pauseFor: const Duration(milliseconds: 900),
      cancelOnError: true,
    );
  }

  static void stopListen() {
    _speech.stop();
  }
}
