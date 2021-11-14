import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'data_bai1.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);
  final date = TextEditingController();
  final mood = TextEditingController();
  final note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var state = context.read<DataBai1>();
    return Scaffold(
      appBar: AppBar(title: Text('Add Entry'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: date,
              decoration: InputDecoration(
                icon: Icon(Icons.date_range),
                labelText: 'Date',
              ),
            ),
            TextField(
              controller: mood,
              decoration: InputDecoration(
                icon: Icon(Icons.emoji_emotions),
                labelText: 'Mood',
              ),
            ),
            TextField(
              controller: note,
              decoration: InputDecoration(
                icon: Icon(Icons.book),
                labelText: 'Note',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      String d = date.text;
                      String m = mood.text;
                      String n = note.text;
                      // generate unique id
                      var uuid = Uuid();
                      String id = uuid.v1();
                      Diary o = Diary(id, d, m, n);
                      state.add(o);
                      Navigator.pop(context);
                    },
                    child: Text('Save')
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancle'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
