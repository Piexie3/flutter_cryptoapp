class Coin {
  final String id;
  final String name;
  final String symbol;
  final int rank;
  final bool isNew;
  final bool isActive;
  final String type;

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.isNew,
    required this.isActive,
    required this.type,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json['id'],
        name: json['name'],
        symbol: json['symbol'],
        rank: json['rank'],
        isNew: json['is_new'],
        isActive: json['is_active'],
        type: json['type'],
      );
}
