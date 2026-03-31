import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

const double checkmarkRatio = 1 / 2;

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with TickerProviderStateMixin {
  late GifController _controller;
  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        Navigator.pop(context, true);
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "下單成功！",
                  style: TextStyle(
                    fontSize: Theme.of(
                      context,
                    ).textTheme.displayMedium?.fontSize,
                  ),
                ),
              ),
              /* Image.asset(
                "assets/checkmark.gif",
                width: MediaQuery.of(context).size.width * checkmarkRatio,
                height: MediaQuery.of(context).size.height * checkmarkRatio,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 80),
              ), */
              Gif(
                image: const AssetImage("assets/checkmark.gif"),
                controller: _controller,
                autostart: Autostart.once,
                onFetchCompleted: () {
                  _controller.reset();
                  _controller.forward();
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  "返回主頁面",
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
