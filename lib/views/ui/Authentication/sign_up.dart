import 'package:blessed_academy/DataHandlers/AuthController.dart';
import 'package:blessed_academy/DataHandlers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthController _AuthController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<FormState>();
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const Text('Sign Up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _AuthController.fullnameController,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _AuthController.phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Phone Number ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _AuthController.levelController,
                    decoration: InputDecoration(
                      hintText: 'Academic level. eg Jambite',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _AuthController.emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  TextField(
                    controller: _AuthController.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                 TextField(
                   controller: _AuthController.CpasswordController,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: () {
                    if (_AuthController.phoneNumberController.text.isNotEmpty &&
                        _AuthController.emailController.text.isNotEmpty &&
                        _AuthController.passwordController.text.isNotEmpty &&
                        _AuthController.CpasswordController.text.isNotEmpty
                        ) {
                             if(_AuthController.passwordController.text == _AuthController.CpasswordController.text){
                               _AuthController.createAccount();
                             }
                             else{
                               Get.snackbar('Error', 'Passwords do not match');
                             }

                    } else{
                      Get.snackbar('Error', 'Please fill all fields');
                    }
                  },
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(onPressed: () {
                      Get.to(()=>SignUp());
                      }, child: const Text('Login'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
