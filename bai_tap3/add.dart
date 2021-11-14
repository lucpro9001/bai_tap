import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'data_bai3.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var data = context.watch<DataBai3>();
    var uuid = Uuid();
    String id = uuid.v1();
    MatHang m = MatHang(id);
    Item o = Item(m);
    return Scaffold(
      appBar: AppBar(
        title: Text('Them moi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formState,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Ten mat hang',
                ),
                validator: (value) => fieldEmty(value),
                onSaved: (newValue) => o.m.ten = newValue!,
              ),
              SizedBox(height: 10,),
              DropdownButtonFormField(
                  items: loaiMH.map((e) =>
                      DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,)
                  ).toList(),
                onChanged: (value) {
                  o.m.loai = value.toString();
                },
                decoration: InputDecoration(
                  labelText: 'Loai mat hang',
                ),
                validator: (value) => value == null ? 'Khong duoc de trong truong nay' : null,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'So luong',
                ),
                validator: (value) => isNumber(value),
                onSaved: (newValue) => o.sl = int.parse(newValue.toString()),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_formState.currentState!.validate()) {
            _formState.currentState!.save();
            data.add(o);
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.add)
      ),
    );
  }

  String? fieldEmty(String? value) {
    return value!.isEmpty  ? 'Khong duoc de trong truong nay' : null;
  }
  String? isNumber(String? value) {
    if(fieldEmty(value) != null) return fieldEmty(value);
    int t;
    try {
       t = int.parse(value!);
    } catch(e) {
      return 'Bat buoc la so > 0';
    }
    if(t <= 0) return 'so nguyen > 0';
    return null;
  }
}
