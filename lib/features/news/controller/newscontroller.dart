import 'package:cometlabs/apis/newsapi.dart';
import 'package:cometlabs/core/core.dart';
import 'package:cometlabs/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsDataProvider = StateProvider<List<NewsModel>?>((ref) => null);
final searchDataProvider = StateProvider<List<NewsModel>?>((ref) => null);
final newsControllerProvider =
    StateNotifierProvider<NewsController, bool>((ref) {
  final newsAPI = ref.watch(newsAPIProvider);
  return NewsController(
    ref: ref,
    newsAPI: newsAPI,
  );
});

class NewsController extends StateNotifier<bool> {
  final NewsAPI _newsAPI;
  final Ref _ref;
  NewsController({required NewsAPI newsAPI, required Ref ref})
      : _newsAPI = newsAPI,
        _ref = ref,
        super(false);

  Future<void> fetchNews(BuildContext context) async {
    final res = await _newsAPI.fetchNews();
    res.fold(
      (l) => showSnackBar(context, l.message),
      (newsList) =>
          _ref.read(newsDataProvider.notifier).update((state) => newsList),
    );
  }

  Future<void> searchNews(BuildContext context, String query) async {
    final res = await _newsAPI.searchNews(query);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (newsList) =>
          _ref.read(searchDataProvider.notifier).update((state) => newsList),
    );
  }
}
