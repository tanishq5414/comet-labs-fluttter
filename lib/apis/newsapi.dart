import 'package:cometlabs/config.dart';
import 'package:cometlabs/core/core.dart';
import 'package:cometlabs/model/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final newsAPIProvider = Provider((ref) => NewsAPI());
final _dio = Dio();

class NewsAPI {
  NewsAPI();

  FutureEither<List<NewsModel>> fetchNews() async {
    try {
      final response = await _dio.get(newsUrl);
      final newsDataList = List<Map<String, dynamic>>.from(response.data['articles']);
      final newsList = newsDataList
          .map((newsData) => NewsModel.fromJson(newsData))
          .toList();
      return right(newsList);
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  FutureEither<List<NewsModel>> searchNews(String query) async {
    try {
      final response = await _dio.get(searchUrl(query));
      final newsDataList = List<Map<String, dynamic>>.from(response.data['articles']);
      final newsList = newsDataList
          .map((newsData) => NewsModel.fromJson(newsData))
          .toList();
      return right(newsList);
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
