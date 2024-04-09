import 'package:blessed_academy/views/ui/books/DownloadedBooks.dart';
import 'package:blessed_academy/views/ui/home/AllCourses/postUtme.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import 'PurchasedBooks.dart';

class BookTab extends StatefulWidget {
  const BookTab({Key? key}) : super(key: key);

  @override
  _BookTabState createState() => _BookTabState();
}

class _BookTabState extends State<BookTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
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

                    //  fontFamily: TRENDA_SEMI_BOLD,
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
                      text: "Purchased",
                    ),
                    Tab(
                      text: "Downloaded",
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
                      PurchasedBooks(),
                      DownloadedBooks()

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
