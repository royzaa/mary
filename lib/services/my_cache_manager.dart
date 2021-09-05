import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class MyCacheManager extends GetxController {
  Directory tempDir = Directory.systemTemp;

  Future<File> cacheForSvg(String fileUrl) async {
    String fileName = '${fileUrl.split('=')[1]}.svg';
    File file = File('${tempDir.path}/$fileName');
    HttpClient httpClient = HttpClient();

    try {
      if (!(await file.exists())) {
        var request = await httpClient.getUrl(Uri.parse(fileUrl));
        var response = await request.close();

        if (response.statusCode == 200) {
          Uint8List bytes = await consolidateHttpClientResponseBytes(response);
          await file.writeAsBytes(bytes, mode: FileMode.write);
          debugPrint('caching svg $fileName success in ${file.path}');
        } else {
          debugPrint('error in svg cache http client:' +
              response.statusCode.toString());
        }
      } else {
        debugPrint('caching svg image $fileName was cached');
      }
    } catch (e) {
      debugPrint('error when caching svg file:' + e.toString());
    }
    return file;
  }

  Future<File> cacheForLottie(String fileUrl) async {
    String fileName = fileUrl.split('/')[4];
    File file = File('${tempDir.path}/$fileName');
    HttpClient httpClient = HttpClient();

    try {
      if (!(await file.exists())) {
        var request = await httpClient.getUrl(Uri.parse(fileUrl));
        var response = await request.close();

        if (response.statusCode == 200) {
          Uint8List bytes = await consolidateHttpClientResponseBytes(response);
          await file.writeAsBytes(bytes, mode: FileMode.write);
          debugPrint('caching json lottie $fileName success in ${file.path}');
        } else {
          debugPrint('error in lottie cache http client:' +
              response.statusCode.toString());
        }
      } else {
        debugPrint('caching json lottie $fileName was cached');
      }
    } catch (e) {
      debugPrint('error when caching lottie file:' + e.toString());
    }
    return file;
  }

  Future<File> cacheForJpg(String fileUrl) async {
    String fileName = '${fileUrl.split('=')[1]}.jpg';
    File file = File('${tempDir.path}/$fileName');
    HttpClient httpClient = HttpClient();

    try {
      if (!(await file.exists())) {
        var request = await httpClient.getUrl(Uri.parse(fileUrl));
        var response = await request.close();

        if (response.statusCode == 200) {
          Uint8List bytes = await consolidateHttpClientResponseBytes(response);
          await file.writeAsBytes(bytes, mode: FileMode.write);
          debugPrint('caching jpg $fileName success');

          debugPrint('path jpg file: ${file.path}');
        } else {
          debugPrint('error in jpg cache http client:' +
              response.statusCode.toString());
        }
      } else {
        debugPrint('caching jpg image $fileName was cached');
      }
    } catch (e) {
      debugPrint('error when caching jpg file:' + e.toString());
    }
    return file;
  }
}
