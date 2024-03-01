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
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaPFJC-r3YeVbBL0ydVAMARkzcEliCloXfLw&usqp=CAU'),
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
