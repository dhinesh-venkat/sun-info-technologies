import 'package:flutter/material.dart';
import '../models/user.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Report extends StatefulWidget {
  final String link;

  Report(@required this.link);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {


  List<User> _userList = [];

  FetchUsers() async {
    var data = await http.get(widget.link);
    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(
          u['GRNNO'],
          u['DATE'],
          u['PTYNAME'],
          u['DYEDCNO'],
          u['DYEINGNAME'],
          u['PARTYDCNO'],
          u['PARTYDCROLL'],
          u['PARTYDCWEIGHT'],
          u['FABRIC'],
          u['COLOR'],
          u['DIA'],
          u['ROLLS'],
          u['TOTKGS']);
      print(user.date);
      users.add(user);
    }
    print(users.length);
    print(users);

    this.setState(() {
      _userList = users;
    });
  }

  @override
  void initState() {
    FetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: [
              DataColumn(label: Text("GrNo")),
              DataColumn(label: Text("Rc-Date")),
              DataColumn(label: Text("Customer")),
              DataColumn(label: Text("Roll")),
              DataColumn(label: Text("Weight")),
            ],
            rows: _userList
                .map((val) => DataRow(cells: [
                      DataCell(Text(val.grnno)),
                      DataCell(
                        Text(val.date),
                      ),
                      DataCell(
                        Text(val.ptyname),
                      ),
                      DataCell(Text(val.rolls)),
                      DataCell(
                        Text(val.totkgs),
                      ),
                    ]))
                .toList()),
      ),
    );
  }
}
