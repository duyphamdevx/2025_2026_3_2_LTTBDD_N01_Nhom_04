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