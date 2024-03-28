import 'dart:async';

import 'package:blessed_academy/core/network_err.dart';
import 'package:blessed_academy/views/ui/home/BlessedHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var isLogged = false.obs;
  var user = {}.obs;
  String emailA = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController levelController=TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController CpasswordController= TextEditingController();


  String get email => emailController.text;
  String? get fullname => fullnameController.text;
  String? get phoneNumber => phoneNumberController.text;
  String? get level => levelController.text;
  String? get password => passwordController.text;
  String? get Cpassword => CpasswordController.text;

  void login() {
    isLogged.value = true;
  }

  void logout() {
    isLogged.value = false;
  }

  createAccount() async{
    try{
      print('creating account'  + email + password!);
      startLoading(Get.context!);
     await  _auth.createUserWithEmailAndPassword(email: email, password: password!).
      then((value){
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection('users').add({
          'fullname': fullname,
          'phoneNumber': phoneNumber,
          'level': level,
        }).then((value) => {
           loadingSuccessful(null),
          Get.to(() => BlessedHome())

        });
        Get.snackbar('Success', 'Account created successfully');
      }).catchError((error){
        loadingFailed("an error Occured");
        Get.snackbar('Error', error.toString());
      });
    } on FirebaseException catch (e){

      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
    } else if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'The email address is badly formatted.');

    } else if (e.code== 'auth/email-already-exists'){
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection('users').add({
          'fullname': fullname,
          'phoneNumber': phoneNumber,
          'level': level,
        }).then((value) => {

          Get.to(() => BlessedHome())

        });

     // Get.snackbar('Error', 'The email address is already in use by another account.');
      }

  }


 Future<void>saveUserAccount()  async {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection('users').add({
          'fullname': fullname,
          'phoneNumber': phoneNumber,
          'level': level,
        });
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
 }

}

 validatePassword(){
    if(password != Cpassword){
      Get.snackbar('Error', 'Passwords do not match');
    }
    return true;
  }


  void LoginUser() async {
    try {
      startLoading(Get.context!);
      await _auth.signInWithEmailAndPassword(email: email, password: password!).then((value) {
        loadingSuccessful(null);
        Get.to(() => BlessedHome());
      }).catchError((error) {
        loadingFailed("an error Occured");
        Get.snackbar('Error', error.toString());
      });
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      }
    }
  }

}