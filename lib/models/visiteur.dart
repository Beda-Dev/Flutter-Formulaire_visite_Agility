class Visiteur {
  final String nom;
  final String prenom;
  final String? cni;

  Visiteur({required this.nom, required this.prenom, this.cni});

  @override
  String toString() {
    return 'Nom: $nom, Prénom: $prenom, CNI: ${cni ?? "Non spécifiée"}';
  }
}
