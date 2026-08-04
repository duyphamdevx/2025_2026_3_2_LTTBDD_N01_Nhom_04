import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/language_badge.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _login() {
    // Demo: chỉ cần bấm là vào thẳng app, không gọi API thật.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const PawCareScaffold()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                    child: const LanguageBadge(),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 40),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            gradient: AppColors.headerGradient,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.pets_rounded,
                              color: Colors.white, size: 44),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          t('login_title'),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          t('login_subtitle'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.textGrey),
                        ),
                        const SizedBox(height: 32),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(t('email'),
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(hintText: 'ban@email.com'),
                        ),
                        const SizedBox(height: 18),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(t('password'),
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: '••••••••',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: AppColors.textGrey,
                              ),
                              onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const ForgotPasswordScreen()),
                              );
                            },
                            child: Text(
                              t('forgot_password'),
                              style: const TextStyle(
                                color: AppColors.primaryOrangeDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),