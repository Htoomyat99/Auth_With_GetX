import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInputBox extends StatelessWidget {
  const PasswordInputBox(
      {super.key,
      required this.inputText,
      required this.hintText,
      required this.controller,
      required this.icon,
      required this.obsecureText,
      required this.toggleVisibility,
      required this.keyboardType});

  final String inputText;
  final TextEditingController controller;
  final bool keyboardType;
  final String hintText;
  final Icon icon;
  final bool obsecureText;
  final void Function() toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: TextField(
        keyboardType: keyboardType == true ? TextInputType.number : null,
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          // icon: icon,
          prefixIcon: icon,
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.teal
                  : Colors.grey), // prefix icon colors change when focused
          suffix: InkWell(
            onTap: toggleVisibility,
            child: Icon(
              obsecureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            ),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(13),
          floatingLabelBehavior: FloatingLabelBehavior
              .never, // focus ရင် အပေါ်ဆုံးမာ hint text မပေါ်တာ
          filled: true,
          fillColor: Colors.white,
          label: Text(
            inputText,
            style: GoogleFonts.lato(color: Colors.grey[500], fontSize: 15),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
