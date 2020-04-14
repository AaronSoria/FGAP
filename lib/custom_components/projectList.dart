import 'package:fgap/models/projectModel.dart';
import 'package:flutter/material.dart';

class ProjectList extends StatefulWidget{
  ProjectList({Key key, this.title, this.projects}) : super(key: key);
  final String title;
  final List<ProjectModel> projects;

    @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {

  List<ProjectModel> _projects = List<ProjectModel>(); 

  @override
  void initState() {
    super.initState();
    _populateprojects(); 
  }

  void _populateprojects() {
      setState(() => {
        _projects = widget.projects
      });
  }
 
  Card _buildItemsForListView(BuildContext context, int index) {
   return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white, 
        ),
        child: _cardItembody(_projects[index].title),
      ),
    );
  }

  ListTile _cardItembody(String text){
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.5),
        title: Container(
          child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
        ),
        trailing: Icon(Icons.keyboard_arrow_right, color: const Color(0xFF194B9C), size: 40.0));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemCount: _projects.length,
          itemBuilder: _buildItemsForListView,
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(height: 20);
          },
        )
      );
  }

}
