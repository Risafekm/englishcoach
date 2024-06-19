// ignore_for_file: use_build_context_synchronously

import 'package:englishcoach/application/provider/user_count_provider.dart';
import 'package:englishcoach/application/provider/user_provider_payment_coupon.dart';
import 'package:englishcoach/domain/export/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserMcqQuestionsOptions()),
        ChangeNotifierProvider(create: (context) => UserproviderPassword()),
        ChangeNotifierProvider(create: (context) => UserproviderTest()),
        ChangeNotifierProvider(create: (context) => UserProviderTest2()),
        ChangeNotifierProvider(create: (context) => UserproviderModules()),
        ChangeNotifierProvider(create: (context) => UserProviderExercises()),
        ChangeNotifierProvider(create: (context) => UserproviderFinalTest()),
        ChangeNotifierProvider(create: (context) => UserproviderTopicTest()),
        ChangeNotifierProvider(create: (context) => UserProviderTrail()),
        ChangeNotifierProvider(create: (context) => UserproviderCoupon()),
        ChangeNotifierProvider(create: (context) => UserCountProvider()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: RootScreen()),
    ),
  );
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkIfLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data == true) {
          return const SplashScreen();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}

// class RootScreen extends StatelessWidget {
//   const RootScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen();
//   }
// }

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
