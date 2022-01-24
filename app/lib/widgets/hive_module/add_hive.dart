import 'package:flutter/material.dart';

class AddHive extends StatefulWidget {
  final Function callbackFn;
  
  
  const AddHive({ Key? key, required this.callbackFn }) : super(key: key);

  @override
  
  
  _AddHiveState createState() => _AddHiveState();
}



class _AddHiveState extends State<AddHive> {
  final hiveIdController = TextEditingController();
  final hiveNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: hiveIdController,
            decoration: const InputDecoration(labelText: 'Nectarfy serial number'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: hiveNameController,
            decoration: const InputDecoration(labelText: 'Hive name'),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {}, 
              child: const Text('Register Nectarfy hive')
            )
          ),
      ],)
    );
  }
}