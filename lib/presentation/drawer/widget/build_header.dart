import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    //  color: const Color.fromARGB(255, 6, 48, 82),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile_image.jpg'),
          ),
          const SizedBox(height: 10),
          Text(
            'Hello ,Mariya John',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
