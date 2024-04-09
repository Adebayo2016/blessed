import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:blessed_academy/core/network_err.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../core/request.dart';
import '../views/ui/home/BlessedHome.dart';

class HomeController extends GetxController {
  final payStackClient = PaystackPlugin();

  Map currentCourse = {};
  Map SelectedDownloadedCourse = {};
  @override
  void onInit() {
    requestStoragePermission();
    getAllPurchasedCourse();
    loadDownloadedCourses();

    super.onInit();
  }

  void startPaystack() async {
    String? publicKey = 'pk_test_53028ea8118c4cc094e5f47fd0dd1dc770d650a1';
    payStackClient.initialize(publicKey: publicKey);

    payStackClient.initialize(publicKey: publicKey);
  }

  List<Map<String, dynamic>> courses = [];
  List<Map<String, dynamic>> jambCourses = [];
  List<Map<String, dynamic>> purchasedCourse=[];
  List<Map<String, dynamic>> waecCourses = [];
  List<Map<String, dynamic>> necoCourses = [];
  List<Map<String, dynamic>> postUtmeCourses = [];
  List<Map<String,dynamic>>downloadedCourses=[];
  List<String> requestOptions = [
    'Junior classes 7k',
    'Senior classes 10k',
    'UTME/WAEC/GCE 12K'
  ];
  List<String> OnlinerequestOptions = [
    'Junior classes 15k',
    'Senior classes 18k',
    'UTME/WAEC/GCE 20K'
  ];
  Map? selectedPurchasedCourse;
  String selectedRequest = 'Junior classes 7k';
  String selectedOnlineRequest= 'Junior classes 15k';
  String requestPrice = '\u20a67,000 monthly';
  String onlineRequestPrice = '\u20a615,000 monthly';
  int? requestTutorPrice = 7000;
  int? onlineRequestTutorPrice = 15000;
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  get locationController => _locationController.text;

  get timeController => _timeController.text;

  getAllCourses() {
    startLoading(Get.context!);
    try {
      startLoading(Get.context!);
      FirebaseFirestore.instance
          .collection('courses')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isEmpty) {
          loadingFailed("no courses");
        } else {
          loadingSuccessful(null);
          snapshot.docs.forEach((element) {
            Map<String, dynamic> course = element.data();
            courses.add(course);
            //  print("allCoursesList " + course.toString());

            // Add the course to the appropriate category list
            switch (course['category']) {
              case 'jamb':
                jambCourses.add(course);
                break;
              case 'waec':
                waecCourses.add(course);
                break;
              case 'neco':
                necoCourses.add(course);
                break;
              case 'postUtme':
                postUtmeCourses.add(course);
                print("post utme courses are$postUtmeCourses");
                break;
            }
          });
        }
      });
    } catch (e) {
      loadingFailed("an error occurred");
      print(e.toString());
    }
  }

  setNewRequest(String value) {
    selectedRequest = value;
    switchRequestPrice();
    print("the price is $requestPrice");
    update();
  }

  setNewOnlineRequest(String value) {
    selectedOnlineRequest = value;
    switchOnlineReQuestPrice();
    print("the price is $onlineRequestPrice");
    update();
  }

  switchRequestPrice() {
    switch (selectedRequest) {
      case 'Junior classes 7k':
        requestPrice = '\u20a67,000 monthly';
        requestTutorPrice = 7000;
        break;
      case 'Senior classes 10k':
        requestPrice = '\u20a610,000 monthly';
        requestTutorPrice = 10000;
        break;
      case 'UTME/WAEC/GCE 12K':
        requestPrice = '\u20a612,000 monthly';
        requestTutorPrice = 12000;
        break;
      default:
        return '7,000';
    }
  }

  switchOnlineReQuestPrice(){
    switch (selectedOnlineRequest) {
      case 'Junior classes 15k':
        onlineRequestPrice = '\u20a615,000 monthly';
        onlineRequestTutorPrice = 15000;
        break;
      case 'Senior classes 18k':
        onlineRequestPrice = '\u20a618,000 monthly';
        onlineRequestTutorPrice = 18000;
        break;
      case 'UTME/WAEC/GCE 20K':
        onlineRequestPrice = '\u20a620,000 monthly';
        onlineRequestTutorPrice = 20000;
        break;
      default:
        return '15,000';
    }
  }

  setSelectedPurchasedCourse(Map course){
    selectedPurchasedCourse = course;
    update();
  }


  uploadRequest(
      {String? time,
      String? requestType,
      String? requestPrice,
      String? address}) async {
    String? userEmail = FirebaseAuth.instance.currentUser?.email;
    DateTime now = DateTime.now();
    DateTime expiryDate = now.add(Duration(days: 30));
    // String formatted = await  DateFormat('dd-MM-yy').format(expiryDate);
    // print("formattedDate is $formatted");
    try {
      startLoading(Get.context!, "Requesting Tutor...");
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('TutorRequests').add({
        'time': time,
        'requestType': requestType,
        'requestPrice': requestPrice,
        'Address': address,
        'expiryDate': expiryDate,
        'user_id': userEmail,
      }).then((value) => {
            loadingSuccessful(null),
            Get.snackbar('Success', 'Request successful'),
            Navigator.pop(Get.context!),
          });
    } catch (e) {
      print(e);
    }
  }

  addToSubscription() async {
    String? userId= FirebaseAuth.instance.currentUser?.email;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DateTime subscriptionTime= DateTime.now();
    DateTime subscriptionEnd= DateTime.now().add(Duration(days: 30));
    try {
      startLoading(Get.context!, "please wait ");
      firestore.collection('subscribers').add({
        'course_name':selectedOnlineRequest,
        'user_id': userId,
        'start_date':subscriptionTime,
        'end_date':subscriptionEnd,
        'subscriber_name': FirebaseAuth.instance.currentUser?.displayName,
        'amount': onlineRequestTutorPrice,

      }).then((value) => {
        loadingSuccessful(null),
        Get.snackbar('Success', 'Successfully subscribed'),
        Get.to(BlessedHome())
      });

    } catch (e) {
      print(e);
    }

  }


  setSelectDownloadedCourse(Map course){
    SelectedDownloadedCourse = course;
    update();
  }

  addToPurchasedCourse() async {
    String? userId= FirebaseAuth.instance.currentUser?.email;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference<Map<String, dynamic>> documentReference = users.doc(userId).collection('PurchasedCourses');
    String courseName=currentCourse['name'];
    String courseDescription=currentCourse['desc'];
    DateTime purchasedTime= DateTime.now();
    String downloadUrl= currentCourse['download'];
    try {
      startLoading(Get.context!, "please wait ");

      documentReference.add({
        'name': courseName,
        'desc':courseDescription,
        'purchased':purchasedTime,
        'downloadUrl': downloadUrl
      }).then((value) => {
        loadingSuccessful(null),
        Get.snackbar('Success', 'Successfully purchased'),
        Get.to(BlessedHome())
      });

    } catch (e) {
      print(e);
    }

  }

  PayRequest(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    //var userToken = logCtr.userTokenIdGet;
    var userEmail = auth.currentUser!.email;
    var Amount = (onlineRequestTutorPrice! * 100).toString();

    var ref = await generateRandonString();
    print("this is the transacRef oo" + ref.toString());

    Map payData = {
      "amount": Amount,
      "email": "adewaleadebayo630@gmail.com",
      "reference": ref,
      "callback_url": 'https://www.github.com',
    };

    var authUrlnew = await ApiRequest().getUserPaymentAuth(payData);
    var authUrl = authUrlnew['data']['authorization_url'];
    print('thia is the Auth url $authUrl');

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            print("this is the url  after complete" + url);
          },
          onUrlChange: (url) {
            if (url.toString().contains("https://www.github.com")) {
              //Navigator.pop(context);
            } else {
              print("this is the url " + url.url.toString());
              //Navigator.pop(context);
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("this is the url change  " + request.url);
            if (request.url.contains('https://www.github.com')) {
              Navigator.pop(context);
              uploadRequest(
                  time: timeController,
                  requestType: selectedRequest,
                  requestPrice: requestPrice,
                  address: locationController);
            } else {
              print("this is the url change  " + request.url);
              Navigator.pop(context);
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(authUrl!));

    // only pull-up the dialog box when we get the authURL
    if (authUrl != null) {
      return showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Center(
                child: Container(
              width: MediaQuery.of(context).size.width - 10,
              // height: MediaQuery.of(context).size.height - 80,
              height: MediaQuery.of(context).size.height - 0,
              padding: const EdgeInsets.only(top: 40),
              color: Colors.white,
              child: WebViewWidget(controller: controller),

            ));
          });
    }
  }

  PayOnlineRequest(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    //var userToken = logCtr.userTokenIdGet;
    var userEmail = auth.currentUser!.email;
    var Amount = (requestTutorPrice! * 100).toString();

    var ref = await generateRandonString();
    print("this is the transacRef oo" + ref.toString());

    Map payData = {
      "amount": Amount,
      "email": "adewaleadebayo630@gmail.com",
      "reference": ref,
      "callback_url": 'https://www.github.com',
    };

    var authUrlnew = await ApiRequest().getUserPaymentAuth(payData);
    var authUrl = authUrlnew['data']['authorization_url'];
    print('thia is the Auth url $authUrl');

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            print("this is the url  after complete" + url);
          },
          onUrlChange: (url) {
            if (url.toString().contains("https://www.github.com")) {
              //Navigator.pop(context);
            } else {
              print("this is the url " + url.url.toString());
              //Navigator.pop(context);
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("this is the url change  " + request.url);
            if (request.url.contains('https://www.github.com')) {
              Navigator.pop(context);
              uploadRequest(
                  time: timeController,
                  requestType: selectedRequest,
                  requestPrice: requestPrice,
                  address: locationController);
            } else {
              print("this is the url change  " + request.url);
              Navigator.pop(context);
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(authUrl!));

    // only pull-up the dialog box when we get the authURL
    if (authUrl != null) {
      return showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  // height: MediaQuery.of(context).size.height - 80,
                  height: MediaQuery.of(context).size.height - 0,
                  padding: const EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: WebViewWidget(controller: controller),

                ));
          });
    }
  }

  String generateRandonString() {
    var random = Random.secure();
    var values = List<int>.generate(10, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  setCurrentCourse(Map currentCourse){
    this.currentCourse = currentCourse;
    update();

  }

  BuyCourse(BuildContext context) async {
    toastSuccess("please wait while loading ");
    print("Buying course");
    var auth = FirebaseAuth.instance;
    //var userToken = logCtr.userTokenIdGet;
    var userEmail = auth.currentUser!.email;
    var Amount = (currentCourse['price']! * 100).toString();

    var ref = await generateRandonString();
    print("this is the transacRef oo" + ref.toString());

    Map payData = {
      "amount": Amount,
      "email": "adewaleadebayo630@gmail.com",
      "reference": ref,
      "callback_url": 'https://www.github.com',
    };

    var authUrlnew = await ApiRequest().getUserPaymentAuth(payData);
    var authUrl = authUrlnew['data']['authorization_url'];
    print('thia is the Auth url $authUrl');

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            print("this is the url  after complete" + url);
          },
          onUrlChange: (url) {
            if (url.toString().contains("https://www.github.com")) {
              //Navigator.pop(context);
            } else {
              print("this is the url " + url.url.toString());
              //Navigator.pop(context);
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print("this is the url change  " + request.url);
            if (request.url.contains('https://www.github.com')) {
              Navigator.pop(context);
              addToPurchasedCourse();

            } else {
              print("this is the url change  " + request.url);
              Navigator.pop(context);
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(authUrl!));

    // only pull-up the dialog box when we get the authURL
    if (authUrl != null) {
      return showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  // height: MediaQuery.of(context).size.height - 80,
                  height: MediaQuery.of(context).size.height - 0,
                  padding: const EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: WebViewWidget(controller: controller),

                ));
          });
    }

  }


  getAllPurchasedCourse(){
    String? userId= FirebaseAuth.instance.currentUser?.email;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference<Map<String, dynamic>> documentReference = users.doc(userId).collection('PurchasedCourses');
    try {
      startLoading(Get.context!, "please wait ");
      documentReference.snapshots().listen((snapshot) {
        if (snapshot.docs.isEmpty) {
          loadingFailed("no courses");
        } else {
          loadingSuccessful(null);
          snapshot.docs.forEach((element) {
            Map<String, dynamic> course = element.data();
            purchasedCourse.add(course);
            print("allCoursesList " + course.toString());
          });
        }
      });
    } catch (e) {
      loadingFailed("an error occurred");
      print(e.toString());
    }
  }


  downloadSelectedPurchasedCourse() async {

    startLoading(Get.context!, "Downloading course");
    String? url= selectedPurchasedCourse!['downloadUrl'];
    String courseName= selectedPurchasedCourse!['name'];
    print("Downloading course");
    // Check storage permission (optional)
    if (await Permission.storage.request().isGranted) {
      try{

          // Get the file data from the URL
          final response = await http.get(Uri.parse(url!));

          // Get the temporary directory path
          Directory tempDir = await getTemporaryDirectory();
          File tempFile = File('${tempDir.path}/$courseName.pdf');

          // Write the file data to the temporary file
          await tempFile.writeAsBytes(response.bodyBytes);
          loadDownloadedCourses();
          loadingSuccessful("Download successful");

          print('File downloaded to ${tempFile.path}');

        // });


      } catch (e) {
        loadingFailed("Download failed");
        print(e.toString());
      }


  }
    else {
      loadingFailed("storage not permitted");
      requestStoragePermission();
      print('Storage permission not granted!');
    }

      }


      loadDownloadedCourses() async {
        Directory tempDir = await getTemporaryDirectory();
        List<FileSystemEntity> files = tempDir.listSync();
        for (FileSystemEntity file in files) {
          if (file is File) {
            downloadedCourses.add({'name': file.path.split('/').last,
              'path': file.path,
            });
          }
        }
        update();
      }

  }




  Future<void> requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      // Request storage permission
      status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted
        print('Storage permission granted');
      } else {
        // Permission denied
        print('Storage permission denied');
      }
    } else {
      // Permission already granted
      print('Storage permission already granted');
    }
  }



