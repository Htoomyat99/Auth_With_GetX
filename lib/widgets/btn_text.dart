import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.onPressed, required this.btnText});

  final void Function() onPressed;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Colors.teal),
          onPressed: onPressed,
          child: Text(
            btnText,
            style: GoogleFonts.lato(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
