import 'package:flutter/material.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DrawerHeader(
            child: Center(
                child: Text(
              'My ToDo',
              style: TextStyle(fontSize: 20),
            )),
            decoration: BoxDecoration(
              color: Colors.brown[200],
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Customize ToDo'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Customize report'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('Backup data'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('App guide'),
            onTap: () {

            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    height: 35,
                    color: Colors.grey,
                    thickness: 0.6,
                  ),
                  Text(
                    'Version 1.0',
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),

      //   ],
      // ),
    );
  }
}
