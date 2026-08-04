import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../widgets/language_badge.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  String? _errorText;

  bool _isValidEmail(String value) {
    return RegExp(r'^[\w\.\-]+@[\w\-]+\.[\w\-\.]+$').hasMatch(value);
  }

  void _register() {
    // Kiểm tra hợp lệ thông tin đã nhập.
    if (_nameController.text.trim().isEmpty) {
      setState(() => _errorText = t('name_required'));
      return;
    }
    if (_emailController.text.trim().isEmpty) {
      setState(() => _errorText = t('email_required'));
      return;
    }
    if (!_isValidEmail(_emailController.text.trim())) {
      setState(() => _errorText = t('email_invalid'));
      return;
    }
    if (_passwordController.text.length < 6) {
      setState(() => _errorText = t('password_too_short'));
      return;
    }
    if (_passwordController.text != _confirmController.text) {
      setState(() => _errorText = t('password_mismatch'));
      return;
    }
    setState(() => _errorText = null);


    appState.updateOwnerName(_nameController.text.trim());


    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: AppColors.success),
            const SizedBox(width: 10),
            Expanded(child: Text(t('register_success_title'))),
          ],
        ),
        content: Text(t('register_success_desc')),

