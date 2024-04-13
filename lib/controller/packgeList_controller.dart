// import 'dart:convert';
//
// import 'package:event_mng_app/api_services/network_call.dart';
// import 'package:event_mng_app/model/package_list_model.dart';
// import 'package:get/get.dart';
//
// import '../api_services/app_constants.dart';
//
// class PackageListController extends GetxController  {
//   RxBool isLoading = false.obs, isOtherLoading = false.obs;
//   RxBool isError = false.obs;
//   RxString error = "".obs;
//
//   RxList<Product> productList = <Product>[].obs;
//
//   getAllAssessmentsBy() async {
//     isLoading(true);
//     isError(false);
//     error("");
//     productList.clear();
//     try {
//       await getAPI(
//         methodName: ApiConstant.packageList,
//         // param: map,
//         callback: (val) {
//           Map<String, dynamic> valueMap = json.decode(val.response);
//           if (valueMap.containsKey("data")) {
//             List<dynamic> productsJson = valueMap["data"];
//             productList.addAll(productsJson.map((productJson) => Product.fromJson(productJson)));
//           } else {
//             isError(true);
//             error("Failed to fetch products");
//           }
//         },
//       );
//     } catch (ex) {
//       error(ex.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
// }
import 'dart:convert';

import 'package:event_mng_app/api_services/network_call.dart';
import 'package:event_mng_app/model/package_list_model.dart';
import 'package:get/get.dart';

import '../api_services/app_constants.dart';

class PackageListController extends GetxController {
  RxBool isLoading = false.obs, isOtherLoading = false.obs;
  RxBool isError = false.obs;
  RxString error = "".obs;

  RxList<Product> productList = <Product>[].obs;

  getAllAssessmentsBy() async {
    isLoading(true);
    isError(false);
    error("");
    productList.clear();
    try {
      await getAPI(
        methodName: ApiConstant.packageList,
        // param: map,
        callback: (val) {
          print("Response from API: ${val.response}");
          Map<String, dynamic> valueMap = json.decode(val.response);
          if (valueMap.containsKey("data")) {
            List<dynamic> productsJson = valueMap["data"];
            productList.addAll(productsJson.map((productJson) => Product.fromJson(productJson)));
          } else {
            isError(true);
            error("Failed to fetch products");
          }
        },
      );
    } catch (ex) {
      error(ex.toString());
    } finally {
      isLoading(false);
    }
  }
}
