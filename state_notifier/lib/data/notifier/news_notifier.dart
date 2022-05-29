import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/data/repository/news_repository.dart';

import 'news_state.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(): super(NewsState(news: []));
  
  void getNews() async {
    state = NewsState(news: [], isLoading: true);
    final data = await NewsRepository().getNewsResponse();
    state = NewsState(news: data.entries!, isLoading: false);
  }
}

final newsDataProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier()..getNews();
  // return NewsNotifier();
});