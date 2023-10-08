import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PasswordTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final void Function(void Function()) setState;

  const PasswordTextField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.setState});

  @override
  State<StatefulWidget> createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  late FocusNode focusNode = FocusNode();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        obscureText: !_passwordVisible,
        keyboardType: TextInputType.text,
        controller: widget.controller,
        focusNode: focusNode,
        onChanged: (value) {
          widget.setState(() {});
        },
        showCursor: false,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.02, right: size.width * 0.01),
              child: Icon(_passwordVisible ? Iconsax.eye3 : Iconsax.eye_slash,
                  color: focusNode.hasFocus ? Colors.black54 : Colors.black26,
                  size: size.height * 0.022),
            ),
            onTap: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: size.width * 0.15,
          ),
          hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.black38,
              fontWeight: FontWeight.w500,
              height: 1.4,
              letterSpacing: 1.5),
          counterText: "",
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.018, horizontal: size.width * 0.04),
        ),
        cursorColor: Colors.black26,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            height: 1.4,
            letterSpacing: 1.5),
      ),
    );
  }

  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }
}
