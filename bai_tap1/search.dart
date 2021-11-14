import 'package:duong_tang_luc/bai_tap3/data_bai3.dart';
import 'package:flutter/material.dart';

import 'Journals.dart';
import 'data_bai1.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final mood = TextEditingController();
  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var state = context.watch<DataBai1>();
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
                controller: date,
                decoration: InputDecoration(
                    labelText: 'Date', icon: Icon(Icons.date_range)),
              ),
              TextField(
                controller: mood,
                decoration: InputDecoration(
                    labelText: 'Mood', icon: Icon(Icons.emoji_emotions)),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    state.search(date.text, mood.text);
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
