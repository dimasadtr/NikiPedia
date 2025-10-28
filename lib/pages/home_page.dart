import 'package:flutter/material.dart';
import '../models/hero_model.dart';
import '../models/gradient_background.dart';
import '../service/hero_service.dart';
import 'hero_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HeroModel> heroes = [];

  @override
  void initState() {
    super.initState();
    loadHeroes();
  }

  Future<void> loadHeroes() async {
    try {
      final data = await HeroService.fetchHeroes();
      setState(() {
        heroes = data;
      });
    } catch (e) {
      print("Error loading heroes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: heroes.isEmpty
          ? const Center(child: CircularProgressIndicator(color: Colors.redAccent))
          : SafeArea(
        child: SingleChildScrollView(
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
                const SizedBox(height: 5),
                // Banner Hero
                ClipRRect(
                  child: Stack(
                    children: [
                      Image.network(
                        heroes[3].img,
                        height: 280,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${heroes[3].localizedName}',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              "${heroes[3].localizedName ?? heroes[20].name} is a hero with roles of ${heroes[20].roles.first} \n"
                                  "and an ${heroes[20].attackType.toLowerCase()} attack type. \n",
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Popular Hero',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final hero = heroes[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HeroDetailPage(hero: hero),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            width: 130,
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
                                  child: Image.network(hero.img, height: 100, fit: BoxFit.cover),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(hero.localizedName ?? hero.name,
                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Role: ${hero.roles.first}',
                                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                      Text(
                                        'Winrate: ${hero.winRate.toStringAsFixed(2)}%',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.greenAccent),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
