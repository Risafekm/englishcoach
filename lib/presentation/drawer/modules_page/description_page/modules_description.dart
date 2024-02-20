// ignore_for_file: must_be_immutable

import 'package:englishcoach/domain/model/modulesmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionPage extends StatelessWidget {
  Modules data;
  DescriptionPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          'Modules',
          style: GoogleFonts.lora(
              fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              data.modName.toString(),
              style:
                  GoogleFonts.lora(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.modDescription.toString(),
                style:
                    GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              data.modContent,
              style:
                  GoogleFonts.lora(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.modSpecialnote.toString(),
                style: GoogleFonts.lora(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.modExampleExplanation.toString(),
                style:
                    GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
