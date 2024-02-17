import 'dart:ffi';

class Exchange {
  String? id;
  String? name;
  String? description;
  bool? active;
  bool? websiteStatus;
  bool? apiStatus;
  String? message;
  // Links? links;
  bool? marketsDataFetched;
  int? adjustedRank;
  int? reportedRank;
  int? currencies;
  int? markets;
  List<Fiats>? fiats;
  // Quotes? quotes;
  String? lastUpdated;

  Exchange({
    this.id,
    this.name,
    this.description,
    this.active,
    this.websiteStatus,
    this.apiStatus,
    this.message,
    // this.links,
    this.marketsDataFetched,
    this.adjustedRank,
    this.reportedRank,
    this.currencies,
    this.markets,
    this.fiats,
    // this.quotes,
    this.lastUpdated,
  });

  Exchange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    active = json['active'];
    websiteStatus = json['website_status'];
    apiStatus = json['api_status'];
    message = json['message'];
    // links = json['links'] != null ? Links.fromJson(json['links']) : null;
    marketsDataFetched = json['markets_data_fetched'];
    adjustedRank = json['adjusted_rank'];
    reportedRank = json['reported_rank'];
    currencies = json['currencies'];
    markets = json['markets'];
    if (json['fiats'] != null) {
      fiats = <Fiats>[];
      json['fiats'].forEach((v) {
        fiats!.add(Fiats.fromJson(v));
      });
    }
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['active'] = active;
    data['website_status'] = websiteStatus;
    data['api_status'] = apiStatus;
    data['message'] = message;

    data['markets_data_fetched'] = marketsDataFetched;
    data['adjusted_rank'] = adjustedRank;
    data['reported_rank'] = reportedRank;
    data['currencies'] = currencies;
    data['markets'] = markets;
    if (fiats != null) {
      data['fiats'] = fiats!.map((v) => v.toJson()).toList();
    }
    data['last_updated'] = lastUpdated;

    return data;
  }
}

class Fiats {
  String? name;
  String? symbol;

  Fiats({this.name, this.symbol});

  Fiats.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}
