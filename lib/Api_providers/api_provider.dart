import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habittrackergad/constant/constant.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:habittrackergad/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiProviderList{
  Register() async{
    // Get.find<UserModel>().name;
    var body = {
      "name":"thilaga",
      "email":"thijkjkjvvhhhgvj@gmail.com",
      "name":"thijk",
      "last_name":"t",
      "password":"123456"
    };
    var dataJs = json.encode(body);
    print("POSTAPI");
    var url = Uri.parse('https://habitseveryday.com/public/api/register');
    print(url);
    print(body);

    http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:dataJs);
    Map<String, dynamic> resp = json.decode(response.body);
    UserModel user = UserModel.fromJson(resp['data']);
     print("POSTAPI");
     print("USRS   "+user.name.toString());
     return user;


  }


  habitRequest(

      habitName,
      duration_start,
      duration_to,
      selectDays,
      slots,
      slotType,
      dateInput) async{
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);

    // final icon = Icon(iconData, size: size, color: Colors.green);
    // final iconWidget = SizedBox(
    //   width: size,
    //   height: size,
    //   child: icon,
    // );



    final picture = pictureRecorder.endRecording();
    ui.Image image = await picture.toImage(10, 10);
    print("ICONUPLOAD");
    print(image);
    print(picture);
    // final pngBytes = img.encodePng(img.by(image.toByteData()));

    var body = {
      "name":habitName,
      "date":dateInput,
      "duration_from":duration_start,
      "duration_to":duration_to,
      "slots_type":slotType,
      "slots":selectDays,
      "description":"test",
      "image":"test"
    };
    var dataJs = json.encode(body);
    print("POSTAPI");
    var url = Uri.parse('https://habitseveryday.com/api/user-habits/${userId}');
    print(url);
    print(body);

    http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:dataJs);
    print(response.statusCode);
    var resp = json.decode(response.body);
    print(resp);

    return resp;



  }







}
