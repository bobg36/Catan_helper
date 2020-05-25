import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HexPage extends StatefulWidget {
  static const String route = '/';
  @override
  _HexPageState createState() => _HexPageState();
}

class _HexPageState extends State<HexPage> {
  int treeCount = 0;
  int brickCount = 0;
  int sheepCount = 0;
  int wheatCount = 0;
  int oreCount = 0;
  String selectedRes = 'none';

  //buildDice and addResButton variables
  final TextStyle resourceNumTextstyle = TextStyle(fontSize: 20);
  final TextStyle settlementTextstyle = TextStyle(fontSize: 15);
  double listButtonMargin = 10;
  double listButtonPadding = 8;
  var treeColor = Colors.green[400];
  var brickColor = Colors.red[300];
  var sheepColor = Colors.green[300];
  var wheatColor = Colors.orange[300];
  var oreColor = Colors.grey[300];

  List<List<int>> treeList = [
    [0, 2]
  ];

  Row addMapResource(int rollValue, resColor, res, num) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: listButtonPadding, left: 0, right: 0),
          width: 70,
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: listButtonMargin),
            color: resColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('$rollValue', style: resourceNumTextstyle),
                Text('${treeList[0][num]}', style: settlementTextstyle),
              ],
            ),
            onPressed: () {
              setState(() {
                treeList[0][num]++;
                print(treeList[0][num]);
              });
            },
          ),
        ),
      ],
    );
  }

  Expanded buildDice(int rollValue) {
    //mapResource builder, add resource to list

    //dice builder
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(2),
            child: RaisedButton(
                child: Text('$rollValue',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 18),
                onPressed: () {
                  setState(() {
                    if (selectedRes == 'tree' && colTreeList.length <= 4) {
                      colTreeList
                          .add(addMapResource(rollValue, treeColor, 'tree', 1));
                    }
                    if (selectedRes == 'brick' && colBrickList.length <= 4) {
                      colBrickList.add(
                          addMapResource(rollValue, brickColor, 'brick', 0));
                    }
                    if (selectedRes == 'sheep' && colSheepList.length <= 4) {
                      colSheepList.add(
                          addMapResource(rollValue, sheepColor, 'sheep', 0));
                    }
                    if (selectedRes == 'wheat' && colWheatList.length <= 4) {
                      colWheatList.add(
                          addMapResource(rollValue, wheatColor, 'wheat', 0));
                    }
                    if (selectedRes == 'ore' && colOreList.length <= 4) {
                      colOreList
                          .add(addMapResource(rollValue, oreColor, 'ore', 0));
                    }
                  });
                })));
  }

  Column buildAllDice() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            buildDice(2),
            buildDice(3),
            buildDice(4),
            buildDice(5),
            buildDice(6),
          ],
        ),
        Row(
          children: <Widget>[
            buildDice(12),
            buildDice(11),
            buildDice(10),
            buildDice(9),
            buildDice(8),
          ],
        ),
      ],
    );
  }

  var selectorColorTree = Colors.grey[100];
  var selectorColorBrick = Colors.grey[100];
  var selectorColorSheep = Colors.grey[100];
  var selectorColorWheat = Colors.grey[100];
  var selectorColorOre = Colors.grey[100];

  Expanded buildResSelector(var selectorColor, String res) {
    const TextStyle resourceTextStyle = TextStyle(fontSize: 11);
    return Expanded(
        child: FlatButton(
            color: selectorColor,
            child: Text('$res', style: resourceTextStyle),
            onPressed: () {
              setState(() {
                selectorColor = Colors.green;
                if (res == 'tree') {
                  selectorColorTree = Colors.blue[200];
                } else {
                  selectorColorTree = Colors.grey[100];
                }
                if (res == 'brick') {
                  selectorColorBrick = Colors.blue[200];
                } else {
                  selectorColorBrick = Colors.grey[100];
                }

                if (res == 'sheep') {
                  selectorColorSheep = Colors.blue[200];
                } else {
                  selectorColorSheep = Colors.grey[100];
                }
                if (res == 'wheat') {
                  selectorColorWheat = Colors.blue[200];
                } else {
                  selectorColorWheat = Colors.grey[100];
                }
                if (res == 'ore') {
                  selectorColorOre = Colors.blue[200];
                } else {
                  selectorColorOre = Colors.grey[100];
                }

                selectedRes = res;
              });
            }));
  } //bu
cd
  Row buildResSelectors() {
    const TextStyle resourceTextStyle = TextStyle(fontSize: 11);
    return Row(
      children: <Widget>[
        buildResSelector(selectorColorTree, 'tree'),
        buildResSelector(selectorColorBrick, 'brick'),
        buildResSelector(selectorColorSheep, 'sheep'),
        buildResSelector(selectorColorWheat, 'wheat'),
        buildResSelector(selectorColorOre, 'ore'),
      ],
    );
  } //builds 1 resource button, helper

  RawMaterialButton buildResource(String img, int count) {
    return RawMaterialButton(
      constraints: BoxConstraints(),
      child: Image.asset('$img', fit: BoxFit.fitWidth, width: 80),
      onPressed: () {
        setState(() {
          if (img == 'images/tree_pic.png') {
            treeCount++;
          } else if ((img == 'images/brick_pic.png')) {
            brickCount++;
          } else if ((img == 'images/sheep_pic.png')) {
            sheepCount++;
          } else if ((img == 'images/wheat_pic.png')) {
            wheatCount++;
          } else if ((img == 'images/ore_pic.png')) {
            oreCount++;
          }
        });
      },
    );
  } //builds 1 resource, helper

  Expanded buildResourceButton(String count, String res) {
    const TextStyle resourceTextStyle = TextStyle(fontSize: 20);
    return Expanded(
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text('$count', style: resourceTextStyle),
            onPressed: () {
              setState(() {
                if (res == 'tree') {
                  treeCount--;
                } else if ((res == 'brick')) {
                  brickCount--;
                } else if ((res == 'sheep')) {
                  sheepCount--;
                } else if ((res == 'wheat')) {
                  wheatCount--;
                } else if ((res == 'ore')) {
                  oreCount--;
                }
              });
            }));
  } //builds 1 resource button, helper

  Column buildResources() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildResource('images/tree_pic.png', treeCount),
            buildResource('images/brick_pic.png', brickCount),
            buildResource('images/sheep_pic.png', sheepCount),
            buildResource('images/wheat_pic.png', wheatCount),
            buildResource('images/ore_pic.png', oreCount),
          ],
        ),
        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildResourceButton('$treeCount', 'tree'),
            buildResourceButton('$brickCount', 'brick'),
            buildResourceButton('$sheepCount', 'sheep'),
            buildResourceButton('$wheatCount', 'wheat'),
            buildResourceButton('$oreCount', 'ore'),
          ],
        ),
      ],
    );
  }

  List<Widget> colTreeList = <Widget>[
    SizedBox(width: 80),
  ];
  List<Widget> colBrickList = <Widget>[
    SizedBox(width: 80),
  ];
  List<Widget> colSheepList = <Widget>[
    SizedBox(width: 80),
  ];
  List<Widget> colWheatList = <Widget>[
    SizedBox(width: 80),
  ];
  List<Widget> colOreList = <Widget>[
    SizedBox(width: 80),
  ];

  Column buildTreeCol(String res) {
    return Column(
      children: colTreeList,
    );
  }

  Column buildBrickCol(String res) {
    return Column(
      children: colBrickList,
    );
  }

  Column buildSheepCol(String res) {
    return Column(
      children: colSheepList,
    );
  }

  Column buildWheatCol(String res) {
    return Column(
      children: colWheatList,
    );
  }

  Column buildOreCol(String res) {
    return Column(
      children: colOreList,
    );
  }

  int temp = 0;

  List<Widget> tempList = <Widget>[
    SizedBox(width: 80),
  ];

  Row buildMatrix() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        buildTreeCol('tree'),
        buildBrickCol('brick'),
        buildSheepCol('sheep'),
        buildWheatCol('wheat'),
        buildOreCol('ore'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              child: Text('selected resource: $selectedRes'),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  selectedRes = 'none';
                  selectorColorTree = Colors.grey[100];
                  selectorColorBrick = Colors.grey[100];
                  selectorColorSheep = Colors.grey[100];
                  selectorColorWheat = Colors.grey[100];
                  selectorColorOre = Colors.grey[100];
                });
              },
            ),
            buildAllDice(), //build all the dice at the top
            Expanded(child: SizedBox(height: 10)),
            buildMatrix(),
            buildResSelectors(),
            buildResources(),
          ],
        ),
      ),
    );
  }
}
