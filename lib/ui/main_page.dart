import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/add_item_btn.dart';
import 'package:apple_shop_y213_31/ui/add_item_page.dart';
import 'package:apple_shop_y213_31/ui/selected_phones_display.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Iphone> selectedPhones = [];
  void _handleAddItem() async {
    final selectedPhone = await Navigator.push<Iphone>(
      context,
      MaterialPageRoute(builder: (context) => AddItemPage()),
    );
    if (!mounted) return;
    if (selectedPhone != null) {
      setState(() {
        selectedPhones.add(selectedPhone);
      });
    }
  }

  void _handleDelete(BuildContext context, int index, String phoneName) async {
    if (await confirm(
      context,
      content: Center(
        child: Text(
          "確認刪除 $phoneName ?",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          ),
        ),
      ),
    )) {
      setState(() {
        selectedPhones.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              "歡迎來到蘋果商店",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
              ),
            ),
            Expanded(
              child: SelectedPhonesDisplay(
                selectedPhones: selectedPhones,
                handleDeleteFn: _handleDelete,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Row(
                children: [
                  /*   Expanded(
                    child: TextButton(
                      onPressed: _handleAddItem,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "新增商品",
                        style: TextStyle(
                          fontSize: Theme.of(
                            context,
                          ).textTheme.headlineLarge?.fontSize,
                        ),
                      ),
                    ),
                  ), */
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "前往結帳",
                        style: TextStyle(
                          fontSize: Theme.of(
                            context,
                          ).textTheme.headlineLarge?.fontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddItemBtn(handleAddItem: _handleAddItem),
    );
  }
}
