import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/shop/constants.dart';


class SearchAppBar extends StatefulWidget implements PreferredSizeWidget{
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);

}

class _SearchAppBarState extends State<SearchAppBar> {
  static String title = 'Find user';
  Widget appBarTitle = Text(title);
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 10.0),
        elevation: 4.0,
        backgroundColor: Colors.deepOrange,
        title: appBarTitle,
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: actionIcon,
                  onPressed: () {
                    setState(() {
                      if (this.actionIcon.icon == Icons.search) {
                        this.actionIcon = Icon(Icons.close);
                        this.appBarTitle = TextFormField(

                            cursorColor: Colors.white,
                            onChanged: (String value){
                              Constants.searchText = value;
                            },
                            controller: Constants.searchController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search, color: Colors.grey),
                              hintText: "Search...",

                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent),
                              ),
                            ));
                      } else {
                        this.actionIcon = Icon(Icons.search);
                        this.appBarTitle = Text(title);
                      }
                    });
                  }),
            ],
          )
        ]);
  }
}