import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mezat_app/entities/muzayede.dart';
import 'package:mezat_app/main.dart';
import 'package:mezat_app/drawer_menu.dart';
import 'package:mezat_app/models/page_model.dart';
import 'package:mezat_app/services/muzayede_service.dart';

import 'canli_muzayede.dart';

class Home extends StatelessWidget {
  BuildContext context;
  List<Muzayede> muzayedeList = new List<Muzayede>();
  DrawerMenu _drawer = MyApp.getDrawerState();
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return buildGridView();
  }


  buildGridView(){
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
      children: buildGridViewItems(),
    );
  }

  buildGridViewItems(){
    List<Widget> items = List();
    for(int i=0;i<muzayedeList.length;i++){
      items.add(
        buildCard(muzayedeList[i])
      );
    }
    return items;
  }

  getallMuzayede(){
    MuzayedeService.getall().then((value) => {
      _drawer.drawerMenuState.setState(() {
        Iterable list = json.decode(value.body);
        muzayedeList = list.map((model) => Muzayede.fromJson(model)).toList();
      })
    });
  }

  buildCard(Muzayede muzayede){
    return GestureDetector(
      onTap: ()=>{
            _drawer.drawerMenuState.onSelectItem(PageModel(CanliMuzayede(muzayede.muzayedeId),"Canlı Müzayede"))
      },
      child: Card(
        color: Colors.blueGrey,
        elevation: 5.0,
        child: Center(
          child: Text(
            muzayede.muzayedeAdi,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25
            ),
          ),
        ),
      ),
    );
  }
}