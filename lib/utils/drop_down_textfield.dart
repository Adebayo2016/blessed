import 'package:flutter/material.dart';

import '../src/themes.dart';

class BlessedDropdownBtn extends StatefulWidget {
  List<DropdownMenuItem<Object>>? items;
  String? label;
  double width;
  Function(dynamic)? onChange;

  BlessedDropdownBtn({
    super.key,
    @required this.items,
    this.onChange,
    this.label,
    this.width = 90, // width is in percentage
  });
  @override
  _BlessedDropdownBtnState createState() => _BlessedDropdownBtnState();
}

class _BlessedDropdownBtnState extends State<BlessedDropdownBtn> {
  dynamic currentValue;
  Widget? dropdown;
  FocusNode? focusNode;
  double? width;
  double height = 55;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentValue == null) {
      dropdown = _buildEmptyDropdown();
    } else {
      dropdown = _buildFilledDropdown();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label ?? '', style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        SizedBox(
          width: (widget.width),
          height: height,
          child: dropdown,
        )
      ],
    );

    // return Container(
    //   margin: const EdgeInsets.symmetric(horizontal: 20),
    //   child: dropdown,
    // );
  }

  DropdownButtonFormField _buildEmptyDropdown() {
    return DropdownButtonFormField(
      onTap: () {
        setState(() {
          dropdown = _buildFilledDropdown();
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        errorBorder: errorBorder,
        enabledBorder: emptyBorder,
      ),
      items: widget.items,
      value: currentValue,
      onChanged: (v) {
        setState(() {
          currentValue = v;
        });
        if (widget.onChange != null) {
          widget.onChange!(v);
        }
      },
    );
  }

  Widget _buildFilledDropdown() {
    focusNode!.requestFocus();
    return Focus(
        onFocusChange: (hasFocus) {
          print('Focus change here: $hasFocus');
          // if (!hasFocus) {
          //   if (currentValue == null) {
          //     setState(() {
          //       dropdown = _buildEmptyDropdown();
          //     });
          //   }
          // }
        },
        child: DropdownButtonFormField(
          focusNode: focusNode,
          decoration: InputDecoration(
              errorBorder: errorBorder,
              enabledBorder: normalBorder,
              focusedBorder: normalBorder),
          items: widget.items,
          value: currentValue,
          onChanged: (v) {
            setState(() {
              currentValue = v;
            });
          },
        ));
  }
}
