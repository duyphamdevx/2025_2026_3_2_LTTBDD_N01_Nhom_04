import 'package:flutter/material.dart';

import '../models/pet.dart';

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
    return const SafeArea(
      child: Center(
        child: Text('Hồ sơ thú cưng'),
      ),
    );
  }
}