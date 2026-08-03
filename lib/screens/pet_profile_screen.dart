import 'package:flutter/material.dart';

import '../l10n/app_strings.dart';
import '../models/pet.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_sheet.dart';
import '../widgets/language_badge.dart';

class PetProfileScreen extends StatefulWidget {
  const PetProfileScreen({super.key});

  @override
  State<PetProfileScreen> createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  Pet? _selectedPet;
  int _tabIndex = 2;

  void _openPetForm({Pet? existing}) {
    final nameController = TextEditingController(
      text: existing?.name ?? '',
    );

    final speciesController = TextEditingController(
      text: existing?.species ?? '',
    );

    final ageController = TextEditingController(
      text: existing != null ? existing.age.toString() : '',
    );

    final waterController = TextEditingController(
      text: existing?.waterInfo ?? '',
    );

    final foodController = TextEditingController(
      text: existing?.foodInfo ?? '',
    );

    final allergyController = TextEditingController(
      text: existing?.allergyInfo ?? '',
    );

    String gender = existing?.gender ?? 'female';
    String? errorText;

    showAppBottomSheet(
      context: context,
      title: existing == null ? t('add_pet_title') : t('edit_pet_title'),
      child: StatefulBuilder(
        builder: (context, setSheetState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t('pet_name'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: t('pet_name_hint'),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                t('species'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: speciesController,
                decoration: InputDecoration(
                  hintText: t('species_hint'),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                t('age'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: t('age_hint'),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                t('gender'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SelectableChip(
                    label: t('female'),
                    selected: gender == 'female',
                    onTap: () {
                      setSheetState(() {
                        gender = 'female';
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  SelectableChip(
                    label: t('male'),
                    selected: gender == 'male',
                    onTap: () {
                      setSheetState(() {
                        gender = 'male';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                t('water'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: waterController,
                decoration: InputDecoration(
                  hintText: t('water_hint'),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                t('diet'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: foodController,
                decoration: InputDecoration(
                  hintText: t('diet_hint'),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                t('allergy'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: allergyController,
                decoration: InputDecoration(
                  hintText: t('allergy_hint'),
                ),
              ),
              if (errorText != null) ...[
                const SizedBox(height: 10),
                Text(
                  errorText!,
                  style: const TextStyle(
                    color: AppColors.allergyRed,
                    fontSize: 12,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim().isEmpty) {
                      setSheetState(() {
                        errorText = t('pet_name_required');
                      });
                      return;
                    }

                    final name = nameController.text.trim();

                    final species = speciesController.text.trim().isEmpty
                        ? 'Chưa rõ loài'
                        : speciesController.text.trim();

                    final age = int.tryParse(
                          ageController.text.trim(),
                        ) ??
                        1;

                    if (existing == null) {
                      appState.addPet(
                        Pet(
                          id: '${name.toLowerCase()}_'
                              '${DateTime.now().microsecondsSinceEpoch}',
                          name: name,
                          species: species,
                          age: age,
                          gender: gender,
                          emoji: AppState.emojiForSpecies(species),
                          waterInfo: waterController.text.trim().isEmpty
                              ? 'Chưa cập nhật thông tin nước uống.'
                              : waterController.text.trim(),
                          foodInfo: foodController.text.trim().isEmpty
                              ? 'Chưa cập nhật khẩu phần ăn.'
                              : foodController.text.trim(),
                          allergyInfo: allergyController.text.trim().isEmpty
                              ? 'Chưa ghi nhận dị ứng.'
                              : allergyController.text.trim(),
                        ),
                      );
                    } else {
                      existing.name = name;
                      existing.species = species;
                      existing.age = age;
                      existing.gender = gender;
                      existing.emoji = AppState.emojiForSpecies(species);

                      existing.waterInfo =
                          waterController.text.trim().isEmpty
                              ? existing.waterInfo
                              : waterController.text.trim();

                      existing.foodInfo = foodController.text.trim().isEmpty
                          ? existing.foodInfo
                          : foodController.text.trim();

                      existing.allergyInfo =
                          allergyController.text.trim().isEmpty
                              ? existing.allergyInfo
                              : allergyController.text.trim();

                      appState.notifyPetsChanged();

                      setState(() {});

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            t('pet_updated_snack').replaceFirst(
                              '{pet}',
                              name,
                            ),
                          ),
                        ),
                      );
                    }

                    Navigator.of(context).pop();
                  },
                  child: Text(
                    existing == null ? t('add_pet_button') : t('save'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _confirmDeletePet(Pet pet) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(t('delete_pet_title')),
        content: Text(
          t('delete_pet_confirm').replaceFirst(
            '{pet}',
            pet.name,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              t('no'),
              style: const TextStyle(
                color: AppColors.textGrey,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.allergyRed,
            ),
            onPressed: () {
              Navigator.of(context).pop();

              appState.removePet(pet);

              setState(() {
                _selectedPet = null;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    t('pet_deleted_snack').replaceFirst(
                      '{pet}',
                      pet.name,
                    ),
                  ),
                ),
              );
            },
            child: Text(t('yes')),
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
        final pets = appState.pets;

        if (_selectedPet != null && !pets.contains(_selectedPet)) {
          _selectedPet = null;
        }

        return SafeArea(
          child: _selectedPet == null
              ? _buildList(context, pets)
              : _buildDetail(context, _selectedPet!),
        );
      },
    );
  }

  Widget _buildList(
    BuildContext context,
    List<Pet> pets,
  ) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
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

                  final genderLabel =
                      pet.gender == 'female' ? t('female') : t('male');

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPet = pet;
                        _tabIndex = 2;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
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
                                style: const TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  '${pet.species} · ${pet.age} '
                                  '${t('years_old')} · $genderLabel',
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
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            heroTag: 'add_pet_fab',
            backgroundColor: AppColors.primaryOrangeDark,
            onPressed: () {
              _openPetForm();
            },
            child: const Icon(
              Icons.add_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetail(
    BuildContext context,
    Pet pet,
  ) {
    final tabs = [
      t('water'),
      t('diet'),
      t('allergy'),
    ];

    final genderLabel =
        pet.gender == 'female' ? t('female') : t('male');

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPet = null;
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.textDark,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      t('back_to_list'),
                      style: const TextStyle(
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              const LanguageBadge(),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                gradient: AppColors.avatarGradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  pet.emoji,
                  style: const TextStyle(
                    fontSize: 52,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              pet.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              '${pet.species} · ${pet.age} '
              '${t('years_old')} · $genderLabel',
              style: const TextStyle(
                color: AppColors.textGrey,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    _openPetForm(existing: pet);
                  },
                  icon: const Icon(
                    Icons.edit_rounded,
                    size: 18,
                  ),
                  label: Text(t('edit')),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.secondaryTeal,
                    side: const BorderSide(
                      color: AppColors.secondaryTeal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    _confirmDeletePet(pet);
                  },
                  icon: const Icon(
                    Icons.delete_rounded,
                    size: 18,
                  ),
                  label: Text(t('delete')),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.allergyRed,
                    side: const BorderSide(
                      color: AppColors.allergyRed,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: List.generate(
              tabs.length,
              (index) {
                final selected = index == _tabIndex;

                final colors = [
                  AppColors.pinkLight,
                  AppColors.tealLight,
                  AppColors.allergyRedBg,
                ];

                final selectedTextColors = [
                  AppColors.primaryOrangeDark,
                  AppColors.secondaryTeal,
                  AppColors.allergyRed,
                ];

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _tabIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: index != tabs.length - 1 ? 8 : 0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? colors[index]
                            : const Color(0xFFF3EFEA),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        tabs[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? selectedTextColors[index]
                              : AppColors.textGrey,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildTabContent(pet),
          const SizedBox(height: 24),
          Text(
            t('other_needs'),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _NeedCard(
                  icon: Icons.shower_rounded,
                  label: t('bathing'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _NeedCard(
                  icon: Icons.vaccines_rounded,
                  label: t('vaccination'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(Pet pet) {
    late final IconData icon;
    late final String title;
    late final String content;
    late final Color backgroundColor;
    late final Color foregroundColor;

    switch (_tabIndex) {
      case 0:
        icon = Icons.water_drop_rounded;
        title = t('water');
        content = pet.waterInfo;
        backgroundColor = AppColors.pinkLight;
        foregroundColor = AppColors.primaryOrangeDark;
        break;

      case 1:
        icon = Icons.restaurant_rounded;
        title = t('diet');
        content = pet.foodInfo;
        backgroundColor = AppColors.tealLight;
        foregroundColor = AppColors.secondaryTeal;
        break;

      default:
        icon = Icons.warning_amber_rounded;
        title = t('allergy');
        content = pet.allergyInfo;
        backgroundColor = AppColors.allergyRedBg;
        foregroundColor = AppColors.allergyRed;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: foregroundColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: foregroundColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _NeedCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _NeedCard({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      decoration: AppTheme.cardDecoration(
        radius: 16,
      ),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.tealLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: AppColors.secondaryTeal,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}