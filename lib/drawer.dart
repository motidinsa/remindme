import 'package:flutter/material.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
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
            leading: Icon(Icons.color_lens),
            title: Text('Theme'),
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
              // Update the state of the app.
              // ...
            },
          ),
          Divider(
            height: 35,
            thickness: 2,
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'About Dev.',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Contacts',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Moti Dinsa',
                        style: TextStyle(fontSize: 16),
                      )),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'dinsamoti@gmail.com',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '@MotiDinsa',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 35,
            thickness: 2,
          ),
          Text(
            'Version 1.0',
            style: TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
