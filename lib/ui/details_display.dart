import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/phone_display.dart';
import 'package:flutter/material.dart';

class DetailsDisplay extends StatelessWidget {
  final List<Iphone> phones;
  const DetailsDisplay({super.key, required this.phones});

  @override
  Widget build(BuildContext context) {
    final total = phones
        .map((phone) => phone.getPrice())
        .fold(0, (a, b) => a + b);
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "請確認您的明細",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  PhoneDisplay(phone: phones[index]),
              itemCount: phones.length,
            ),
          ),
          Center(
            child: Text(
              "總金額：$total",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
