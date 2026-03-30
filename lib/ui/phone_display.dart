import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:flutter/material.dart';

const imageRatio = 1 / 6;

class PhoneDisplay extends StatelessWidget {
  final Iphone phone;
  const PhoneDisplay({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    debugPrint(phone.getImage());
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              phone.getImage(),
              width: MediaQuery.of(context).size.width * imageRatio,
              height: MediaQuery.of(context).size.height * imageRatio,
              fit: BoxFit.contain,
              cacheWidth: 200,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 80),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phone.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${phone.getPrice()}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
