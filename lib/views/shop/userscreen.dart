import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/shop/searchappbar.dart';

import 'constants.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<String> usersName = <String>[
    'Pratap Kumar',
    'Jagadeesh',
    'Srinivas',
    'Narendra',
    'Sravan ',
    'Ranganadh',
    'Vincent',
    'miriam',
    'Lucy',
    'Agnes',
    'Anthony',
    'John',
  ];
  List<String> usersImage = <String>[
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
    'https://cdn.motherandbaby.co.uk/web/1/root/baby-towel-face.png',
  ];
  String? filter;
  @override
  void initState() {
    super.initState();
    Constants.searchController.addListener(() {
      setState(() {
        filter = Constants.searchController.text;
      });
    });
  }

  Widget bodyList(int index){
    return Card(
      color: Color(0xFF1e141d),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage('${usersImage[index]}'.toString()),
        ),

        title: Text(usersName[index],
          style: TextStyle(
              fontSize: 18.0,
              color:Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(usersName[index],
          style: TextStyle(
              fontSize: 18.0,
              color:Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),

        trailing: Icon(Icons.favorite,color: Colors.deepOrange,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: SearchAppBar(),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: usersName.length,
              itemBuilder: (context, index) {
                return filter == null || filter == ""
                    ? bodyList(index)
                    : '${usersName[index]}'
                    .toLowerCase()
                    .contains(
                    filter!.toLowerCase())
                    ? bodyList(index)
                    : Container();
              }),


        )));
  }
}