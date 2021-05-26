import 'package:flutter/material.dart';
import 'package:stream_mvvm_flutter/controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: StreamBuilder<List<int>>(
                  stream: viewModel.streamLista.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasData) {
                      var array = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: array.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: 100,
                              height: 30,
                              child: Center(child: Text('$index')),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                            ),
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
            Container(
              height: 50,
              color: Colors.black,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    viewModel.loadLista();
                  });
                },
                child: Text('Load'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
