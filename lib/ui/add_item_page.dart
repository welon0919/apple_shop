import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/phone_display.dart';
import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  IphoneModel? _selectedModel;
  Storage? _selectedStorage;
  IphoneColor? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, bottom: 10),
        child: Center(
          child: Column(
            spacing: 20,

            children: [
              DropdownMenu(
                label: const Text("選擇手機型號"),
                dropdownMenuEntries: Iphone.getModelOptions()
                    .map(
                      (model) => DropdownMenuEntry(
                        value: model,
                        label: model.toString(),
                      ),
                    )
                    .toList(),
                onSelected: (selected) {
                  setState(() {
                    _selectedModel = selected;
                    if (selected != null) {
                      _selectedStorage = selected.getStorageOptions()[0];
                      debugPrint(selected.getColorOptions().toString());
                      _selectedColor = selected.getColorOptions()[0];
                    }
                  });
                },
              ),
              if (_selectedModel != null)
                Column(
                  spacing: 20,
                  key: ValueKey(_selectedModel),
                  children: [
                    DropdownMenu<Storage>(
                      label: const Text("選擇手機容量"),
                      dropdownMenuEntries: _selectedModel!
                          .getStorageOptions()
                          .map(
                            (storageOption) => DropdownMenuEntry(
                              value: storageOption,
                              label: storageOption.toString(),
                            ),
                          )
                          .toList(),
                      initialSelection: _selectedModel!.getStorageOptions()[0],
                      onSelected: (selectedStorage) {
                        setState(() {
                          _selectedStorage = selectedStorage;
                        });
                      },
                    ),
                    DropdownMenu<IphoneColor>(
                      label: const Text("選擇手機顏色"),
                      dropdownMenuEntries: _selectedModel!
                          .getColorOptions()
                          .map(
                            (colorOption) => DropdownMenuEntry(
                              value: colorOption,
                              label: colorOption.toString(),
                            ),
                          )
                          .toList(),
                      initialSelection: _selectedModel!.getColorOptions()[0],
                      onSelected: (selectedColor) {
                        setState(() {
                          _selectedColor = selectedColor;
                        });
                      },
                    ),
                  ],
                )
              else
                const SizedBox(),
              if (_selectedModel != null &&
                  _selectedStorage != null &&
                  _selectedColor != null)
                PhoneDisplay(
                  phone: Iphone(
                    _selectedModel!,
                    _selectedStorage!,
                    _selectedColor!,
                  ),
                )
              // Text("$_selectedModel, $_selectedStorage")
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
      floatingActionButton:
          _selectedModel != null &&
              _selectedStorage != null &&
              _selectedColor != null
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Iphone(_selectedModel!, _selectedStorage!, _selectedColor!),
                );
              },
              child: const Icon(Icons.done),
            )
          : null,
    );
  }
}
