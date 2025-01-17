import 'visiteur.dart';

class Visite {
  final String type;
  final String date_debut;
  final String? date_fin;
  final String genre;
  final int motif_id;
  final String nom;
  final String prenom;
  final String entreprise;
  final String? Numero_cni;
  final String? plaque_vehicule;
  final String email;
  final String number;
  final List<Visiteur> membre_visites ;

  Visite( this.date_fin, this.entreprise, this.Numero_cni, this.plaque_vehicule, this.email, this.number, this.membre_visites, this.motif_id, {required this.type , required this.date_debut, required this.genre , required this.nom, required  this.prenom, });

  @override
  String toString() {
    return '''
    Type: $type
    Date début: $date_debut
    Date fin: ${date_fin ?? 'Non spécifiée'}
    Genre: $genre
    Motif ID: $motif_id
    Nom: $nom
    Prénom: $prenom
    Entreprise: $entreprise
    Numéro de CNI: ${Numero_cni ?? 'Non spécifiée'}
    Plaque véhicule: ${plaque_vehicule ?? 'Non spécifiée'}
    Email: $email
    Numéro de téléphone: $number
    Membres de la visite: ${membre_visites.map((e) => e.toString()).join(', ')}
  ''';
  }

  Map<String,dynamic> toJson() {
    return {
      "type": type,
      "date_debut": date_debut,
      "date_fin": date_fin,
      "genre":genre,
      "motif_id": motif_id,
      "nom":nom,
      "prenom":prenom,
      "enteprise":entreprise,
      "Numero_cni": Numero_cni,
      "plaque_vehicule": plaque_vehicule,
      "email" :email,
      "number": number,
      "membre_visites": membre_visites.map((e) => e.tojson()).toList()

    };
  }


}