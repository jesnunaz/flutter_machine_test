import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static String baseurl = 'https://fakestoreapi.com';

  getProduct() async {
    var response = await http.get(Uri.parse('$baseurl/products'));
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      return data;
    }
  }

  getSingleProduct(String id) async {
    var response = await http.get(Uri.parse('$baseurl/products/$id'));
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      return data;
    }
  }

  addProduct(String title, String price, String description, String image, String category) async {
    var response = await http.post(
      Uri.parse('$baseurl/products'),
      body: jsonEncode({
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
