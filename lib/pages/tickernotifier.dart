import 'package:flutter/material.dart';
import 'package:mirko/models/ticker.dart';
import 'package:mirko/services/gemini.dart';

class TickerProvider with ChangeNotifier {
  final GeminiApi _geminiApi = GeminiApi();
  Ticker? _ticker;
  bool _isLoading = false;

  Ticker? get ticker => _ticker;
  bool get isLoading => _isLoading;

  Future<void> fetchTicker(String symbol) async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await _geminiApi.getTicker(symbol);
      _ticker = Ticker.fromJson(data);
    } catch (error) {
      print(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
