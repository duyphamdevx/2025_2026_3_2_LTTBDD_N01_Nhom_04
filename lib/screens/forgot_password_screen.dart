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
                          const SizedBox(height: 18),
                          Text(
                            t('forgot_password_title'),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            t('forgot_password_subtitle'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColors.textGrey),
                          ),
                          const SizedBox(height: 28),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(t('email'),
                                style: Theme.of(context).textTheme.titleMedium),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                                const InputDecoration(hintText: 'ban@email.com'),
                          ),
                          if (_errorText != null) ...[
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _errorText!,
                                style: const TextStyle(
                                    color: AppColors.allergyRed, fontSize: 12),
                              ),
                            ),
                          ],

