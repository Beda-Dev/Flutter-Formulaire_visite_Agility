import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'utils/colors.dart';
import '/services/auth_service.dart';
import '/views/visite_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Loginform()),
      ),
    );
  }
}

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => LoginFormState();
}

class LoginFormState extends State<Loginform> {
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  // Fonction pour effectuer la connexion
  Future<void> _login() async {
    final email = emailController.text;
    final password = passwordController.text;
    final user = User(email: email, password: password);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );

    try {
      if (kDebugMode) {
        print({user.email, user.password});
      }
      final response = await _authService.login(user);
      if (kDebugMode) {
        print("connection reussi : $response");
      }
      if(mounted){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()),
        );
      }

    } catch (e) {
      if (kDebugMode) {
        print("connection echouer : $e");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 70,
                child: Image.asset(
                  "assets/images/agility-logo-1.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Connexion",
                  style: TextStyle(
                      color: AppColors.yellow500,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Email",
                style: TextStyle(color: AppColors.gray500),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  prefixIcon: Icon(Icons.mail_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Donnée invalide";
                  }
                  return null;
                },
                controller: emailController,
              ),
              const SizedBox(height: 25),
              const Text(
                "Mot de passe",
                style: TextStyle(
                  color: AppColors.gray500,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  prefixIcon: Transform.rotate(
                    angle: 8.5, // Rotation en radians (vers le bas à gauche)
                    child: const Icon(
                      Icons.key_outlined,
                      size: 24.0,
                      color: AppColors.gray600,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Donnée invalide";
                  }
                  return null;
                },
                controller: passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Aligner à droite
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Oublié ?",
                      style: TextStyle(
                          color: AppColors
                              .gray500), // Personnaliser la couleur du texte
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envoie en cours...")));
                      _login();
                    }
                  },
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
