import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmAlertModal extends StatelessWidget {
  const ConfirmAlertModal(
      {super.key,
      required this.cancelText,
      required this.titleText,
      required this.contentText,
      required this.onClosed,
      required this.confirmAction,
      required this.confirmText});

  final String titleText, contentText, confirmText, cancelText;
  final void Function() confirmAction;

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
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: onClosed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade600),
                  child: Text(
                    cancelText,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: confirmAction,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Text(
                    confirmText,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
