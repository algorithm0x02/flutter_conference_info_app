import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'API/detail_info.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Conference> _x = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('컨퍼런스 정보'),
      ),
      body: _buildBody0(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list();
  }
  Future<void> _list() async {
    _x = await getlist();
  }



  Widget _buildBody0() {

    return ListView(
      children: _x.map((info) {
        return InkWell(
          child: DetailUnderInfo(info), //ListList
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(info)),
            );
          },
        );
      }).toList(),
    );
  }

  Future<List<Conference>> getlist() async {

    final http.Response response = await http.get('https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json');
    if (response.statusCode == 200) { //정상
      final Iterable json = jsonDecode(response.body); // 디코드 필요
      return json.map((e) => Conference.fromJson(e)).toList();
    } else { // 비정상
      throw Exception('ERROR');
    }
  }
}


class DetailUnderInfo extends StatelessWidget {  // underinfo
  final Conference info;
  DetailUnderInfo(this.info);

  @override
  Widget build(BuildContext context) {
    return _buildItem(info);
  }
  Widget _buildItem(conference) {
    return ListTile(
      title: Text(conference.name),
      subtitle: Text(conference.location),
    );
  }
}
