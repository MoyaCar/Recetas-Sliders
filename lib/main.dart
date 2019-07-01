import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  ScrollController scrollController;
  double tamanoFuente;
  double valorDeOffset;
  double porcentSize;
  double porcentFont;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        print('OffsetValue: ${scrollController.offset.toDouble()}');
        valorDeOffset = scrollController.offset.toDouble();
        print('FinalOffsetVal: $valorDeOffset');
        porcentSize = (valorDeOffset * 100) / 360;
        print('Porcentual : $porcentSize');
        porcentFont = (porcentSize /100) + 1;
        print('Multiplicador de Fuente: $porcentFont');
        tamanoFuente =16 * porcentFont;
        print('Tamano de Fuente: $tamanoFuente');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            color: Colors.amber,
            width: 720,
            child: Center(
              child: Text(
                'MENU',
                style: TextStyle(fontSize: tamanoFuente),
              ),
            ),
          )
        ],
      ),
    );
  }
}
