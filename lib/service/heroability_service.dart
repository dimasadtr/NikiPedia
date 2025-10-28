import 'dart:convert';
import 'package:http/http.dart' as http;

class HeroAbilityService {
  static Future<List<Map<String, dynamic>>> fetchHeroSkills(String heroName) async {
    try {
      final response = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/odota/dotaconstants/master/build/abilities.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        final cleanName = heroName
            .toLowerCase()
            .replaceAll("npc_dota_hero_", "")
            .replaceAll(" ", "_");

        final skills = data.entries
            .where((entry) => entry.key.contains(cleanName))
            .map((entry) => Map<String, dynamic>.from(entry.value))
            .toList();

        return skills;
      } else {
        throw Exception("Failed to load hero skills");
      }
    } catch (e) {
      throw Exception("Error fetching abilities: $e");
    }
  }
}
