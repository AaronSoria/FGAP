import 'dart:convert';
import 'package:fgap/rest/webService.dart';
import 'package:fgap/utils/constants.dart';

class ProjectModel {
  
  final String title;
  final String customerName; 
  final String descrption; 
  final String address; 

  ProjectModel({this.title, this.customerName, this.descrption, this.address});

  factory ProjectModel.fromJson(Map<String,dynamic> json) {
    return ProjectModel(
      title: json['title'], 
      descrption: json['description']
    );
  }


 static Resource<List<ProjectModel>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => ProjectModel.fromJson(model)).toList();
      }
    );

  }

}