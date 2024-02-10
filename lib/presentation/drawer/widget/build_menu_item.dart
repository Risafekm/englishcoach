import 'package:englishcoach/presentation/dashboard/screens/audio_chat_room.dart';
import 'package:englishcoach/presentation/dashboard/screens/my_teacher.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/test2_home.dart';
import 'package:englishcoach/presentation/drawer/priliminary_tests1/Test1_homepage/Test1_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            trailing: const Icon(Icons.assignment, color: Colors.white),
            title: Text(
              'Preliminary Test 1',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Test1()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.assignment,
              color: Colors.white,
            ),
            title: Text(
              'Preliminary Test 2',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Test2Home()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.mic_none,
              color: Colors.white,
            ),
            title: Text(
              'Audio Chat Room',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AudioChatRoom()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
            title: Text(
              'My Teacher',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white)),
            ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyTeacher()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.power_settings_new_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
