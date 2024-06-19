// ignore_for_file: use_build_context_synchronously

import 'package:englishcoach/domain/export/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _navigateToNextScreen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(
        const Duration(seconds: 2)); // Wait for the splash duration

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ResponsiveDashBoard()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ResponsiveLogin()),
      );
    }
  }

  // Future<void> navigateScreen(BuildContext context) async {
  //   await Future.delayed(
  //       const Duration(seconds: 2)); // Wait for the splash duration

  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const ResponsiveDashBoard()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextScreen(context);
      // navigateScreen(context);
    });

    return Scaffold(
      backgroundColor: AppColors.accentColor1,
      body: Center(
        child: Image.asset(
          "assets/splashicon.png",
          scale: 1.5,
        ),
      ),
    );
  }
}
