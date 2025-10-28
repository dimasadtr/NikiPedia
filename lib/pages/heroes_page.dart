import 'package:flutter/material.dart';
import '../models/hero_model.dart';
import '../models/gradient_background.dart';
import '../service/hero_service.dart';
import 'hero_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';


class HeroesPage extends StatefulWidget {
  const HeroesPage({super.key});

  @override
  State<HeroesPage> createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  List<HeroModel> allHeroes = [];
  List<HeroModel> filteredHeroes = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadHeroes();
  }

  Future<void> loadHeroes() async {
    try {
      final heroes = await HeroService.fetchHeroes();
      setState(() {
        allHeroes = heroes;
        filteredHeroes = heroes;
      });
    } catch (e) {
      print("Error fetching heroes: $e");
    }
  }

  void filterHeroes(String role) {
    if (role == "All") {
      filteredHeroes = allHeroes;
    } else {
      filteredHeroes =
          allHeroes.where((hero) => hero.roles.contains(role)).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: allHeroes.isEmpty
          ? const Center(child: CircularProgressIndicator(color: Colors.redAccent))
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/gambar/logo.png', height: 70, width: 60),
                  const SizedBox(width: 8),
                  Text(
                    'NikiPedia',
                    style: GoogleFonts.rakkas(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Search bar
              TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1C1D22),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  hintText: "Search Hero",
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    filteredHeroes = allHeroes
                        .where((hero) => hero.localizedName!
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildFilterButton("All"),
                    buildFilterButton("Carry"),
                    buildFilterButton("Support"),
                    buildFilterButton("Nuker"),
                    buildFilterButton("Melee"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text("Heroes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: filteredHeroes.map((hero) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HeroDetailPage(hero: hero),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1D22),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            hero.img,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              Text(
                                hero.localizedName ?? hero.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Role: ${hero.roles.first}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Winrate: ${hero.winRate.toStringAsFixed(2)}%",
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  //Role select
  Widget buildFilterButton(String role) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () => filterHeroes(role),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(role, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
