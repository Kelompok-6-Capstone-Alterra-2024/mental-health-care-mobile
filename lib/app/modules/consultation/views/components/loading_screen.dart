import 'package:flutter/material.dart';

class loadingScreen extends StatelessWidget {
  const loadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Item number  as title'),
              subtitle: Text('Subtitle here'),
              trailing: Icon(Icons.ac_unit),
            ),
          );
        });
  }
}
