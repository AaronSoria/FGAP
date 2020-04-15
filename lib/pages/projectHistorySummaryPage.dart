import 'package:fgap/custom_components/customAppBar.dart';
import 'package:fgap/custom_components/customDrawer.dart';
import 'package:fgap/custom_components/projectHistorySummaryList.dart';
import 'package:fgap/models/projectItemModel.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<ProjectItemModel> _projectItems = [];


  @override
  void initState() {
    populateProjectItems();
    super.initState();
  }

  populateProjectItems(){
    setState(() =>
      {
        _projectItems.add(ProjectItemModel(taskName: 'Painting', description: 'The labor we delight in physics pain', imageUrl: 'https://mejorconsalud.com/wp-content/uploads/2018/04/pintar-una-casa-con-rodillo-con-relieve.jpg')),
        _projectItems.add(ProjectItemModel(taskName: 'Repair kitchen pipe', description: 'The work we enjoy is not really work', imageUrl: 'https://www.fontanerosexpress.com/wp-content/uploads/2017/12/tuberias-1024x376.jpg')),
        _projectItems.add(ProjectItemModel(taskName: 'Wall crack repair', description: 'I know the burden of hosting him is both an honor and a trouble, but that doesn’t mean it’s not a trouble just the same.', imageUrl: 'https://hgtvhome.sndimg.com/content/dam/images/hgrm/fullset/2012/8/8/0/detp413_1fk-pushing-cement-into-crack_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1405512500939.jpeg')),
        _projectItems.add(ProjectItemModel(taskName: 'Wall crack repair', description: 'I know the burden of hosting him is both an honor and a trouble, but that doesn’t mean it’s not a trouble just the same.', imageUrl: 'https://hgtvhome.sndimg.com/content/dam/images/hgrm/fullset/2012/8/8/0/detp413_1fk-pushing-cement-into-crack_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1405512500939.jpeg')),
      });
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        drawer: CustomDrawer(),
        appBar: CustomAppBar(
          onLeadingPressed: () => openNavigationDrawer(),
          isBack: false,
          title: Text('Assessments'),
        ),
        body: _body());

  }

  _body(){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _projectCard(),
          SizedBox(height: 20),
          ProjectHistorySummaryList(projectItems: _projectItems)
        ],
      ),
    );
  }

  _projectCard() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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

  openNavigationDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

}