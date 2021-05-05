import 'package:flutter/material.dart';

class MuzayedeIncele extends StatelessWidget {
  int muzayede_id;
  MuzayedeIncele(int muzayede_id){
    this.muzayede_id = muzayede_id;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(muzayede_id.toString() + ". Muzayede Detayları"),
    );
  }

}