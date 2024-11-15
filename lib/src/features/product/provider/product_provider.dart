import 'package:flutter/material.dart';
import 'package:machine_test/src/features/product/model/product_model.dart';
import 'package:machine_test/src/services/api_services.dart';

class ProductProvider extends ChangeNotifier {
  bool isloading = false;

  List<ProductModel> products = [];
  ProductModel? selectedProduct;

  getProduct() async {
    isloading = true;
    notifyListeners();
    var data = ApiServices().getProduct();
    try {
    // products = data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
    products = List.generate(data.length, (index) => ProductModel.fromJson(data[index]));
    } catch (e) {}
    isloading = false;
    notifyListeners();
  }

  getSingleProduct(String id) async {
    isloading = true;
    notifyListeners();
    var data = ApiServices().getSingleProduct(id);
    try {
      selectedProduct = ProductModel.fromJson(data);
    } catch (e) {}
    isloading = false;
    notifyListeners();
  }

  addProduct(String title, String price, String description, String image, String category) async {
    isloading = true;
    notifyListeners();
    var data = ApiServices().addProduct(title, price, description, image, category);
    try {} catch (e) {}
    isloading = false;
    notifyListeners();
  }
}
