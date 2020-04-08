import 'dart:convert';
import 'package:fgap/rest/webService.dart';
import 'package:fgap/utils/constants.dart';

class NewsArticleModel {
  
  final String title; 
  final String descrption; 
  final String urlToImage; 

  NewsArticleModel({this.title, this.descrption, this.urlToImage});

  factory NewsArticleModel.fromJson(Map<String,dynamic> json) {
    return NewsArticleModel(
      title: json['title'], 
      descrption: json['description']
    );
  }


 static Resource<List<NewsArticleModel>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => NewsArticleModel.fromJson(model)).toList();
      }
    );

  }

}