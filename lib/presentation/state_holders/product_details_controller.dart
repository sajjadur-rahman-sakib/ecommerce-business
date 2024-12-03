import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_details_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductDetailsModel? _productModel;

  ProductDetailsModel? get product => _productModel;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productDetailsByID(productId),
    );

    if (response.isSuccess) {
      _productModel =
          ProductDetailsModel.fromJson(response.responseData['data'][0]);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
