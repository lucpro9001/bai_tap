import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'add.dart';
import 'data_bai1.dart';
import 'edit.dart';
import 'search.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataBai1(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Journals',
          home: Journals(),
        ),
    );
  }
}


class Journals extends StatelessWidget {
  const Journals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.watch<DataBai1>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Journals'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),)),
              icon: Icon(Icons.search)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) => ClickBar(state.list[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: state.list.length
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Add(),)),
        child: Icon(Icons.add),
      ),
    );
  }
}

class ClickBar extends StatelessWidget {
  ClickBar(this.o, {Key? key}) : super(key: key);
  Diary o;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(o),)),
      child: Row(
        children: [
          Text("7, Mon"),
          Expanded(
            child: Column(
              children: [
                Text(o.date),
                Text(o.mood),
                Text(o.note)
              ],
            ),
          )
        ],
      ),
    );
  }
}



