import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/presentation/login/widget/button/FormField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomProvider extends StatefulWidget {
  const CustomProvider({super.key});

  @override
  State<CustomProvider> createState() => _CustomProviderState();
}

class _CustomProviderState extends State<CustomProvider> {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<UserproviderPassword>(
      create: (_) => UserproviderPassword(),
      builder: (context, child) {
        return LoginForm();
      },
    );
  }
}
