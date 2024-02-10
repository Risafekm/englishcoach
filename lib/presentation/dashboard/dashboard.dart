import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drawer/drawer.dart';
import 'widget/custom_card_widget.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 198, 206, 212),
        drawer: const DrawerPage(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'English Coach',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Color.fromARGB(255, 11, 66, 112),
                  letterSpacing: .5,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.power_settings_new_rounded,
                color: Color.fromARGB(255, 11, 66, 112),
              ),
            ),
          ],
        ),
        body:  Column(
          children: [
            const SizedBox(height: 10),
            CustomCard(
              text: 'No Of Questions',
              icon: Icons.arrow_forward_ios,
              ontap: (){},
            ),
            CustomCard(
              text: 'No of Students',
              icon: Icons.arrow_forward_ios,
              ontap: (){},
            ),
            CustomCard(
              text: 'No of Answers',
              icon: Icons.arrow_forward_ios,
              ontap: (){},
            ),
            CustomCard(
              text: 'List',
              icon: Icons.arrow_forward_ios,
              ontap: (){},
            ),
          ],
        ));
  }
}
