import 'package:flutter/material.dart';

import '../models/pet.dart';
import '../state/app_state.dart';

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
          child: Center(
            child: Text(
              'Có ${pets.length} thú cưng',
            ),
          ),
        );
      },
    );
  }
}