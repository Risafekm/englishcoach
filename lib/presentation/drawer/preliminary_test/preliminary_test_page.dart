import 'package:englishcoach/presentation/drawer/preliminary_test/test2/test2.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test/widgets/button_test.dart';
import 'package:flutter/material.dart';

class PriliminaryTest extends StatelessWidget {
  const PriliminaryTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Preliminary Tests',
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.power_settings_new,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ButtonTest(
              onTap: () {},
              color: Colors.grey,
              test: 'Test 1',
              icon: true,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ButtonTest(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Test2()));
              },
              color: const Color.fromARGB(255, 95, 214, 101),
              test: 'Test 2',
              icon: false,
            ),
          ),
        ],
      ),
    );
  }
}
