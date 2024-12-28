import 'package:flutter/material.dart';
import 'package:formulaire/utils/colors.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          
          backgroundColor: AppColors.gray200,
          title: const Text("Creation de visite",
          style: TextStyle(
            fontSize: 25,
          ),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.supervised_user_circle))
        
          ],
        
        ),
      ),
      body: const Center(
        child: Text("Bienvenue sur le deuxième écran !"),
      ),
    );
  }
}
