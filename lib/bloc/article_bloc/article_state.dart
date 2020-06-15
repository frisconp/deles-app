import 'package:delesapp/data/models/article_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitialState extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadedState extends ArticleState {
  final List<Article> articles;

  ArticleLoadedState({@required this.articles});

  @override
  List<Object> get props => throw UnimplementedError();
}

class ArticleErrorState extends ArticleState {
  final String message;

  ArticleErrorState({@required this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}
