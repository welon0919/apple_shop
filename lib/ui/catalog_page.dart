import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/add_item_page.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.4;
    final height = size.height * 0.4;
    return Scaffold(
      body: Column(
        spacing: 30,
        children: [
          const SizedBox(height: 30),
          Text("請選擇想要的商品", style: Theme.of(context).textTheme.displayMedium),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth ~/ width;
                final allIphones = Model.values;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: allIphones.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => _handleSelectItem(context, allIphones[index]),
                    child: Card(
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                allIphones[index].catalogImage,
                                width: width.toDouble(),
                                height: height.toDouble(),
                              ),
                            ),
                            Text(
                              allIphones[index].toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleSelectItem(BuildContext context, Model model) async {
    final selectedPhone = await Navigator.push<Iphone>(
      context,
      // MaterialPageRoute(builder: (context) => AddItemPage()),
      MaterialPageRoute(builder: (context) => AddItemPage(model: model)),
    );
    if (!context.mounted) return;
    if (selectedPhone != null) {
      Navigator.pop(context, selectedPhone);
    }
  }
}
