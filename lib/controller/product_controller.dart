import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:module10_assignment_ostad/utils/urls.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';
class ProductController {

  List<Data>products = [];


  //eikhan theke get kora hocche
  Future getProduct() async{
    final url = Uri.parse(Urls.readURL);

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);

      ProductModel model = ProductModel.fromJson(jsonResponse);

      products = model.data ?? [];
    }
  }



}