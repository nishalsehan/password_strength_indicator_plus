import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:password_strength_indicator_plus/password_strength_indicator_plus.dart';

import '../widgets/widget_barrel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.9,
            child: Text(
              'Set a Password',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            width: size.width * 0.9,
            child: Text(
              'Please create a secure password including the following criteria below',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          PasswordTextField(
            hint: 'Password',
            controller: controller,
            setState: setState,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          PasswordStrengthIndicatorPlus(
            textController: controller,
            maxLength: 12,
            minLength: 8,
            successIcon: Iconsax.tick_circle,
            unSuccessIcon: Iconsax.close_circle,
            textSize: 16,
          ),
        ],
      ),
    );
  }
}
