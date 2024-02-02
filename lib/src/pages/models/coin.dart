class Coin {
  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;

  Coin({
    this.id,
    this.name,
    this.symbol,
    this.rank,
    this.isNew,
    this.isActive,
    this.type,
  });

  Coin.fromJson(List<Map<String, dynamic>> json) {
    json.map((e) {
      id = e['id'];
      name = e['name'];
      symbol = e['symbol'];
      rank = e['rank'];
      isNew = e['is_new'];
      isActive = e['is_active'];
      type = e['type'];
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['rank'] = rank;
    data['is_new'] = isNew;
    data['is_active'] = isActive;
    data['type'] = type;
    return data;
  }
}
