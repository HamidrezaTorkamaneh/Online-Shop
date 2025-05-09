import 'package:flutter/material.dart';
import 'package:online_shop/widgets/custom_color.dart';

class PassTextField extends StatefulWidget {
  String text;
  TextEditingController? controller = TextEditingController();

  PassTextField({super.key, required this.controller, required this.text});

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextField(


      controller: widget.controller,
      style: theme.textTheme.headline1?.apply(
        fontSizeDelta: 4,
      ),
      obscureText: obscureText,


      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        prefixIcon: Icon(Icons.lock),
        labelText: widget.text,
        labelStyle: theme.textTheme.headline1?.apply(
          fontSizeDelta: 2,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2, color: CustomColor.blueColor2),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
