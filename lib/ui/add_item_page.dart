import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/phone_display.dart';
import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  final IphoneModel model;
  const AddItemPage({super.key, required this.model});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  late Storage _selectedStorage;
  late IphoneColor _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedStorage = widget.model.getStorageOptions()[0];
    _selectedColor = widget.model.getColorOptions()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, bottom: 10),
        child: Center(
          child: Column(
            spacing: 20,

            children: [
              Column(
                spacing: 20,
                key: ValueKey(widget.model),
                children: [
                  Text(
                    widget.model.toString(),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 20),
                  DropdownMenu<Storage>(
                    label: const Text("選擇手機容量"),
                    dropdownMenuEntries: widget.model
                        .getStorageOptions()
                        .map(
                          (storageOption) => DropdownMenuEntry(
                            value: storageOption,
                            label: storageOption.toString(),
                          ),
                        )
                        .toList(),
                    initialSelection: widget.model.getStorageOptions()[0],
                    onSelected: (selectedStorage) {
                      setState(() {
                        if (selectedStorage != null) {
                          _selectedStorage = selectedStorage;
                        }
                      });
                    },
                  ),
                  DropdownMenu<IphoneColor>(
                    label: const Text("選擇手機顏色"),
                    dropdownMenuEntries: widget.model
                        .getColorOptions()
                        .map(
                          (colorOption) => DropdownMenuEntry(
                            value: colorOption,
                            label: colorOption.toString(),
                          ),
                        )
                        .toList(),
                    initialSelection: widget.model.getColorOptions()[0],
                    onSelected: (selectedColor) {
                      setState(() {
                        if (selectedColor != null) {
                          _selectedColor = selectedColor;
                        }
                      });
                    },
                  ),
                ],
              ),
              PhoneDisplay(
                phone: Iphone(widget.model, _selectedStorage, _selectedColor),
              ),
              // Text("$_selectedModel, $_selectedStorage")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            Iphone(widget.model, _selectedStorage, _selectedColor),
          );
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
