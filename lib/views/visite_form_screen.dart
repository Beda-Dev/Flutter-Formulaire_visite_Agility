import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';  // Pour utiliser TextInputFormatter
import 'package:formulaire/utils/colors.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _typeVisiteur = "PERMANENT";
  final TextEditingController _dateController1 = TextEditingController();
  final TextEditingController _dateController2 = TextEditingController();
  String? _genre = "Monsieur";
  int? _motif = 0;


  // Fonction pour afficher le sélecteur de date
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ) ?? DateTime.now();

    controller.text = "${selectedDate.toLocal()}".split(' ')[0];  // Format simple YYYY-MM-DD
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.gray200,
        title: const Text(
          "Creation de visite",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.supervised_user_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding pour espacement sur toute la page
        child: Form(
          key: _formKey,  // Utilisation du Form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Type de visiteur",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: "PERMANENT", child: Text("Permanent")),
                    DropdownMenuItem(value: "TEMPORAIRE", child: Text("Temporaire"))
                  ],
                  onChanged: (value) {
                    setState(() {
                      _typeVisiteur = value!;
                    });
                  },
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dateController1,
                      decoration: const InputDecoration(
                        labelText: "Date de début",
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () => _selectDate(context, _dateController1),
                    ),
                  ),
                  const SizedBox(width: 16),


                  Expanded(
                    child: TextField(
                      controller: _dateController2,
                      decoration: const InputDecoration(
                        labelText: "Date de fin",
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () => _selectDate(context, _dateController2),
                    ),
                  ),
                ],
              ),
              const Text("genre"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Monsieur"),
                  Radio(value: "Monsieur", groupValue: _genre, onChanged:(value){
                    setState(() {
                      _genre = value;
                    });
                  }),
                  const Text("Madame"),
                  Radio(value: "Madame", groupValue: _genre, onChanged:(value){
                    setState(() {
                      _genre = value;
                    });
                  }),
                  const Text("Mademoiselle"),
                  Radio(value: "Mademoiselle", groupValue: _genre, onChanged:(value){
                    setState(() {
                      _genre = value;
                    });
                  })

                ],
              ),
              const Text("Motif"),
              DropdownButtonFormField(items:const [
                DropdownMenuItem( value: 1 , child: Text("Rencontre")),
                DropdownMenuItem( value: 2 , child: Text("Inspection")),
              ], onChanged:(value){
                _motif = value;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder()
              ))
            ],
          ),
        ),
=======
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
>>>>>>> e50dfe57caeb4a44e5bfb9c18a734bacb22555fa
      ),
    );
  }
}
