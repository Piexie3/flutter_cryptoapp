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
        id: json['id'] as String,
        name: json['name'] as String,
        symbol: json['symbol'] as String,
        rank: json['rank'] as int,
        isNew: json['is_new'] as bool,
        isActive: json['is_active'] as bool,
        type: json['type'] as String,
      );
}
