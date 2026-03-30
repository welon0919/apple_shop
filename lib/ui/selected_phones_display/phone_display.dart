import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:flutter/material.dart';

class PhoneDisplay extends StatelessWidget {
  final Iphone phone;
  const PhoneDisplay({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(phone.toString()),
      trailing: Text(phone.getPrice().toString()),
      leading: Image.asset(phone.getImage()),
    );
  }
}
