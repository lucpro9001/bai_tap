import 'package:duong_tang_luc/bai_tap3/mat_hang.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'data_bai3.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final name = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var state = context.watch<DataBai3>();
    String loai = '';
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('Search'),
              pinned: true,
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: 'Ten mat hang', icon: Icon(Icons.laptop)),
              ),
              SizedBox(height: 10,),
              DropdownButtonFormField(
                items: loaiMH.map((e) =>
                    DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,)
                ).toList(),
                onChanged: (value) {
                  loai = value.toString();
                },
                decoration: InputDecoration(
                  labelText: 'Loai mat hang',
                  icon: Icon(Icons.list)
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    state.search(name.text, loai);
                  },
                  child: Text('Tim kiem'),
                ),
              ),
              Divider(),
              Container(
                height: 300,
                child: ListView.separated(
                  itemBuilder: (context, index) => ClickBar(state.res[index]),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.res.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
