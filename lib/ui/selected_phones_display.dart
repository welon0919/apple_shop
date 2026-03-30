import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/selected_phones_display/phone_display.dart';
import 'package:flutter/material.dart';

class SelectedPhonesDisplay extends StatelessWidget {
  final List<Iphone> _selectedPhones;
  const SelectedPhonesDisplay({super.key, required List<Iphone> selectedPhones})
    : _selectedPhones = selectedPhones;

  @override
  Widget build(BuildContext context) {
    if (_selectedPhones.isEmpty) {
      return Text(
        "尚未選擇任何手機！",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) =>
            PhoneDisplay(phone: _selectedPhones[index]),
        itemCount: _selectedPhones.length,
      );
    }
  }
}
