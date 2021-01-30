import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 110, 130),
            Color.fromARGB(255, 253, 101, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );
    return Stack(
      // allow overlap of widgets
      children: <Widget>[
        _buildBodyBack(), // background of tab
        CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Novidades"),
              centerTitle: true,
            ),
          ),
          FutureBuilder( // Realize a query and after that create a Widget
            future: http.get(""),
            builder: (context,snapshot) {
              if (!snapshot.hasData){
                return SliverToBoxAdapter( // Need a SliverToBoxAdapter because don't accept Circular Progress Indicator
                // We needed to do a Convertion
                  child: Container(
                    height: 200.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                );
              }
              else { 
                print(snapshot.data.documents.length);
                return SliverToBoxAdapter(
                  child: Container(
                    height: 200.0,
                    alignment: Alignment.center,
                    child: Container()
                  )
                );
              }
            }, 
          ),
        ]),
      ],
    );
  }
}
