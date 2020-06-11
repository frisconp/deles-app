import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../res/api_url_list.dart';
import '../models/article_model.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles();
}

class ArticleRepositoryList implements ArticleRepository {
  @override
  Future<List<Article>> getArticles() async {
    var response = await http.get(ApiUrlList.getAllArticles);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> articleList = (jsonData as Map<String, dynamic>)['data'];
      List<Article> articles = [];

      for (int i = 0; i < articleList.length; i++) {
        articles.add(Article.fromJson(articleList[i]));
      }

      return articles;
    } else {
      throw Exception();
    }
  }
}
