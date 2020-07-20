
import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'DrawerNew.dart';
import 'package:http/http.dart' as http;

import 'model/User.dart';
import 'model/beautyItems.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BeautyItems> list=new List();

  var users = new List<User>();


  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }


//Widget _beautyParlourList(){
//  return Container(
//    child:  FutureBuilder<List<User>>(
//      //future: fetchCustomerListFromDatabase(),
//      //future: futureUser,
//      builder: (context, snapshot) {
//        if (snapshot.hasData) {
//          return new ListView.builder(
//              itemCount: snapshot.data.length,
//              itemBuilder: (context, index) {
//                return new Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: <Widget>[
//                      Container(
//                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
//                        child: InkWell(
//                          onTap: () {
////                            Navigator.push(
////                                context,
////                                MaterialPageRoute(
////                                    builder: (context) =>
////                                        MyCustomerBill()));
//                          },
//                          child: new Card(
//                            child: Container(
//                              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
//                              child: new Text(snapshot.data[index].title,
//                                  style: new TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      fontSize: 18.0)),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ]);
//              });
//        } else if (snapshot.hasError) {
//          return new Text("${snapshot.error}");
//        }
//        return new Container(
//          alignment: AlignmentDirectional.center,
//          child: new CircularProgressIndicator(),
//        );
//      },
//    ),
//  );
//}
  Widget _imageCards(){
    AssetImage assetImage= AssetImage('Images/beauty1.jpg');
    Image image=Image(image:assetImage,width:100,height:100);
    return image;
  }

  Widget _beautyParlourList(){
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          //return ListTile(title: Text(users[index].name));

          return Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: InkWell(
              onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) =>
//                                        MyCustomerBill()));
              },
              child: new Card(
                child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child:_imageCards()
                       ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: new Text(users[index].name,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,)),

                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

Widget _search_widget (){

    return RaisedButton(
      child: Text('Search',style: TextStyle(fontSize:20,color: Colors.white),
      ),
      color: Colors.blue,
      onPressed: (){
        showSearch(context: context,delegate: BeautyItemSearch());
      },
    );
//  return SearchWidget<BeautyItems>(
//    dataList: list,
//    hideSearchBoxWhenItemSelected: false,
//    listContainerHeight: MediaQuery.of(context).size.height / 4,
//    queryBuilder: (String query, List<BeautyItems> list) {
//      return list.where((BeautyItems item) => item.title.toLowerCase().contains(query.toLowerCase()))?.toList()??[];
//    },
//    popupListItemBuilder: (BeautyItems item) {
//      return Home(item);
//    },
//    selectedItemBuilder: (BeautyItems selectedItem, VoidCallback deleteSelectedItem) {
//      return SelectedItemWidget(selectedItem, deleteSelectedItem);
//    },
// widget customization
//    noItemsFoundWidget: NoItemsFound(),
//    textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
//      return MyTextField(controller, focusNode);
//    },
//  );
}


 final myCraousal = Carousel(
   dotSize: 3.0,
   dotIncreaseSize: 2.0,
   //borderRadius: true,
   //indicatorBgPadding: 5,
   boxFit: BoxFit.fill,
   dotVerticalPadding: -50.0,
   //overlayShadow: false,
   //dotBgColor: Colors.blue,
   animationCurve: Curves.easeIn,
   animationDuration: Duration(seconds: 2),
   images: [
     Image.asset('Images/beauty1.jpg'),
     Image.asset('Images/beauty2.jpg'),
     Image.asset('Images/beauty3.jpg'),
     Image.asset('Images/back8.jpg'),
   ],
 );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      appBar: AppBar(
        title: Text("My Beauty Parlour",style: TextStyle(fontStyle: FontStyle.italic),),
        backgroundColor: Color(0xFF333333),
        actions: <Widget>[
          IconButton(onPressed: (){
            showSearch(context: context,delegate: BeautyItemSearch());
               }, icon: Icon(Icons.search),),
        ],
      ),
      drawer: DrawerNew(),
      body:  ListView(
          children: <Widget>[
            Container(
              height: 200,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: myCraousal,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.all(5),
              child:_search_widget(),
            ),
            _beautyParlourList(),

          ],
        ),

    );
  }
}

class BeautyItemSearch extends SearchDelegate<BeautyItems>{
  @override
  List<Widget> buildActions(BuildContext context) {

    return [IconButton(icon:Icon(Icons.clear), onPressed:(){
      query ="";
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(onPressed: (){
      close(context, null);
    }, icon:Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
  return Center(child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty? loadBeautyItems()
        : loadBeautyItems().where ((p) => p.title.startsWith(query)).toList();

    return mylist.isEmpty? Text('No result Found') : ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (context,index){
          final BeautyItems beautyItems = mylist[index];
          return ListTile(
            onTap:() {
              showResults(context);
            },
            title: Text(beautyItems.title),);
        });

  }
  
}

const baseUrl = "https://jsonplaceholder.typicode.com";
//const baseUrl = "https://localhost:8000/getAllTodo";


class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }
}
