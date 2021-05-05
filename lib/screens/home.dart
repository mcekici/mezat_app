import 'package:flutter/material.dart';
import 'package:mezat_app/main.dart';
import 'package:mezat_app/drawer_menu.dart';
import 'package:mezat_app/models/page_model.dart';

import 'canli_muzayede.dart';

class Home extends StatelessWidget {
  BuildContext context;
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
    for(int i=0;i<21;i++){
      items.add(
        buildCard(i)
      );
    }
    return items;
  }

  buildCard(int i){
    return GestureDetector(
      onTap: ()=>{
            _drawer.drawerMenuState.onSelectItem(PageModel(CanliMuzayede(i),"Canlı Müzayede"))
      },
      child: Card(
        color: Colors.blueGrey,
        elevation: 5.0,
        child: Center(
          child: Text(
            "Muzayede " + i.toString(),
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