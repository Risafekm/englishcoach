import 'package:englishcoach/presentation/dashboard/screens/audio_chat_room.dart';
import 'package:englishcoach/presentation/dashboard/screens/my_teacher.dart';
import 'package:englishcoach/presentation/dashboard/screens/preliminary_test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dashboard/screens/PreliminaryTest2.dart';

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
            trailing: const Icon(
              Icons.assignment,
              color: Colors.white
            ),
            title: Text(
              'Preliminary Test 1',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PreliminaryTest()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.lock,
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
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PreliminaryTest2()));
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
              Navigator.pop(context);
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
                  textStyle: const TextStyle(
                color: Colors.white
              )),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyTeacher()));
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
                  textStyle: const TextStyle(
                color: Colors.white
              )),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
