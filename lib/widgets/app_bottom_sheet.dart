import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Hiển thị 1 bottom sheet với style thống nhất (bo góc, thanh kéo, tiêu đề)
/// dùng cho các form: thêm việc cần làm, thêm thú cưng, chỉnh sửa hồ sơ...
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required String title,
  required Widget child,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                child,
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// Ô chọn (chip) dùng trong các form, ví dụ chọn giới tính hoặc emoji.
class SelectableChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const SelectableChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryOrangeDark : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.primaryOrangeDark : Colors.black12,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
