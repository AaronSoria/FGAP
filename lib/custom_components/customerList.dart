import 'package:fgap/models/customerModel.dart';
import 'package:flutter/material.dart';

class CustomerList extends StatefulWidget{
  CustomerList({Key key, this.title, this.customers}) : super(key: key);
  final String title;
  final List<CustomerModel> customers;

    @override
  CustomerListState createState() => CustomerListState();
}

class CustomerListState extends State<CustomerList> {

  List<CustomerModel> _customers = List<CustomerModel>(); 

  @override
  void initState() {
    super.initState();
    _populatecustomers(); 
  }

  void _populatecustomers() {
      setState(() => {
        _customers = widget.customers
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
        child: _cardItembody(_customers[index].name),
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
          itemCount: _customers.length,
          itemBuilder: _buildItemsForListView,
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(height: 20);
          },
        )
      );
  }

}
