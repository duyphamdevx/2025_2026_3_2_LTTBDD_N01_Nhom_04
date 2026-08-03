import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../state/app_state.dart';
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

        
      },
    );
  }
}
