import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rajsthan_studio/api/models/image_sources.dart';
import 'package:rajsthan_studio/api/models/video_sources.dart';
import 'package:rajsthan_studio/screen/network.dart';

class apis {
  static String bearer_token =
      "563492ad6f9170000100000175ab79ab518447a7b026c4579913410e";
  static Future<ImageSource?> images(String url,BuildContext context) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer_token',
      });
      // for decoding our retrurn json
      print(response.body);
      final responsedata = json.decode(response.body);
      final imageSource = imageSourceFromJson(response.body.toString());

      return imageSource;
    } on SocketException catch (_) {
      print("edrr");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => network()));
    } catch (e) {
      print(e);
    }
  }

  static Future<VideoSource?> videos(String url,BuildContext context) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer_token',
      });
      // for decoding our retrurn json
      print(response.body);
      final responsedata = json.decode(response.body);
      final videoSource = videoSourceFromJson(response.body.toString());

      return videoSource;
    } on SocketException catch (_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => network()));
    } catch (e) {
      print(e);
    }
  }
}
