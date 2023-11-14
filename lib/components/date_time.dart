import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key, required this.datePicker});

  final void Function() datePicker;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: datePicker,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.065,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Icon(
              Icons.calendar_month,
              color: Colors.grey,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Date of birth',
              style: GoogleFonts.lato(color: Colors.grey, fontSize: 15),
            ),
          ]),
        ),
      ),
    );
  }
}
