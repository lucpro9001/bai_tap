import 'package:duong_tang_luc/bai_tap1/data_bai1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Edit extends StatelessWidget {
  Edit(this.o, {Key? key}) : super(key: key);
  Diary o;

  @override
  Widget build(BuildContext context) {
    var state = context.read<DataBai1>();
    final date = TextEditingController()..text = o.date;
    final mood = TextEditingController()..text = o.mood;
    final note = TextEditingController()..text = o.note;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Entry'),
      ),
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
              enabled: false,
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
                      String m = mood.text;
                      String n = note.text;
                      o.mood = m;
                      o.note = n;
                      state.edit(o);
                      Navigator.pop(context);
                    },
                    child: Text('Save')),
                TextButton(
                  onPressed: () {
                    if(_showAlertDialog(context, 'Ban muon xoa du lieu?')) {
                      state.remove(o);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Delete', style: TextStyle(color: Colors.red)),
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

  bool _showAlertDialog(BuildContext context, String message) {
    bool f = true;
    AlertDialog alertDialog = AlertDialog(
      title: Text('Xác nhận'),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              f = false;
            },
            child: Text('Cancle')),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
    return f;
  }
}
