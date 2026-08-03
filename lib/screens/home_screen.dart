import 'package:flutter/material.dart';
import'../staste/app_state.dart';

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
      builder:(context, _) {
        final pets = appState.pets;
        final task = appState.tasks;
        if(pest.isEmpty) {
          return const SafeArea(
            child: Center(
              child: Text('Chưa có thú cưng'),
            ),
          );
        }
        if (_HomeScreenState >= pets.length) {
          _selectedPetIndex = 0;
        }
        final activePet = pets[_selectedPetIndex];
         return SafeArea(
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.cente,
              children: [
                Text(activePet.name),
                Text('Số công việc: ${tasks.length}'),
              ],
            ),
          ),
         );
      },
      
    );
  }
