import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formulaire/utils/colors.dart';
import 'package:formulaire/models/visiteur.dart';
import 'package:formulaire/widgets/customTextFormField.dart';
import 'package:formulaire/models/visite.dart';
import 'package:formulaire/services/visite_api.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Visiteur> membreVisiteur = [];
  String? _typeVisiteur;
  final TextEditingController _dateController1 = TextEditingController();
  final TextEditingController _dateController2 = TextEditingController();
  final TextEditingController _nom = TextEditingController();
  final TextEditingController _prenom = TextEditingController();
  final TextEditingController _entreprise = TextEditingController();
  final TextEditingController _cni = TextEditingController();
  final TextEditingController _immatriculation = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _nomVisiteur = TextEditingController();
  final TextEditingController _prenomVisiteur = TextEditingController();
  final TextEditingController _cniVisiteur = TextEditingController();

  String? _genre = "Monsieur";
  int? _motif = 1;
  bool _enableDate = true;

  // Fonction pour afficher le sélecteur de date
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      controller.text =
          "${selectedDate.toLocal()}".split(' ')[0]; // Format YYYY-MM-DD
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _typeVisiteur = "PERMANENT";
      _genre = "Monsieur";
      _motif = 1;
      _dateController1.clear();
      _dateController2.clear();
      _nom.clear();
      _prenom.clear();
      _entreprise.clear();
      _cni.clear();
      _immatriculation.clear();
      _email.clear();
      _numero.clear();
      membreVisiteur.clear();
    });
  }

  void _resetBottomSheet() {
    setState(() {
      _nomVisiteur.clear();
      _prenomVisiteur.clear();
      _cniVisiteur.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.gray200,
        title: const Text(
          "Création de visite",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Type de visiteur"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: AppColors.gray200,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    value: _typeVisiteur,
                    items: const [
                      DropdownMenuItem(
                          value: null , child: Text("Veillez choisir un type de visiteur")),
                      DropdownMenuItem(
                          value: "PERMANENT", child: Text("Permanent")),
                      DropdownMenuItem(
                          value: "TEMPORAIRE", child: Text("Temporaire"))
                    ],
                    onChanged: (value) {
                      setState(() {
                        _typeVisiteur = value;
                        if(value == "PERMANENT") _enableDate = false;
                        if(value == "TEMPORAIRE") _enableDate = true;
                      });
                    },

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez sélectionner un type de visiteur";
                      }
                      return null;
                    },

                  ),
                ),
                // Sélection des Dates
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildDateField(
                          "Date de début", _dateController1, context),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDateField(
                          "Date de fin", _dateController2, context , isEnabled: _enableDate),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Genre
                const Text("Genre"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...["Monsieur", "Madame", "Mademoiselle"].map((genreValue) {
                        return Row(
                          children: [
                            Text(genreValue),
                            Radio<String>(
                              fillColor: WidgetStateProperty.all(Colors.black),
                              value: genreValue,
                              groupValue: _genre,
                              onChanged: (value) {
                                setState(() {
                                  _genre = value;
                                });
                              },
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
                // Motif
                const Text("Motif"),
                DropdownButtonFormField<int>(
                  value: _motif,
                  items: const [
                    DropdownMenuItem(value: 1, child: Text("Rencontre")),
                    DropdownMenuItem(value: 2, child: Text("Inspection")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _motif = value;
                    });
                  },
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: AppColors.gray200,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                ),

                // Champs texte : Nom, Prénom, etc.
                buildTextField("Nom", _nom, "Nom invalide", false, true,
                    TextInputType.text),
                buildTextField("Prénom", _prenom, "Prénom invalide", false,
                    true, TextInputType.text),
                buildTextField("Entreprise", _entreprise, "Entreprise invalide",
                    false, true, TextInputType.text),
                buildTextField("Numéro de CNI", _cni, "CNI invalide", false,
                    false, TextInputType.text),
                buildTextField(
                    "Immatriculation véhicule",
                    _immatriculation,
                    "Immatriculation invalide",
                    false,
                    false,
                    TextInputType.text),
                buildTextField("Email", _email, "Email invalide", false, true,
                    TextInputType.text),
                buildTextField("Numéro de téléphone", _numero,
                    "Numéro invalide", false, true, TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                const Text("Membres visite"),

                _buildVisitorSection(),

                const SizedBox(height: 50),
                // Boutons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildOutlinedButton("Annuler", _resetForm),
                    _buildElevatedButton("Créer", _submitForm),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widgets pour réduire la duplication

  Widget _buildDateField(
      String label, TextEditingController controller, BuildContext context , {bool isEnabled = true} ) {
    return GestureDetector(

      onTap: isEnabled ? () => _selectDate(context, controller) : null,
      child: AbsorbPointer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            TextFormField(
              enabled: isEnabled,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                  fillColor: isEnabled ? AppColors.gray200 : Colors.grey[300],
                suffixIcon: const Icon(Icons.calendar_today),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (membreVisiteur.isNotEmpty)
          Wrap(
            runSpacing: 12.0,
            spacing: 8.0,
            children: membreVisiteur
                .map((visitor) => Chip(
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Nom",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(visitor.nom),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Prenom",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(visitor.prenom),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Cni",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(visitor.cni ?? "")
                            ],
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gray200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: _showAddVisitorModal,
          child: const Text(
            "Ajouter un visiteur",
            style: TextStyle(color: AppColors.black),
          ),
        ),
      ],
    );
  }

  void _showAddVisitorModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField("Nom", _nomVisiteur, "Nom invalide", false, true,
                  TextInputType.text),
              buildTextField("Prénom", _prenomVisiteur, "Prénom invalide",
                  false, true, TextInputType.text),
              buildTextField("Numéro de CNI", _cniVisiteur, "CNI invalide",
                  false, false, TextInputType.text),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Retour",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        membreVisiteur.add(Visiteur(
                          nom: _nomVisiteur.text,
                          prenom: _prenomVisiteur.text,
                          cni: _cniVisiteur.text,
                        ));
                      });
                      _resetBottomSheet();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Ajouter",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOutlinedButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: 150,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.yellow500),
          foregroundColor: AppColors.yellow500,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontSize: 15)),
      ),
    );
  }

  Widget _buildElevatedButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow500,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(label,
            style: const TextStyle(color: AppColors.white, fontSize: 15)),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      context.loaderOverlay.show();
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Envoi en cours...")),
      );
      Visite visite = Visite(
        _dateController2.text.isNotEmpty
            ? _dateController2.text
            : null, // date_fin
        _entreprise.text,
        _cni.text.isNotEmpty ? _cni.text : null,
        _immatriculation.text.isNotEmpty ? _immatriculation.text : null,
        _email.text,
        _numero.text,
        membreVisiteur,
        _motif!,
        type: _typeVisiteur!,
        date_debut: _dateController1.text,
        genre: _genre!,
        nom: _nom.text,
        prenom: _prenom.text,
      );

      try {
        VisiteApi visiteApi = VisiteApi();
        final reponse = await visiteApi.postVisite(visite);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      if (kDebugMode) {
        print("Détails de la visite : $visite");
      }

      if(mounted){
        context.loaderOverlay.hide();
      }

      _resetForm();
    }
  }
}
