import 'dart:developer';
import 'package:news_app/config/utils/constants.dart';
import 'package:news_app/core/di/dependency_injection.dart';
import 'package:news_app/core/network/http_client.dart';
import 'package:news_app/home/news_provider/news_notifier.dart';
import 'package:news_app/home/data/model/news_model.dart';

class NewsRepository {
  int currentPage = 1;
  List<Article>? articles = [];
  int totalPages = 10;
  bool hasReachMax = false;
  BaseHttpClient baseClient = sl.get<BaseHttpClient>();

  Future<List<Article>?> getNews({bool isRefresh = false, required NewsState state}) async {
    if (isRefresh) {
      currentPage = 1;
      hasReachMax = false;
    } else {
      if (currentPage >= totalPages) {
        hasReachMax = true;
        state = NewsLoadedState(news: articles!, enablePullUp: false);
      }
    }

    String url = "${Constants.baseUrl}/everything?q=bitcoin&page=$currentPage&pageSize=10&apiKey=${Constants.apiKey}";
    log(url);
    final response = await baseClient.client.get(url);
    log('${response.statusCode}::::::::::::::::::::::::::::::');
    if (!hasReachMax) {
      if (response.statusCode == 200) {
        final result = newsModelFromJson(response.data);
        if (isRefresh) {
          articles = result.articles!;
        } else {
          articles!.addAll(result.articles!);
        }
        currentPage++;
        // totalPages = 10;
        return articles;
      } else {
        throw Exception("Failed to load news");
      }
    } else {
      return articles;
    }
  }
}
