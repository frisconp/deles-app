import 'package:delesapp/data/models/article_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitialState extends ArticleState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadedState extends ArticleState {
  final List<Article> articles;

  ArticleLoadedState({@required this.articles});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ArticleErrorState extends ArticleState {
  final String message;

  ArticleErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
