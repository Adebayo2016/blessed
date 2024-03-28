
import 'package:blessed_academy/utils/colors.dart';
import 'package:flutter/material.dart';


class BadNetwork extends StatelessWidget {
  const BadNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(Icons.warning,color:  kColorMainPrimary,size: 20),
              Text(
                "No Internet Connection",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColorMainPrimary,
                  fontSize: 17,
                ),
              ),
              Text(
                "Please check your connection and try again,"
                ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColorMainPrimary,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      left: 0, right: 0.0, top: 15.0, bottom: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: kColorMainPrimary,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      'OK',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: kColorMainPrimary,
                    ),
                  ),
                ),
              )),
            ],
          )),
    );
  }
}