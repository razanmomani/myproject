import 'dart:convert';
import 'package:exam2/screen/prodect/prodect_model.dart';
import 'package:exam2/utils/helpers/general_status.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
class ProductController extends GetxController {
  var products = <ProdectModel>[].obs;
  //GeneralStstuse handeal ststuse eroor waiting success
  var statusModel = GeneralStatusModel().obs;
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
  void getProducts() async {
    //GeneralStatus
    statusModel.value.updateStatus(GeneralStatus.waiting);
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);
    //  print(response.statusCode);
   //   print(response.body);
      if ((response.statusCode >= 200 && response.statusCode < 300) &&
          response.body.isNotEmpty) {
        statusModel.value.updateStatus(GeneralStatus.success);
        List<dynamic> result = json.decode(response.body);
        products.assignAll(result.map((json) => ProdectModel.fromMap(json)));
      } else {
        statusModel.value.updateStatus(GeneralStatus.erorr);
        statusModel.value.updateErorr('No Result found');
      }
  }
  // handeal is status
  bool get isWaiting => statusModel.value.status.value == GeneralStatus.waiting;
  bool get isSuccess => statusModel.value.status.value == GeneralStatus.success;
  bool get isError => statusModel.value.status.value == GeneralStatus.erorr;
}
