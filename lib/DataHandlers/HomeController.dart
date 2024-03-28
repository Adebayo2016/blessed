import 'package:blessed_academy/core/network_err.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final courses = [].obs;
  List <String> requestOptions= ['Junior classes 7k', 'Senior classes 10k', 'UTME/WAEC/GCE 12K'];
  String selectedRequest = 'Junior classes 7k';
  String requestPrice = '\u20a67,000 monthly';

  getAllCourses(){
    // get all courses from the server
    try {
      FirebaseFirestore firestore= FirebaseFirestore.instance;
      firestore.collection('courses').get().then((value) {
        value.docs.forEach((element) {
          courses.add(element.data());
        });
      });
    } catch (e) {
      print(e);
    }




  }

  setNewRequest(String value){
    selectedRequest = value;
    switchRequestPrice();
    print("the price is $requestPrice");
    update();
  }

  switchRequestPrice(){
    switch (selectedRequest) {
      case 'Junior classes 7k':
        requestPrice = '\u20a67,000 monthly';
        break;
      case 'Senior classes 10k':
        requestPrice = '\u20a610,000 monthly';
        break;
      case 'UTME/WAEC/GCE 12K':
        requestPrice = '\u20a612,000 monthly';
        break;
      default:
        return '7,000';
    }
  }



  uploadRequest({String? time, String? requestType, String? requestPrice, String? address}) async {
    DateTime now = DateTime.now();
    DateTime expiryDate = now.add(Duration(days: 30));
    String formatted = await  DateFormat('dd-MM-yy').format(expiryDate);
    print("formattedDate is $formatted");
    try {
      startLoading( Get.context!, "Requesting Tutor...");
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('TutorRequests').add({
        'subject': time,
        'requestType': requestType,
        'requestPrice': requestPrice,
        'Address': address,
        'expiryDate': formatted,
      }).then((value) => {
        loadingSuccessful(null),
        Get.snackbar('Success', 'Request successful'),
        Navigator.pop(Get.context!),
      });
    } catch (e) {
      print(e);
    }
  }



}