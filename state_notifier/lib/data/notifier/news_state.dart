// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_app/data/model/news_model.dart';

class NewsState {
  List<Entry> news;
  bool isLoading;
  NewsState({
    required this.news,
    this.isLoading = true,
  });
}
