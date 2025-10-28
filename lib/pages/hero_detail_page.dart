
import 'package:flutter/material.dart';
import '../models/hero_model.dart';
import '../service/heroability_service.dart';

class HeroDetailPage extends StatefulWidget {
  final HeroModel hero;
  const HeroDetailPage({super.key, required this.hero});

  @override
  State<HeroDetailPage> createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  List<dynamic> heroSkills = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadHeroSkills();
  }

  Future<void> loadHeroSkills() async {
    try {
      final skills = await HeroAbilityService.fetchHeroSkills(widget.hero.name);
      setState(() {
        heroSkills = skills;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hero = widget.hero;

    return Scaffold(
      backgroundColor: const Color(0xFF000822),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Tombol kembali
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.redAccent, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 8),

              // Gambar hero
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    hero.img,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              // Nama dan tipe hero
              Text(
                hero.localizedName ?? hero.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFE066),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "${hero.attackType} - Medium Difficulty",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 16),

              // Statistik hero
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 6,
                children: [
                  _buildStatBox("${hero.baseStr} ", Icons.gavel),
                  _buildStatBox("${hero.baseInt}", Icons.flash_on),
                  _buildStatBox("${hero.baseAgi}", Icons.directions_run),
                  _buildStatBox("18 -2", Icons.heart_broken, textColor: Colors.green),
                ],
              ),

              const SizedBox(height: 10),

              // HP dan Mana bar
              _buildStatusBar("${hero.baseHp} / ${hero.baseHp}", Colors.green),
              const SizedBox(height: 8),
              _buildStatusBar(" ${hero.baseMana} / ${hero.baseMana}", Colors.blue),


              SizedBox(height: 20),

              // Abilities
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: heroSkills.length,
                    itemBuilder: (context, index) {
                      final skill = heroSkills[index];
                      final img = skill['img'] != null
                          ? "https://cdn.cloudflare.steamstatic.com${skill['img']}"
                          : null;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: img != null
                              ? Image.network(
                            img,
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                              );
                            },
                          )
                              : Container()
                        ),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 20),

              // Deskripsi Hero
              Text(
                "${hero.localizedName ?? hero.name} is a ${hero.primaryAttr.toUpperCase()} hero "
                    "who excels at ${hero.roles.join(', ')}. This hero uses their abilities "
                    "to surprise, chase, and assault enemies.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),


              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildStatBox(String value, IconData icon,
      {Color textColor = Colors.white}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white54, size: 14),
          const SizedBox(width: 4),
          Text(value, style: TextStyle(color: textColor, fontSize: 12)),
        ],
      ),
    );
  }

  // Widget kecil untuk bar HP / Mana
  Widget _buildStatusBar(String label, Color color) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 24,
            width: 350,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
