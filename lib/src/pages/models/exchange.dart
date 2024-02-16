class Exchange {
  String? id;
  String? name;
  String? description;
  bool? active;
  bool? websiteStatus;
  bool? apiStatus;
  String? message;
  Links? links;
  bool? marketsDataFetched;
  int? adjustedRank;
  int? reportedRank;
  int? currencies;
  int? markets;
  List<Fiats>? fiats;
  Quotes? quotes;
  String? lastUpdated;
  int? sessionsPerMonth;
  int? confidenceScore;

  Exchange(
      {this.id,
      this.name,
      this.description,
      this.active,
      this.websiteStatus,
      this.apiStatus,
      this.message,
      this.links,
      this.marketsDataFetched,
      this.adjustedRank,
      this.reportedRank,
      this.currencies,
      this.markets,
      this.fiats,
      this.quotes,
      this.lastUpdated,
      this.sessionsPerMonth,
      this.confidenceScore});

  Exchange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    active = json['active'];
    websiteStatus = json['website_status'];
    apiStatus = json['api_status'];
    message = json['message'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
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
    quotes = json['quotes'] != null ? Quotes.fromJson(json['quotes']) : null;
    lastUpdated = json['last_updated'];
    sessionsPerMonth = json['sessions_per_month'];
    confidenceScore = json['confidence_score'];
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
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['markets_data_fetched'] = marketsDataFetched;
    data['adjusted_rank'] = adjustedRank;
    data['reported_rank'] = reportedRank;
    data['currencies'] = currencies;
    data['markets'] = markets;
    if (fiats != null) {
      data['fiats'] = fiats!.map((v) => v.toJson()).toList();
    }
    if (quotes != null) {
      data['quotes'] = quotes!.toJson();
    }
    data['last_updated'] = lastUpdated;
    data['sessions_per_month'] = sessionsPerMonth;
    data['confidence_score'] = confidenceScore;
    return data;
  }
}

class Links {
  List<String>? twitter;
  List<String>? website;

  Links({this.twitter, this.website});

  Links.fromJson(Map<String, dynamic> json) {
    twitter = json['twitter'].cast<String>();
    website = json['website'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['twitter'] = twitter;
    data['website'] = website;
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

class Quotes {
  USD? uSD;

  Quotes({this.uSD});

  Quotes.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    return data;
  }
}

class USD {
  int? reportedVolume24h;
  int? adjustedVolume24h;
  int? reportedVolume7d;
  int? adjustedVolume7d;
  int? reportedVolume30d;
  int? adjustedVolume30d;

  USD(
      {this.reportedVolume24h,
      this.adjustedVolume24h,
      this.reportedVolume7d,
      this.adjustedVolume7d,
      this.reportedVolume30d,
      this.adjustedVolume30d});

  USD.fromJson(Map<String, dynamic> json) {
    reportedVolume24h = json['reported_volume_24h'];
    adjustedVolume24h = json['adjusted_volume_24h'];
    reportedVolume7d = json['reported_volume_7d'];
    adjustedVolume7d = json['adjusted_volume_7d'];
    reportedVolume30d = json['reported_volume_30d'];
    adjustedVolume30d = json['adjusted_volume_30d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reported_volume_24h'] = reportedVolume24h;
    data['adjusted_volume_24h'] = adjustedVolume24h;
    data['reported_volume_7d'] = reportedVolume7d;
    data['adjusted_volume_7d'] = adjustedVolume7d;
    data['reported_volume_30d'] = reportedVolume30d;
    data['adjusted_volume_30d'] = adjustedVolume30d;
    return data;
  }
}
