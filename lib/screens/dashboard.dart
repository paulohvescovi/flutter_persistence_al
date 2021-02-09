
import 'package:flutter/material.dart';
import 'package:flutter_persistence_al/screens/contatos_list.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/hibernate.jpg"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContatosList(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 150,
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        "Pessoas",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}