import 'dart:convert';
import 'package:exam2/screen/prodect/prodect_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <ProdectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
  void getProducts() async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> result = json.decode(response.body);
        products.assignAll(result.map((json) => ProdectModel.fromMap(json)));
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }
}
