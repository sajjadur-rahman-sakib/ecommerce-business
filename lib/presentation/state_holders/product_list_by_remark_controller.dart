import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_list_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/urls.dart';
import 'package:ecommerce/presentation/ui/widgets/widgets.dart';

class ProductListByRemarkController extends GetxController {
  bool _popularProductInProgress = false;
  bool _newProductInProgress = false;
  bool _specialProductInProgress = false;

  bool get popularProductInProgress => _popularProductInProgress;

  bool get newProductInProgress => _newProductInProgress;

  bool get specialProductInProgress => _specialProductInProgress;

  List<ProductModel> _popularProductsList = [];
  List<ProductModel> _newProductsList = [];
  List<ProductModel> _specialProductsList = [];

  List<ProductModel> get popularProductsList => _popularProductsList;

  List<ProductModel> get newProductsList => _newProductsList;

  List<ProductModel> get specialProductsList => _specialProductsList;

  String? _popularProductErrorMessage;
  String? _newProductErrorMessage;
  String? _specialProductErrorMessage;

  String? get popularProductErrorMessage => _popularProductErrorMessage;

  String? get newProductErrorMessage => _newProductErrorMessage;

  String? get specialProductErrorMessage => _specialProductErrorMessage;

  Future<bool> getProductByRemark(String remark) async {
    bool isSuccess = false;

    if (remark == 'popular') {
      _popularProductInProgress = true;
    } else if (remark == 'new') {
      _newProductInProgress = true;
    } else {
      _specialProductInProgress = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productListByRemark(remark),
    );

    if (response.isSuccess) {
      if (remark == 'popular') {
        _popularProductErrorMessage = null;
        _popularProductsList =
            ProductListModel.fromJson(response.responseData).productList ?? [];
      } else if (remark == 'new') {
        _newProductErrorMessage = null;
        _newProductsList =
            ProductListModel.fromJson(response.responseData).productList ?? [];
      } else {
        _specialProductErrorMessage = null;
        _specialProductsList =
            ProductListModel.fromJson(response.responseData).productList ?? [];
      }

      isSuccess = true;
    } else {
      if (remark == 'popular') {
        _popularProductErrorMessage = response.errorMessage;
      } else if (remark == 'new') {
        _newProductErrorMessage = response.errorMessage;
      } else {
        _specialProductErrorMessage = response.errorMessage;
      }
    }

    if (remark == 'popular') {
      _popularProductInProgress = false;
    } else if (remark == 'new') {
      _newProductInProgress = false;
    } else {
      _specialProductInProgress = false;
    }

    update();
    return isSuccess;
  }
}
