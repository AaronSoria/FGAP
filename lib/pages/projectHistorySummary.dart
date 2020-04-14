import 'package:fgap/models/projectModel.dart';
import 'package:flutter/material.dart';

class ProjectHistorySummaryPage extends StatefulWidget {
  ProjectHistorySummaryPage({Key key, this.title}) : super(key: key);
  final String title;
  ProjectModel project = new ProjectModel(title: 'ProjectName', customerName:'Maxwell Smart', address: '497 Evergreen Rd. Roseville …');

  @override
  _ProjectHistorySummaryPageState createState() => _ProjectHistorySummaryPageState();
}

class _ProjectHistorySummaryPageState extends State<ProjectHistorySummaryPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          _projectCard(),
          SizedBox(height: 20),
          //_projectDetailList()
        ],
      ),
    );
  }

  _projectCard() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.widget.project.customerName, 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: const Color(0xFF9E9E9E)
            )
          ),
          SizedBox(height: 10),
          Text(
            this.widget.project.title, 
            style: TextStyle(
              fontSize: 22,
              color: const Color(0xFF111111)
            )
          ),
          SizedBox(height: 10),
          Divider(height: 1, color: const Color(0xFFC7C7C7), thickness: 2),
          SizedBox(height: 5),
          Text(
            this.widget.project.address, 
            style: TextStyle(
              fontSize: 16,
              color: const Color(0xFF9E9E9E)
            )
          ),
        ],
      ),
      ),
    );
  }
  _projectDetailList() {}
}