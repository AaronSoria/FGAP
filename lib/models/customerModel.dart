import 'dart:convert';
import 'package:fgap/rest/webService.dart';
import 'package:fgap/utils/constants.dart';

class CustomerModel {
  
  final String name; 
  final String descrption; 

  CustomerModel({this.name, this.descrption});

  factory CustomerModel.fromJson(Map<String,dynamic> json) {
    return CustomerModel(
      name: json['title'], 
      descrption: json['description']
    );
  }


 static Resource<List<CustomerModel>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => CustomerModel.fromJson(model)).toList();
      }
    );

  }

}