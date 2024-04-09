import 'package:blessed_academy/DataHandlers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/colors.dart';

class RequestOnlineTutor extends StatefulWidget {
  const RequestOnlineTutor({super.key});

  @override
  State<RequestOnlineTutor> createState() => _RequestOnlineTutorState();
}

class _RequestOnlineTutorState extends State<RequestOnlineTutor> {
  final HomeController _HomeController = HomeController();

  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();



  @override
  void initState() {
    super.initState();
  }


  String dropdownValue = 'Junior classes 7k';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Online Class',
                  style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kColorMainPrimary,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.start,
                  'Select type of class',
                  // style: TextStyle(fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //     color: kColorMainPrimary,
                  // ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: kColorMainPrimary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    //padding: const EdgeInsets.only(left: 120),
                    hint: Text("Select Class"),
                    value: _HomeController.selectedOnlineRequest,
                    borderRadius: BorderRadius.circular(12),
                    alignment: Alignment.center,
                    elevation: 16,
                    // decoration: InputDecoration(
                    //   hintText: 'Select Class',
                    //   border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    // ),
                    items: _HomeController.OnlinerequestOptions.map<
                        DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                          textAlign: TextAlign.right,
                        ),
                      );
                    }).toList(),
                    onChanged: (Value) {
                      setState(() {
                        //_HomeController.selectedRequest = newValue!;
                        _HomeController.setNewOnlineRequest(Value!);
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: _HomeController.onlineRequestPrice,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //_HomeController.testCharge();
                    _HomeController.PayOnlineRequest(context);
                    // _HomeController.uploadRequest(
                    //   time: _timeController.text,
                    //   requestType: _HomeController.selectedRequest,
                    //   requestPrice: _HomeController.requestPrice,
                    //   address: _locationController.text,
                    // );
                  },
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      _timeController.text = picked.format(context);
    }
  }
}
