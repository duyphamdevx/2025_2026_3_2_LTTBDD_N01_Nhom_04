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
    if (!_isValidEmail(email)) {
      setState(() => _errorText = t('email_invalid'));
      return;
    }
    setState(() => _errorText = null);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.mark_email_read_rounded, color: AppColors.success),
            const SizedBox(width: 10),
            Expanded(child: Text(t('reset_email_sent_title'))),
          ],
        ),
        content: Text(
          t('reset_email_sent_desc').replaceFirst('{email}', email),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // đóng dialog
              Navigator.of(context).pop(); // quay lại màn hình đăng nhập
            },
            child: Text(t('back_to_login')),
          ),
        ],
      ),
    );
  }
@override
  void dispose() {
    _emailController.dispose();
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
            child: Column(
               children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 8, 20, 0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const Spacer(),
                      const LanguageBadge(),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: AppColors.headerGradient,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const Icon(Icons.lock_reset_rounded,
                                color: Colors.white, size: 40),
                          ),

