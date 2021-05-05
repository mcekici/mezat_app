
import 'package:flutter/material.dart';
import 'package:mezat_app/screens/home.dart';
import 'package:mezat_app/screens/muzayede_kurallari.dart';
import 'package:mezat_app/screens/muzayedelerim.dart';
import 'package:mezat_app/screens/pey_verdiklerim.dart';
import 'package:mezat_app/screens/profile.dart';
import 'package:mezat_app/screens/siparislerim.dart';
import 'package:mezat_app/screens/urunlerim.dart';

import 'models/page_model.dart';

// ignore: must_be_immutable
class DrawerMenu extends StatefulWidget {
  DrawerMenuState drawerMenuState;
  @override
  State<StatefulWidget> createState() {
    drawerMenuState = new DrawerMenuState();
    return drawerMenuState;
  }
}


class DrawerMenuState extends State<DrawerMenu> {
  PageModel selected;
  List<PageModel> pageStack;

  DrawerMenuState (){
    pageStack = <PageModel>[];
    selected = PageModel(Home(), "Anasayfa");
    pageStack.add(selected);
  }

  changeState(PageModel model){
    setState(() {
      selected = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (_goBack()),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(selected.title),
        ),
        drawer: getDrawer(),
        body: selected.page,
      ),
    );
  }


  Future<bool> _goBack() async {
    if(selected.title!="Anasayfa"){
      changeState(pageStack.removeLast());
      return false;
    }
    else{
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Dikkat!'),
          content: new Text('Uygulama kapatılsın mı?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('Hayır'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Evet'),
            ),
          ],
        ),
      )) ?? false;
    }
  }

  getDrawer() {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Mehmet Çekici"), accountEmail: new Text("mehmetcekici427@gmail.com"),currentAccountPicture: CircleAvatar(
            backgroundColor:Colors.white,
            child: Text(
              "M",
              style: TextStyle(fontSize: 40.0),
            ),
          ),),
          getMenuItems(),
        ],
      ),
    );
  }

  getMenuItems(){
    return new Column(
        children: [
          new ListTile(
            leading: new Icon(Icons.home_outlined),
            title: new Text("Anasayfa"),
            selected: selected.title=="Anasayfa",
            onTap: () => onSelectItem(PageModel(Home(),"Anasayfa")),
          ),
          new ListTile(
            leading: new Icon(Icons.person_outline),
            title: new Text("Hesabım"),
            selected: selected.title=="Hesabım",
            onTap: () => onSelectItem(PageModel(Profile(),"Hesabım")),
          ),
          new ListTile(
            leading: new Icon(Icons.shopping_cart_outlined),
            title: new Text("Siparişlerim"),
            selected: selected.title=="Siparişlerim",
            onTap: () => onSelectItem(PageModel(Siparislerim(),"Siparişlerim")),
          ),
          new ListTile(
            leading: new Icon(Icons.photo_album_outlined),
            title: new Text("Müzayedelerim"),
            selected: selected.title=="Müzayedelerim",
            onTap: () => onSelectItem(PageModel(Muzayedelerim(),"Müzayedelerim")),
          ),
          new ListTile(
            leading: new Icon(Icons.photo_outlined),
            title: new Text("Ürünlerim"),
            selected: selected.title=="Ürünlerim",
            onTap: () => onSelectItem(PageModel(Urunlerim(),"Ürünlerim")),
          ),
          new ListTile(
            leading: new Icon(Icons.assignment_turned_in_outlined),
            title: new Text("Pey Verdiklerim"),
            selected: selected.title=="Pey Verdiklerim",
            onTap: () => onSelectItem(PageModel(PeyVerdiklerim(),"Pey Verdiklerim")),
          ),
          new ListTile(
            leading: new Icon(Icons.assignment_late_outlined),
            title: new Text("Müzayede Kuralları"),
            selected: selected.title=="Müzayede Kuralları",
            onTap: () => onSelectItem(PageModel(MuzayedeKurallari(),"Müzayede Kuralları")),
          ),
          new ListTile(
            leading: new Icon(Icons.exit_to_app_outlined),
            title: new Text("Çıkış Yap"),
            selected: selected.title=="Anasayfa",
            onTap: () => onSelectItem(PageModel(Home(),"Anasayfa")),
          ),
        ]
    );
  }

  onSelectItem(PageModel pageModel) {
    if(Navigator.of(context).canPop()) Navigator.of(context).pop();
    pageStack.add(selected);
    changeState(pageModel);
  }
}

/////////////////   ESKİ /////////////////////////////////
/*
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mezat_app/models/drawer_item.dart';
import 'package:mezat_app/screens/canli_muzayede.dart';
import 'package:mezat_app/screens/home.dart';
import 'package:mezat_app/screens/profile.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenuState state;
  final drawerItems = [
    new DrawerItem("Anasayfa", Icons.home_outlined,true),
    new DrawerItem("Hesabım", Icons.person_outline,true),
    new DrawerItem("Siparişlerim", Icons.shopping_cart_outlined,true),
    new DrawerItem("Müzayedelerim", Icons.photo_album_outlined,true),
    new DrawerItem("Ürünlerim", Icons.photo_outlined,true),
    new DrawerItem("Pey Verdiklerim", Icons.assignment_turned_in_outlined,true),
    new DrawerItem("Müzayede Kuralları", Icons.assignment_late_outlined,true),
    new DrawerItem("Çıkış Yap", Icons.exit_to_app_outlined,true),
    new DrawerItem("Canli Müzayede", null, true)
  ];


  @override
  State<StatefulWidget> createState() {
    state = new DrawerMenuState();
    state._selectedPage = Home();
    state._selectedPageTitle = "Anasayfa";
    return state;
  }
}

 class DrawerMenuState extends State<DrawerMenu> {
  int _index = 0;
  Widget _selectedPage;
  String _selectedPageTitle = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_selectedPageTitle),
      ),
      drawer: getDrawer(),
      body: _selectedPage,
    );
  }

  settState(Widget page,String title){
    setState(() {
      _selectedPage = page;
      _selectedPageTitle = title;
    });
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Home();
      case 1:
        return new Profile();
    }
  }

  getDrawer() {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Mehmet Çekici"), accountEmail: new Text("mehmetcekici427@gmail.com"),currentAccountPicture: CircleAvatar(
            backgroundColor:Colors.white,
            child: Text(
              "M",
              style: TextStyle(fontSize: 40.0),
            ),
          ),),
          getMenuItems(),
        ],
      ),
    );
  }

  getMenuItems(){
    List<Widget> menuItems = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      if(d.isMenuItem){
        menuItems.add(
            new ListTile(
              leading: new Icon(d.icon),
              title: new Text(d.title),
              selected: i == _index,
              onTap: () => _onSelectItem(i),
            )
        );
      }
    }
    return new Column(children: menuItems);
  }

  _onSelectItem(int index) {
    setState(() => {
      _selectedPage = _getDrawerItemWidget(_index)
    });
    Navigator.of(context).pop(); // close the drawer
  }
}
 */