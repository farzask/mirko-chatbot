class Ticker {
  final String bid;
  final String ask;
  final String last;

  Ticker({required this.bid, required this.ask, required this.last});

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      bid: json['bid'],
      ask: json['ask'],
      last: json['last'],
    );
  }
}
