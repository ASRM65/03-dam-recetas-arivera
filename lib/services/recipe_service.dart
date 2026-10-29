import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/receta.dart';

class RecipeService {
  static const String _baseUrl = 'https://dummyjson.com/recipes';

  static Future<List<Receta>> getRecetas() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List recipesJson = data['recipes'];
      return recipesJson.map((json) => Receta.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar las recetas');
    }
  }
}