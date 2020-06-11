import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/article_model.dart';
import '../../data/repositories/article_repository.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleRepository repository;

  ArticleBloc({@required this.repository});

  @override
  // TODO: implement initialState
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is GetArticlesEvent) {
      yield ArticleLoadingState();
      try {
        List<Article> articles = await repository.getArticles();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }
}
