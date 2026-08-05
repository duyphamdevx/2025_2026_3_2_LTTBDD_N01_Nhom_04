import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../l10n/app_strings.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_sheet.dart';
import '../widgets/language_badge.dart';
import 'login_screen.dart';
import 'team_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsOn = true;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAvatar() async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1200,
      );

      if (file == null) return;

      appState.updateOwnerAvatarPath(file.path);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t('avatar_pick_failed'))),
      );
    }
  }

  void _openEditProfileSheet() {
    final nameController = TextEditingController(
      text: appState.ownerName,
    );

    showAppBottomSheet(
      context: context,
      title: t('edit_profile'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t('your_name'),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: t('display_name_hint'),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                appState.updateOwnerName(nameController.text);
                Navigator.of(context).pop();
              },
              child: Text(t('save')),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutSheet() {
    showAppBottomSheet(
      context: context,
      title: t('about_app'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PawCare',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t('about_app_desc'),
            style: const TextStyle(
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            t('version_label'),
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  decoration: const BoxDecoration(
                    gradient: AppColors.tealHeaderGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox.shrink(),
                          LanguageBadge(
                            background: Colors.white24,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _pickAvatar,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white24,
                              backgroundImage: appState.ownerAvatarPath != null
                                  ? FileImage(File(appState.ownerAvatarPath!))
                                  : null,
                              child: appState.ownerAvatarPath == null
                                  ? const Icon(Icons.person, color: Colors.white, size: 30)
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appState.ownerName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  t('owner_label').replaceFirst(
                                    '{pets}',
                                    appState.petNamesLabel,
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  t('change_avatar'),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _MenuTile(
                        icon: Icons.edit_rounded,
                        iconColor: AppColors.primaryOrangeDark,
                        iconBg: AppColors.pinkLight,
                        label: t('edit_profile'),
                        showChevron: true,
                        onTap: _openEditProfileSheet,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          t('settings'),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _MenuTile(
                        icon: Icons.language_rounded,
                        iconColor: AppColors.secondaryTeal,
                        iconBg: AppColors.tealLight,
                        label: t('language'),
                        trailingText: appState.language.toUpperCase(),
                        showChevron: true,
                        onTap: () => openLanguagePicker(context),
                      ),
                      const SizedBox(height: 12),
                      _MenuTile(
                        icon: Icons.notifications_rounded,
                        iconColor: Colors.amber,
                        iconBg: Colors.amber.shade100,
                        label: t('notifications'),
                        trailing: Switch(
                          value: _notificationsOn,
                          activeThumbColor: AppColors.secondaryTeal,
                          onChanged: (value) {
                            setState(() {
                              _notificationsOn = value;
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {
                            _notificationsOn = !_notificationsOn;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      _MenuTile(
                        icon: Icons.info_rounded,
                        iconColor: Colors.blue,
                        iconBg: Colors.blue.shade50,
                        label: t('about_app'),
                        showChevron: true,
                        onTap: _showAboutSheet,
                      ),
                      const SizedBox(height: 12),
                      _MenuTile(
                        icon: Icons.groups_rounded,
                        iconColor: Colors.purple,
                        iconBg: Colors.purple.shade50,
                        label: t('team_info'),
                        showChevron: true,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const TeamInfoScreen(
                                showStartButton: false,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _MenuTile(
                        icon: Icons.logout_rounded,
                        iconColor: AppColors.primaryOrangeDark,
                        iconBg: AppColors.pinkLight,
                        label: t('logout'),
                        labelColor: AppColors.primaryOrangeDark,
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String label;
  final Color? labelColor;
  final String? trailingText;
  final Widget? trailing;
  final bool showChevron;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.label,
    required this.onTap,
    this.labelColor,
    this.trailingText,
    this.trailing,
    this.showChevron = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: AppTheme.cardDecoration(radius: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: labelColor ?? AppColors.textDark,
                ),
              ),
            ),
            if (trailingText != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.pinkLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  trailingText!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryOrangeDark,
                  ),
                ),
              ),
            if (trailing != null) trailing!,
            if (showChevron) ...[
              const SizedBox(width: 4),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textGrey,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
