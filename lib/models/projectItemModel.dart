import 'dart:convert';
import 'package:fgap/rest/webService.dart';
import 'package:fgap/utils/constants.dart';

class ProjectItemModel {
  
  final String taskName;
  final String description; 
  final String imageUrl;  

  ProjectItemModel({this.taskName, this.description, this.imageUrl});

  factory ProjectItemModel.fromJson(Map<String,dynamic> json) {
    return ProjectItemModel(
      taskName: json['taskName'], 
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }


 static Resource<List<ProjectItemModel>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => ProjectItemModel.fromJson(model)).toList();
      }
    );

  }

}