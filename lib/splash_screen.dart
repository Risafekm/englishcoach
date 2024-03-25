import 'package:englishcoach/domain/export/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const ResponsiveLogin(),
      backgroundColor: AppColors.accentColor1,
      splashIconSize: 400,
      duration: 2000,
      animationDuration: const Duration(seconds: 2),
      splash: Image.asset(
        "splashicon.png",
        scale: 1.5,
        // fit: BoxFit.cover,
      ),
    );
  }
}
