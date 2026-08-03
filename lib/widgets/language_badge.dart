import 'package:flutter/material.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import 'app_bottom_sheet.dart';

/// Badge hiển thị ngôn ngữ hiện tại (VI/EN), bấm vào để đổi ngôn ngữ.
/// Xuất hiện ở góc trên hầu hết các màn hình.
class LanguageBadge extends StatelessWidget {
  final Color background;
  final Color textColor;
  const LanguageBadge({
    super.key,
    this.background = Colors.white,
    this.textColor = const Color(0xFFFF7043),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openLanguagePicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language_rounded, size: 14, color: textColor),
            const SizedBox(width: 4),
            Text(
              appState.language.toUpperCase(),
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Mở bottom sheet cho phép chọn Tiếng Việt / English, dùng chung từ
/// LanguageBadge và mục "Ngôn ngữ" trong Cá nhân.
void openLanguagePicker(BuildContext context) {
  showAppBottomSheet(
    context: context,
    title: t('choose_language'),
    child: Column(
      children: [
        _LanguageOption(
          flag: '🇻🇳',
          label: t('vietnamese'),
          code: 'vi',
        ),
        const SizedBox(height: 10),
        _LanguageOption(
          flag: '🇬🇧',
          label: t('english'),
          code: 'en',
        ),
      ],
    ),
  );
}

class _LanguageOption extends StatelessWidget {
  final String flag;
  final String label;
  final String code;
  const _LanguageOption({required this.flag, required this.label, required this.code});

  @override
  Widget build(BuildContext context) {
    final selected = appState.language == code;
    return GestureDetector(
      onTap: () {
        appState.setLanguage(code);
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFE1DE) : const Color(0xFFF6F1EC),
          borderRadius: BorderRadius.circular(14),
          border: selected ? Border.all(color: const Color(0xFFFF7043), width: 1.5) : null,
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600))),
            if (selected) const Icon(Icons.check_circle_rounded, color: Color(0xFFFF7043)),
          ],
        ),
      ),
    );
  }
}
