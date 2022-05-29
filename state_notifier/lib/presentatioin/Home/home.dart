import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/data/notifier/news_notifier.dart';
import 'package:test_app/data/notifier/news_state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ref.read(newsDataProvider.notifier).getNews();
    // NewsState state = ref.watch(newsDataProvider);
    return Scaffold(
      // appBar: AppBar(title: const Text('News data')),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   ref.read(newsDataProvider.notifier).getNews();
      // }),
      body: Consumer(
        builder: (context, ref, child) {
          NewsState state = ref.watch(newsDataProvider);
          if (state is NewsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NewsLoadedState) {
            return Column(
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
                );
          }
          return Container();
        },
      ),
    );
  }
}
