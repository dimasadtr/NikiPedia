class HeroModel {
  final String name;
  final String primaryAttr;
  final String attackType;
  final List roles;
  final String img;
  final double winRate;
  final String? localizedName;
  final int baseStr;
  final int baseAgi;
  final int baseInt;
  final int baseHp;
  final int baseMana;

  HeroModel({
    required this.name,
    required this.primaryAttr,
    required this.attackType,
    required this.roles,
    required this.img,
    required this.winRate,
    required this.baseStr,
    required this.baseAgi,
    required this.baseInt,
    required this.baseHp,
    required this.baseMana,
    this.localizedName,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    final int str = json['base_str'] ?? 0;
    final int agi = json['base_agi'] ?? 0;
    final int intel = json['base_int'] ?? 0;

    final int hp = (200 + str * 20).toInt();
    final int mana = (75 + intel * 12).toInt();

    return HeroModel(
      name: json['name'],
      primaryAttr: json['primary_attr'],
      attackType: json['attack_type'],
      roles: json['roles'],
      img: "https://cdn.cloudflare.steamstatic.com" + json['img'],
      winRate: (json['pro_win'] ?? 0) / ((json['pro_pick'] ?? 1)) * 100,
      localizedName: json['localized_name'],
      baseStr: str,
      baseAgi: agi,
      baseInt: intel,
      baseHp: hp,
      baseMana: mana,
    );
  }
}
