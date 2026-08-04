import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../widgets/language_badge.dart';

/// Màn hình "Quên mật khẩu":
/// Nhập email -> Gửi email khôi phục -> Thông báo thành công -> Quay lại
/// màn hình đăng nhập.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  String? _errorText;
   bool _isValidEmail(String value) {
    return RegExp(r'^[\w\.\-]+@[\w\-]+\.[\w\-\.]+$').hasMatch(value);
  }
  void _sendRecoveryEmail() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() => _errorText = t('email_required'));
      return;
    }

