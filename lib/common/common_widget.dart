
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toast(String txt) => Fluttertoast.showToast(
    msg: txt,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.orange,
    textColor: Colors.white,
    fontSize: 16.0);
class LoadingStateWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingStateWidget({required this.isLoading, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: isLoading, child: Stack(alignment: Alignment.topCenter, children: [child, isLoading ? const LoadingWidget() : const SizedBox()]));
  }
}
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Center(child:
    // SpinKitFoldingCube(color: AppColors.blackColor, size: 35)
    SpinKitCircle(color: Colors.orange, size: 45)
      // CircularProgressIndicator(color: AppColors.blackColor)
    );
  }
}
