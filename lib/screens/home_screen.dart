import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/task.dart';
import '../state/app_state.dart';
import '../l10n/app_strings.dart';
import '../widgets/language_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPetIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        final pets = appState.pets;
        final tasks = appState.tasks;

        if (pets.isEmpty) {
          return const SafeArea(
            child: Center(
              child: Text('Chưa có thú cưng'),
            ),
          );
        }

        if (_selectedPetIndex >= pets.length) {
          _selectedPetIndex = 0;
        }

        final activePet = pets[_selectedPetIndex];

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                  decoration: const BoxDecoration(
                    gradient: AppColors.headerGradient,
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
                        children: [
                          Expanded(
                            child: Text(
                              t('good_morning').replaceFirst(
                                '{name}',
                                appState.ownerName,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const LanguageBadge(
                            background: Colors.white24,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        t('feed_reminder').replaceFirst(
                          '{pet}',
                          activePet.name,
                        ),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 18),

                SizedBox(
                  height: 108,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: pets.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final pet = pets[index];
                      final selected = index == _selectedPetIndex;

                      final baseColor = AppColors.petPalette[
                        index % AppColors.petPalette.length
                      ];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPetIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          width: 76,
                          decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(24),
                            border: selected
                                ? Border.all(
                                    color: AppColors.primaryOrangeDark,
                                    width: 3,
                                  )
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              pet.emoji,
                              style: const TextStyle(fontSize: 36),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                 const SizedBox(height: 20),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _QuickAction(
                             icon: Icons.pets_rounded,
                              label: t('quick_pet'),onTap: () => appState.goToTab(1),
                               ),
                               _QuickAction(
                                 icon: Icons.calendar_month_rounded,
                                  label: t('quick_calendar'),
                                   onTap: () => appState.goToTab(2),
                                   ),
                                   _QuickAction(
                                    icon: Icons.medical_services_rounded,
                                    label: t('quick_vet'),
                                     onTap: () => appState.goToVetTab(),
                                     ),
                                     _QuickAction(
                                       icon: Icons.badge_rounded,
                                        label: t('quick_profile'),
                                        onTap: () => appState.goToTab(4),
                                        ),
                              ],
                             ),
                            ),
                           const SizedBox(height: 24),
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                               t('today'),style: Theme.of(context).textTheme.titleMedium,
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
class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 52,
            height:52,
            decoration:BoxDecoration(
             color: AppColors.tealLight,
             borderRadius: BorderRadius.circular(16) 
            ),
            child: Icon(
              icon,
              color:AppColors.secondaryTeal,
            ),
          ),
          const SizedBox(height: 6),
          Text(
          label,
          style: const TextStyle(
          fontSize: 11,
          color: AppColors.textDark,
          ),
        ),
         const SizedBox(height: 6),

           Text(
            label,
            style: const TextStyle(
            fontSize: 11,
             color: AppColors.textDark,
        ),
       ),
      ],    
    ),
  );
 }
}
class _TaskTile extends StatelessWidget {
  final PetTask task;
  final VoidCallback onToggle;

  const _TaskTile({
    required this.task,
    required this.onToggle,
  });

  @override
 Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(14),
    decoration: AppTheme.cardDecoration(),
    child: Row(
      children: [GestureDetector(
      onTap: onToggle,
      child: Icon(
        task.isDone
            ? Icons.check_circle_rounded
            : Icons.radio_button_unchecked_rounded,
        color: task.isDone
            ? AppColors.success
            : AppColors.textGrey,
        size: 26,
      ),
    ),
    const SizedBox(width: 12),
    Container( width: 36, height: 36, decoration: BoxDecoration(
    color: AppColors.pinkLight,
    borderRadius: BorderRadius.circular(10),
    ),child: Center(
    child: Text(task.emoji),
    ),
    ),
   ],
  ),
);
}