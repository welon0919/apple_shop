import 'package:apple_shop_y213_31/ui/success_page.dart';
import 'package:http/http.dart' as http;
import 'package:apple_shop_y213_31/model/phone.dart';
import 'package:apple_shop_y213_31/ui/details_display.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CheckoutPage extends StatefulWidget {
  final List<Iphone> phones;
  const CheckoutPage({super.key, required this.phones});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _nameInputController = TextEditingController();
  final _phoneInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: "TWN");
  bool _isPhoneValid = false;
  bool _isFormValid = false;
  @override
  void dispose() {
    _nameInputController.dispose();
    _phoneInputController.dispose();
    super.dispose();
  }

  void _updateFormState() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  void _goToSuccessPage() async {
    final success = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (context) => SuccessPage()),
    );
    if ((success ?? false) && mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> _submitOrder() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse(
        "https://docs.google.com/forms/d/e/1FAIpQLSelZtPJVrbhoTgbi-bIK8OZZvyxJoj_0vbxzpWYvy4s_R-uRw/formResponse",
      );
      /*
       * name entry.1347567532
       * phone entry.1406002170
       * things entry.543727871
       * total entry.1307429562
       */
      String itemString = widget.phones.join(", ");
      final total = widget.phones
          .map((phone) => phone.getPrice())
          .fold(0, (a, b) => a + b);

      try {
        final response = await http.post(
          url,
          body: {
            "entry.1347567532": _nameInputController.text,
            "entry.1406002170": _phoneNumber.phoneNumber,
            "entry.543727871": itemString,
            "entry.1307429562": total.toString(),
          },
        );
        if (response.statusCode == 200 && mounted) {
          _goToSuccessPage();
        }
      } catch (e) {
        if (mounted) {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error occured"),
                content: Text(
                  e.toString(),
                  style: TextStyle(color: Colors.red),
                ),
                actions: [
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: _formKey,
          onChanged: _updateFormState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),

                child: Column(
                  spacing: 10,

                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hint: Text("輸入您的姓名"),
                        prefixIcon: Icon(Icons.account_circle, size: 30),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? "請輸入您的名字"
                          : null,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                    ),
                    InternationalPhoneNumberInput(
                      textFieldController: _phoneInputController,
                      countries: ['TW', 'US', 'JP', 'KR', 'SG'],
                      onInputChanged: (number) {
                        _phoneNumber = number;
                      },
                      onInputValidated: (valid) {
                        setState(() {
                          _isPhoneValid = valid;
                        });
                        _updateFormState();
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        useBottomSheetSafeArea: true,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "請輸入電話號碼";
                        }
                        if (!_isPhoneValid && value.isNotEmpty) {
                          return "電話格式錯誤";
                        }
                        return null;
                      },

                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      formatInput: true,
                      keyboardType: TextInputType.phone,
                      hintText: "輸入電話號碼",
                      inputDecoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "輸入電話號碼",
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Center(child: DetailsDisplay(phones: widget.phones)),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _isFormValid ? _submitOrder : null,
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  "確認購買",
                  style: TextStyle(
                    fontSize: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
