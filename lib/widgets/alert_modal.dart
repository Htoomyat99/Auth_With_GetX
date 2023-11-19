import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertModal extends StatelessWidget {
  const AlertModal(
      {super.key,
      required this.titleText,
      required this.contentText,
      required this.onClosed,
      required this.btnText});

  final String titleText, contentText, btnText;
  final void Function() onClosed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: Center(
        child: Text(
          titleText,
          style: GoogleFonts.lato(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        contentText,
        style: GoogleFonts.lato(color: Colors.black, fontSize: 16),
      ),
      // contentPadding: EdgeInsets.all(16),
      actions: [
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: onClosed,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text(
                btnText,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
