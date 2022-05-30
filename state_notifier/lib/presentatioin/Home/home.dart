import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/data/notifier/news_notifier.dart';
import 'package:test_app/data/notifier/news_state.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // ref.read(newsDataProvider.notifier).getNews();
    NewsState state = ref.watch(newsDataProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('News data')),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(newsDataProvider.notifier).getNews();
      }),
      body: state is NewsLoadingState
        ? const Center(child: CircularProgressIndicator())
        : state is NewsLoadedState ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.news.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.news[index].description!),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : Container(),
    );
  }
}
