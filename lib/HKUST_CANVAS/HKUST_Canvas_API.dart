import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo/HKUST_CANVAS/Canvas_auth_page.dart';

class HKUSTCanvas {
  bool signed = false;
  String _cookie;

  HKUSTCanvas();

  Future<bool> launchAuthPage(BuildContext context) async {
    String ck = await Navigator.push<String>(
        context, MaterialPageRoute(builder: (context) => CanvasAuthPage()));
    print(ck);
    if (ck == null) return false;
    _cookie = ck;
    signed = true;
    return true;
  }

  Future<String> apiRequestHandler(String url) async {
    if (!signed) return "unauthenticated";
    Response response = await Dio(BaseOptions(
        responseType: ResponseType.plain,
        headers: {'cookie': _cookie})).get(url);
    return response.data.toString();
  }

  Future<List> availableCourses() async {
    String _courses = await apiRequestHandler(
        'https://canvas.ust.hk/api/v1/dashboard/dashboard_cards');
    if (_courses.contains("unauthenticated")) {
      throw Exception("Authentication failed. Please Login again.");
    } else {
      return json.decode(_courses.split(";")[1]) as List;
    }
  }

  Future<List> availavleAssignments(String courseCode) async {
    String _asms = await apiRequestHandler(
        'https://canvas.ust.hk/api/v1/courses/' + courseCode + '/assignments/');
    if (_asms.contains("unauthenticated")) {
      throw Exception("Authentication failed. Please Login again.");
    } else {
      return json.decode(_asms.split(";")[1]) as List;
    }
  }
}
