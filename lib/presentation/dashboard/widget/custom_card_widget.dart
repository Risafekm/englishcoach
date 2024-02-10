import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.text, required this.icon, required this.ontap});

  final String text;
  final IconData icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 152, 184, 238),
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 150,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 152, 184, 238),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_image.jpg'),
            ),
            Text(
              text,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
                onTap: ontap,
                child: Icon(
                  icon,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
