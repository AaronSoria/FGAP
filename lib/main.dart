import 'package:fgap/custom_components/customDrawer.dart';
import 'package:fgap/models/newArticleModel.dart';
import 'package:fgap/rest/webService.dart';
import 'package:flutter/material.dart';
import 'custom_components/customAppBar.dart';

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

  openNavigationDrawer() {
    _scaffoldKey.currentState.openDrawer();
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
      tabs: [
        Tab(text: 'Projects'),
        Tab(text: 'Customers'),
      ],
    );
  }

  _assessmentsTabBody(){
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
          NewsList(),
          // Container(
          //   width: double.infinity,
          //   height: 400,
          //   child: NewsList()),
          ],
      ),
      Icon(Icons.directions_transit),
      ],
    );
}

  _searchBox() {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(3)),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF194B9C),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none)),
          ),
    );
  }
  
}

class NewsList extends StatefulWidget{
  NewsList({Key key, this.title}) : super(key: key);
  final String title;

    @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  List<NewsArticleModel> _newsArticles = List<NewsArticleModel>(); 

  @override
  void initState() {
    super.initState();
    _populateNewsArticles(); 
  }

  void _populateNewsArticles() {
   
    Webservice().load(NewsArticleModel.all).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }
 
 ListTile _buildItemsForListView(BuildContext context, int index) {
      return ListTile(
        title: Text(index.toString()), 
        subtitle: Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: _newsArticles.length,
          itemBuilder: _buildItemsForListView,
        )
      );
  }

}
