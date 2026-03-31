import 'package:flutter/material.dart';

class AddItemBtn extends StatefulWidget {
  final VoidCallback handleAddItem;
  const AddItemBtn({super.key, required this.handleAddItem});

  @override
  State<AddItemBtn> createState() => _AddItemBtnState();
}

class _AddItemBtnState extends State<AddItemBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () => widget.handleAddItem(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
