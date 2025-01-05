import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:formulaire/models/visite.dart';

class VisiteApi {
  final String apiUrl = "https://sibeton-api.vercel.app/api/users/auth";

  Future<Map<String, dynamic>> postVisite(Visite visit) async {

    final url = Uri.parse(apiUrl);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(visit.toJson()),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Echec envoie des données: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur: $e');
    }

  }
}
