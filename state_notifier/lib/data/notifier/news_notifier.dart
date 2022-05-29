import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/data/repository/news_repository.dart';

import 'news_state.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(): super(NewsLoadingState());
  
  void getNews() async {
    state = NewsLoadingState();
    final data = await NewsRepository().getNewsResponse();
    state = NewsLoadedState(news: data.entries!);
  }
}

final newsDataProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier()..getNews();
  // return NewsNotifier();
});