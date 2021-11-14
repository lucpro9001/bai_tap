import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'add.dart';
import 'data_bai3.dart';
import 'edit.dart';
import 'search.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataBai3(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mat hang',
        home: MatHang(),
      ),
    );
  }
}

class MatHang extends StatelessWidget {
  const MatHang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<DataBai3>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Mat hang'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add(),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, i) => ClickBar(data.list[i]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: data.list.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Search(),
            )),
        child: Icon(Icons.search),
      ),
    );
  }
}

class ClickBar extends StatelessWidget {
  ClickBar(this.o, {Key? key}) : super(key: key);
  Item o;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Edit(o),
          )),
      child: Row(
        children: [
          Icon(Icons.laptop),
          Expanded(
            child: Column(
              children: [
                Text(o.m.ten),
                Text(o.m.loai),
              ],
            ),
          ),
          Text("So luong: ${o.sl}"),
        ],
      ),
    );
  }
}
