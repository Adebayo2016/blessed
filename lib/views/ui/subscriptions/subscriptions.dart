import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import 'Offline.dart';
import 'Online.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live>  with SingleTickerProviderStateMixin{



  late TabController _tabController;
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(height: 26,),
              Container(
                // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                //   height: 43,
                margin: const EdgeInsets.only(left: 43, right: 43),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  // borderRadius: BorderRadius.circular(25),
                  // boxShadow: [
                  //   BoxShadow(color: Colors.grey, blurRadius: 2),
                  // ],
                ),
                child: TabBar(
                  indicatorWeight: 3,
                  controller: _tabController,
                  labelStyle: const TextStyle(
                    fontSize: 12, color: kColorBlack,
                    fontWeight: FontWeight.w500,

                  ),
                  // labelPadding: context.insetsOnly(
                  //   left: 51,
                  //   right: 51,
                  //   top: 15,
                  //   bottom: 11,
                  //),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: kColorBlack,
                      width: 3,
                    ),

                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xFF737373),
                  tabs: const [
                    Tab(
                      text: "Online",
                    ),
                    Tab(
                      text: "Offline",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
                  child: TabBarView(
                    controller: _tabController,
                    children:  [
                      OnlineSubs(),
                      OfflineSub()

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
