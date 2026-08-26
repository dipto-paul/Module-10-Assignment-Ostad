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


  //eikhan theke delete kora hocche
  Future<bool> deleteProduct(String productID) async{
    final url = Uri.parse(Urls.deleteURL(productID));

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      getProduct();
      return true;
    }else{
      return false;
    }
  }
  Future<bool> createProduct(Data data) async {

    final response = await http.post(
      Uri.parse(Urls.createURL),

      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        "ProductName": data.productName,
        "Img": data.img,
        "Qty": data.qty,
        "TotalPrice": data.totalPrice,
      }),
    );

    print("Status Code: ${response.statusCode}");
    print("Response: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {

      await getProduct();

      return true;

    } else {

      return false;
    }
  }

}