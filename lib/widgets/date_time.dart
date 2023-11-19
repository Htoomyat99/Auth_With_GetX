import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget(
      {super.key, required this.datePicker, required this.dateOfBirth});

  final void Function() datePicker;
  final String dateOfBirth;

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    dateOfBirth.isNotEmpty ? dateOfBirth : 'Date of Birth',
                    style: GoogleFonts.lato(
                        color: dateOfBirth.isEmpty ? Colors.grey : Colors.black,
                        fontSize: 15),
                  ),
                ],
              ),
              Text(
                'mm-dd-yy',
                style: GoogleFonts.lato(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
