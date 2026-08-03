import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../screens/home_screen.dart';
import '../screens/pet_profile_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/services_screen.dart';
import '../screens/profile_screen.dart';

/// Thanh điều hướng dưới cùng dùng chung cho toàn app, tương ứng 5 tab:
/// Trang chủ, Thú cưng, Lịch, Dịch vụ, Cá nhân.
class PawCareScaffold extends StatelessWidget {
  const PawCareScaffold({super.key});

  static const List<Widget> _screens = [
    HomeScreen(),
    PetProfileScreen(),
    CalendarScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];

  static const List<IconData> _icons = [
    Icons.home_rounded,
    Icons.pets_rounded,
    Icons.calendar_month_rounded,
    Icons.medical_services_rounded,
    Icons.person_rounded,
  ];

  static const List<String> _labelKeys = [
    'nav_home',
    'nav_pet',
    'nav_calendar',
    'nav_service',
    'nav_profile',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return ValueListenableBuilder<int>(
          valueListenable: appState.navIndex,
          builder: (context, currentIndex, _) {
            return Scaffold(
              body: IndexedStack(index: currentIndex, children: _screens),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(_icons.length, (index) {
                        final selected = index == currentIndex;
                        return GestureDetector(
                          onTap: () => appState.goToTab(index),
                          behavior: HitTestBehavior.opaque,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _icons[index],
                                color: selected
                                    ? AppColors.primaryOrangeDark
                                    : AppColors.textGrey,
                                size: 24,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                t(_labelKeys[index]),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: selected
                                      ? AppColors.primaryOrangeDark
                                      : AppColors.textGrey,
                                  fontWeight:
                                      selected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
