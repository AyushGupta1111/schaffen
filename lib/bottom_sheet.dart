import 'package:flutter/material.dart';
class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Image.asset("asset/images/invite.png",width: 25,),
            title: const Text('Invite'),
            onTap: () {
              // Invite logic
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:const  Icon(Icons.person_add),
            title:const  Text('Add Member'),
            onTap: () {
              // Add member logic
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:Image.asset("asset/images/group.png",width: 25,),
            title:const  Text('Add Group'),
            onTap: () {
              // Add group logic
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}