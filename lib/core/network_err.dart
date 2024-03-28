import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'bad_network.dart';


Future<void> startLoading(BuildContext context,
    [String message = "Please wait...", bool? isdismissed]) async {
  FocusScope.of(context).requestFocus(FocusNode());
  EasyLoading.show(
      dismissOnTap: false,
      status: message,
      maskType: EasyLoadingMaskType.black);
}

loadingSuccessful(String? message,
    [bool showDialog = false,
      BuildContext? context,
      bool gotoDashBoard = true,
      Function? listener]) {
  EasyLoading.dismiss().then((value) {
    if (message != null) {
      toastSuccess(message);
    }
  });
}

void toastSuccess(String message) {
  Fluttertoast.showToast(
      msg: message == null ? '' : message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white);
}

void toastError(String message) {
  Fluttertoast.showToast(
      msg: message == null ? '' : message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}
Future<void> loadingFailed(Object? message,
    [BuildContext? context, bool showAsDialog = false]) async {
  EasyLoading.dismiss();

  if (message != null) {
    showSnackBar(context!, "An Error Occured ");

    //
    //   if (message.code.startsWith('permission-denied') ||
    //       message.code.startsWith('not-found') ||
    //       message.code.startsWith('already-exists') ||
    //       message.code.startsWith('invalid-argument') ||
    //       message.code.startsWith('deadline-exceeded') ||
    //       message.code.startsWith('not-found')) {
    //     if (context != null) {
    //       showSnackBar(
    //           context,
    //           message.message ??
    //               "An Error Occured");
    //     } else {
    //       if (kDebugMode) {
    //         toastError(message.message ??
    //             "An Error Occured");
    //         print(message.stackTrace);
    //       }
    //     }
    //   }
    //
    //   if (message.code.startsWith('internal') ||
    //       message.code.startsWith('unknown') ||
    //       message.code.startsWith('data-loss')) {
    //     showSnackBar(context!, "An Error Occured ");
    //   }
    // }
  }else {
    showSnackBar(context!, "An Error Occured ");

  }
}


void showSnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    elevation: 0,
    content: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
            color: Color(0xffFFF5F5),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffEC575E))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svgs/error.svg",
              height: 24,
              width: 24,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Text(
                  msg,
                  style: TextStyle(color: Color(0xff66191D)),
                )),
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    elevation: 0,
    content: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Color(0xff46CF68),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffE6CCFF))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Text(
                  msg,
                  style: TextStyle(color: Colors.white),
                )),
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color(0xff46CF68),
    padding: EdgeInsets.zero,
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
