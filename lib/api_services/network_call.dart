import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:event_mng_app/api_services/app_constants.dart';
import 'package:event_mng_app/common/common_widget.dart';
import 'package:event_mng_app/model/responseapi.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


Map<String, String> getHeaders() {
  Map<String, String> header = {};
  // if (AppConstants.authToken != "") {
  //   header["Authorization"] = 'Bearer ${AppConstants.authToken}';
  // }
  header["Content-Type"] = "application/json";
  return header;
}

postAPI({required String methodName, required Map<String, dynamic> param, required Function(ResponseAPI) callback}) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    String url = ApiConstant.baseUrl + methodName;
    Uri uri = Uri.parse(url);
    log("==request== $uri");
    // log("==params== $param");
    var logger = Logger(
      level: Level.debug,
      printer: PrettyPrinter(methodCount: 0, noBoxingByDefault: false),
    );
    logger.t("==params== $param");
    // log("==token== ${AppConstants.authToken}");

    await http.post(uri, headers: getHeaders(), body: json.encode(param)).then((value) {
      _handleResponse(value, callback);
    }).onError((error, stackTrace) {
      log("onError== $error");
      throw _handleError(error, callback);
    }).catchError((error) {
      log("catchError== $error");
      _handleError(error, callback);
    });
  } else {
    toast("No Internet");
    callback.call(ResponseAPI(
      0,
      "No Internet",
      isError: true,
    ));
  }
}



// postAPI2({required String methodName, required Map<String, dynamic> param, required Function(ResponseAPI) callback}) async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
//     String url = ApiConstant.baseUrl2 + methodName;
//     Uri uri = Uri.parse(url);
//     log("==request== $uri");
//     // log("==params== $param");
//     var logger = Logger(
//       level: Level.debug,
//       printer: PrettyPrinter(methodCount: 0, noBoxingByDefault: false),
//     );
//     logger.t("==params== $param");
//     log("==token== ${AppConstants.authToken}");
//     await http.post(uri, headers: getHeaders(), body: json.encode(param)).then((value) {
//       _handleResponse(value, callback);
//     }).onError((error, stackTrace) {
//       log("onError== $error");
//       throw _handleError(error, callback);
//     }).catchError((error) {
//       log("catchError== $error");
//       _handleError(error, callback);
//     });
//   } else {
//     toast("No Internet");
//     callback.call(ResponseAPI(
//       0,
//       "No Internet",
//       isError: true,
//     ));
//   }
// }

getAPI({required String methodName, required Function(ResponseAPI) callback}) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    String url = ApiConstant.baseUrl + methodName;
    Uri uri = Uri.parse(url);
  //  log("==request== $uri");
    var logger = Logger(
      level: Level.debug,
      printer: PrettyPrinter(methodCount: 0, noBoxingByDefault: false),
    );
    logger.i("==request== $uri");
    // log("==token== ${AppConstants.authToken}");
    await http.get(uri, headers:  getHeaders()).then((value) {
      _handleResponse(value, callback);
    }).onError((error, stackTrace) {
      log("onError== $error");
      _handleError(error, callback);
    }).catchError((error) {
      log("catchError== $error");
      _handleError(error, callback);
    });
  } else {
    toast("No Internet");
    callback.call(ResponseAPI(
      0,
      "No Internet",
      isError: true,
    ));
  }
}

_handleResponse(http.Response value, Function(ResponseAPI) callback) {
  var logger = Logger(
    level: Level.info,
    printer: PrettyPrinter(methodCount: 0, noBoxingByDefault: false),
  );
  logger.i("==response== ${value.body}");
  callback.call(ResponseAPI(value.statusCode, value.body));
}

_handleError(value, Function(ResponseAPI) callback) {
  var logger = Logger(
    level: Level.error,
  );
  logger.e("error:::::::::::::: ${value.body}");
  callback.call(ResponseAPI(
    0,
    "Something went wrong",
    isError: true,
    error: value,
  ));
}


multipartPostAPIForWeb({
  required String methodName,
  required Map<String, String> param,
  required Function(ResponseAPI) callback,
  required List<Uint8List> picture,
  required String photoName,
}) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    var url = ApiConstant.baseUrl + methodName;
    var uri = Uri.parse(url);
    log("==request== $uri");
    log("==Params== $param");
    final imageUploadRequest = http.MultipartRequest('POST', uri);
    if(picture.isNotEmpty) {
      http.MultipartFile file = http.MultipartFile.fromBytes(
        photoName,
        picture[0].cast(),
        filename: photoName,
      );
      imageUploadRequest.files.add(file);
      log("==profile_pic== $picture");
    }
    imageUploadRequest.fields.addAll(param);
    imageUploadRequest.headers.addAll(getHeaders());
    try {
      final streamedResponse = await imageUploadRequest.send();
      await http.Response.fromStream(streamedResponse).then((value) {
        _handleResponse(value, callback);
      }).onError((error, stackTrace) {
        _handleError(error, callback);
      }).catchError((error) {
        log("catchError== $error");
        _handleError(error, callback);
      });
    } catch (e) {
      _handleError(e, callback);
    }
  } else {
    callback.call(ResponseAPI(
      0,
      "No Internet",
      isError: true,
    ));
  }
}