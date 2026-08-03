import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../widgets/language_badge.dart';
import 'login_screen.dart';

/// Dữ liệu 1 thành viên trong nhóm - sửa trực tiếp ở đây nếu muốn đổi
/// tên/MSSV/vai trò thật của nhóm bạn.
class _TeamMember {
  final String name;
  final String studentId;
  final String role;
  const _TeamMember({required this.name, required this.studentId, required this.role});
}

const _instructor = 'ThS. Nguyễn Xuân Quế';
const _githubUrl = 'https://github.com/duyphamdevx/2025_2026_3_2_LTTBDD_N01_Nhom_04';

const List<_TeamMember> _members = [
  _TeamMember(name: 'Phạm Thế Duy', studentId: '24100583', role: ''),
  _TeamMember(name: 'Phạm Thảo Hiền Vy', studentId: '24100439', role: ''),
  _TeamMember(name: 'Nguyễn Hoàng Nam', studentId: '24100136', role: ''),
];

/// Trang giới thiệu nhóm thực hiện đồ án - hiển thị đầu tiên khi mở app,
/// bấm "Bắt đầu" để vào màn hình đăng nhập. Cũng có thể mở lại từ tab
/// Cá nhân > "Nhóm thực hiện".
class TeamInfoScreen extends StatelessWidget {
  final bool showStartButton;
  const TeamInfoScreen({super.key, this.showStartButton = true});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (!showStartButton)
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                      Expanded(
                        child: Text(
                          t('team_header'),
                          style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
                        ),
                      ),
                      const LanguageBadge(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(t('team_info_title'), style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  // Giảng viên hướng dẫn
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: AppTheme.cardDecoration(),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.creamLight,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.school_rounded, color: AppColors.primaryOrangeDark),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t('instructor'),
                                  style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                              const SizedBox(height: 2),
                              const Text(_instructor,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Danh sách thành viên
                  ..._members.map((m) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: AppTheme.cardDecoration(),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.tealLight,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(Icons.person_rounded, color: AppColors.secondaryTeal),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(m.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 2),
                                  Text('${t('student_id')}: ${m.studentId}',
                                      style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                                  const SizedBox(height: 2),
                                  Text(m.role,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.secondaryTeal)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: AppTheme.cardDecoration(radius: 14),
                    child: Row(
                      children: [
                        const Icon(Icons.link_rounded, color: AppColors.textGrey, size: 18),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _githubUrl,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12, color: AppColors.textGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showStartButton) ...[
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_rounded),
                        label: Text(t('start')),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
