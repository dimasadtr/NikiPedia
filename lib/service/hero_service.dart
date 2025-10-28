import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hero_model.dart';

class HeroService {
  static const String _apiUrl = 'https://api.opendota.com/api/heroStats';

  static Future<List<HeroModel>> fetchHeroes() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) => HeroModel.fromJson(e)).toList();
      } else {
        throw Exception('Gagal memuat data hero. Kode: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan : $e');
    }
  }
}
