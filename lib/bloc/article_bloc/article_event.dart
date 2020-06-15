import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {}

class GetArticlesEvent extends ArticleEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
