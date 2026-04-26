import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/phone_display.dart';
import 'package:flutter/material.dart';

typedef HandleDeleteFn = void Function(BuildContext, int, String);

class SelectedPhonesDisplay extends StatelessWidget {
  final List<Iphone> _selectedPhones;
  final HandleDeleteFn _handleDeleteFn;
  const SelectedPhonesDisplay({
    super.key,
    required List<Iphone> selectedPhones,
    required HandleDeleteFn handleDeleteFn,
  }) : _handleDeleteFn = handleDeleteFn,
       _selectedPhones = selectedPhones;

  @override
  Widget build(BuildContext context) {
    if (_selectedPhones.isEmpty) {
      return Center(
        child: Text(
          "尚未選擇任何商品！",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
          ),
        ),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) => InkWell(
          onLongPress: () {
            _handleDeleteFn(context, index, _selectedPhones[index].toString());
          },
          child: PhoneDisplay(phone: _selectedPhones[index]),
        ),

        itemCount: _selectedPhones.length,
      );
    }
  }
}
