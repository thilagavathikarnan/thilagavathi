import 'dart:convert';

import 'package:ht_re/model/banner_model.dart';

import '../urls/all_urls.dart';
import 'package:http/http.dart' as http;

class CommonService
{
  BannerModel? bannerList;
  Future BannerService() async{
    var url = Uri.parse(mainUrl+bannerUrl);
    var response = await http.get(url);
    print(response.body);
    print("Banner API Call");
    print(url);
    var jsonResponse = json.decode(response.body);
    bannerList = BannerModel.fromJson(jsonResponse);
    print('Success: ${bannerList!.success}');
    print('Data Count: ${bannerList!.data.length}');
    print('First Data Item ID: ${bannerList!.data[0].id}');

    return bannerList;




  }

}