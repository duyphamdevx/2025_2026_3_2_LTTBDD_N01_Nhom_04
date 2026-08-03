import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../l10n/app_strings.dart';
import '../models/pet.dart';
import '../state/app_state.dart';
import '../widgets/language_badge.dart';

class PetProfileScreen extends StatefulWidget {
  const PetProfileScreen({super.key});

  @override
  State<PetProfileScreen> createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  Pet? _selectedPet;
  int _tabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        final pets = appState.pets;

        return SafeArea(
          child: _selectedPet == null
              ? SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            t('pet_management_title'),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const LanguageBadge(),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t('pet_list_subtitle'),
                        style: const TextStyle(
                          color: AppColors.textGrey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (pets.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Center(
                            child: Text(
                              t('no_pets'),
                              style: const TextStyle(
                                color: AppColors.textGrey,
                              ),
                            ),
                          ),
                        )
                      else
                        ...pets.asMap().entries.map((entry) {
                          final index = entry.key;
                          final pet = entry.value;
                          final baseColor = AppColors.petPalette[
                              index % AppColors.petPalette.length];
                          final genderLabel = pet.gender == 'female'
                              ? t('female')
                              : t('male');

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedPet = pet;
                                _tabIndex = 2;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(14),
                              decoration: AppTheme.cardDecoration(),
                              child: Row(
                                children: [
                                  Container(
                                    width: 54,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: baseColor,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Center(
                                      child: Text(
                                        pet.emoji,
                                        style: const TextStyle(fontSize: 28),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pet.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${pet.species} · ${pet.age} ${t('years_old')} · $genderLabel',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.textGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    color: AppColors.textGrey,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    _selectedPet!.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
        );
      },
    );
  }
} 