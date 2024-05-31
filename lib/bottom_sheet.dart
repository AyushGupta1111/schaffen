import 'package:flutter/material.dart';
class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Add Member'),
            onTap: () {
              // Add member logic
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.group_add),
            title: Text('Add Group'),
            onTap: () {
              // Add group logic
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Invite'),
            onTap: () {
              // Invite logic
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}