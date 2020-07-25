import 'package:flutter/material.dart';

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text("S"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
            title: Text("Sun Info Technologies",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
            subtitle: Text("www.suninfotechnologies.in",style: TextStyle(color: Colors.white,fontSize: 13)),
          ),
            ],
          ),
          
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.black,
          ),),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Invoice"),
            onTap: () => Navigator.pop(context),
          ),
          Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
          ListTile(
            leading: Icon(Icons.train),
            title: Text("Delivery"),
          )
        ],
      ),
    );
  }
}
