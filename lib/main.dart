import 'package:fgap/custom_components/customDrawer.dart';
import 'package:fgap/custom_components/customerList.dart';
import 'custom_components/customAppBar.dart';
import 'custom_components/projectList.dart';
import 'package:fgap/models/projectModel.dart';
import 'models/customerModel.dart';
import 'package:fgap/rest/webService.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AssessmentsPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class AssessmentsPage extends StatefulWidget {
  AssessmentsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AssessmentsPageState createState() => _AssessmentsPageState();
}

class _AssessmentsPageState extends State<AssessmentsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String apiKey = '7879e991a1dc4c1eb263f95ff00e23f5';
  List<ProjectModel> _projects = [];
  List<ProjectModel> _auxProjects = List<ProjectModel>();

  List<CustomerModel> _customers = [];
  List<CustomerModel> _auxCustomers = List<CustomerModel>();

  String _filter;
  int _tabIndex = 0;

  openNavigationDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  populateProjects() {
    Webservice().load(ProjectModel.all).then((projects) => {
          setState(() =>
              {_projects.addAll(projects), _auxProjects.addAll(projects)}),
        });
  }

  populateCustomers() {
    Webservice().load(CustomerModel.all).then((customers) => {
          setState(() =>
              {_customers.addAll(customers), _auxCustomers.addAll(customers)}),
        });
  }

  onFilterTextChange(String value) {
    _filter = value;
    print(_filter);
  }

  onFilterTextEditingComplete() {
    if (_filter != null) {
      print(_tabIndex);
      switch (_tabIndex){
        case 0:
          filterProjects();
          break;
        case 1:
          filterCustomer();
          break;
      }
    }
  }

  filterProjects(){
    if (_filter.isNotEmpty) {
      var result = _auxProjects.where((items) => items.title.contains(_filter)).toList();
      setState(() => {_projects.clear(), _projects.addAll(result)});
    } 
    else {
      setState(() => {_projects.clear(), _projects.addAll(_auxProjects)});
    }
  }

  filterCustomer(){
    if (_filter.isNotEmpty) {
      var result = _auxCustomers.where((items) => items.name.contains(_filter)).toList();
      setState(() => {_customers.clear(), _customers.addAll(result)});
    } 
    else {
      setState(() => {_customers.clear(), _customers.addAll(_auxCustomers)});
    }
  }

  onTabIndexChange(int value){
    print(value);
    _tabIndex = value;
    _filter = '';
  }

  @override
  void initState() {
    populateProjects();
    populateCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFFAFAFA),
        drawer: CustomDrawer(),
        appBar: CustomAppBar(
          onLeadingPressed: () => openNavigationDrawer(),
          isBack: false,
          title: Text('Assessments'),
        ),
        body: _assessmentsBody());
  }

  _assessmentsBody() {
    return Container(
      padding: const EdgeInsets.all(25.0),
      color: const Color(0xFFFAFAFA),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: _assessmentsTabBar(),
          body: _assessmentsTabBody(),
        ),
      ),
    );
  }

  _assessmentsTabBar() {
    return TabBar(
      indicatorWeight: 5.0,
      indicatorColor: const Color(0xFF194B9C),
      labelColor: const Color(0xFF000000),
      unselectedLabelColor: const Color(0xFFC7C7C7),
      onTap: (index) => onTabIndexChange(index),
      tabs: [
        Tab(text: 'Projects'),
        Tab(text: 'Customers'),
      ],
    );
  }

  _assessmentsTabBody() {
    return TabBarView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            _searchBox(),
            SizedBox(height: 20),
            Divider(height: 1, color: const Color(0xFFC7C7C7), thickness: 2),
            SizedBox(height: 20),
            ProjectList(projects: _projects),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            _searchBox(),
            SizedBox(height: 20),
            Divider(height: 1, color: const Color(0xFFC7C7C7), thickness: 2),
            SizedBox(height: 20),
            CustomerList(customers: _customers),
          ],
        ),
      ],
    );
  }

  _searchBox() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: TextField(
        onEditingComplete: () => onFilterTextEditingComplete(),
        onChanged: (value) => onFilterTextChange(value),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: const Color(0xFF194B9C),
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
