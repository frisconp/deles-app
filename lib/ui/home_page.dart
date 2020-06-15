import 'package:delesapp/bloc/article_bloc/article_bloc.dart';
import 'package:delesapp/bloc/article_bloc/article_event.dart';
import 'package:delesapp/bloc/article_bloc/article_state.dart';
import 'package:delesapp/data/models/article_model.dart';
import 'package:delesapp/ui/base_page.dart';
import 'package:delesapp/ui/components/article_big_card.dart';
import 'package:delesapp/ui/components/article_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArticleBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.add(GetArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Beranda',
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 150,
              child: BlocListener<ArticleBloc, ArticleState>(
                listener: (context, state) => (state is ArticleErrorState)
                    ? Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)))
                    : null,
                child: BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    var _returnCondition;
                    if (state is ArticleInitialState) {
                      _returnCondition = BasePage().buildLoading();
                    } else if (state is ArticleLoadingState) {
                      _returnCondition = BasePage().buildLoading();
                    } else if (state is ArticleLoadedState) {
                      _returnCondition = buildArticleBigCard(state.articles);
                    } else if (state is ArticleErrorState) {
                      _returnCondition = BasePage().buildErrorUi(state.message);
                    }
                    return _returnCondition;
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                'Berita Terbaru',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (context, state) {
                  var _returnCondition;
                  if (state is ArticleInitialState) {
                    _returnCondition = BasePage().buildLoading();
                  } else if (state is ArticleLoadingState) {
                    _returnCondition = BasePage().buildLoading();
                  } else if (state is ArticleLoadedState) {
                    _returnCondition = buildArticleListCard(state.articles);
                  } else if (state is ArticleErrorState) {
                    _returnCondition = BasePage().buildErrorUi(state.message);
                  }
                  return _returnCondition;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArticleBigCard(List<Article> articles) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(right: 20),
      itemCount: articles.length,
      itemBuilder: (context, index) => ArticleBigCard(
        article: articles.elementAt(index),
      ),
    );
  }

  Widget buildArticleListCard(List<Article> articles) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: articles.length,
      itemBuilder: (context, index) => ArticleListCard(
        article: articles.elementAt(index),
      ),
    );
  }
}
