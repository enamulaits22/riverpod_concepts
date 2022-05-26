import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/data/model/news_model.dart';
import 'package:test_app/data/repository/news_repository.dart';

final newsDataProvider = FutureProvider<NewsModel>((ref) async {
  return ref.read(apiProvider).getNews();
});

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(newsDataProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('News data')),
      body: data.when(
        data: (data) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.entries!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.entries![index].description!),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, st) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
