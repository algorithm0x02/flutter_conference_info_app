import 'package:conference_info_app/API/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:conference_info_app/extensions.dart';

class DetailPage extends StatelessWidget {
  final Conference info;

//DetailInfo
  DetailPage(this.info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  info.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  info.location,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Text(DateFormat('EEEE, d MMM, yyyy').format(DateTime.parse(info.end))),
                Text('${info.start.strToDate('yMMMd')} -  ${info.end.strToDate('yMMMd')}'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text(
                  '>>>Website<<<',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  _launchURL(info.link);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL(link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'ERROR';
    }
  }
}
