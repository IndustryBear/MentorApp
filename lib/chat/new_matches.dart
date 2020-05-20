import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const dummyData = [
  {
    "name": "Charles",
    "color": Colors.blue,
  },
  {
    "name": "Rebecca",
    "color": Colors.purple,
  },
  {
    "name": "Mike",
    "color": Colors.green,
  },
  {
    "name": "Hawk",
    "color": Colors.orange,
  },
  {
    "name": "Pat",
    "color": Colors.yellow,
  },
  {
    "name": "Maweenie",
    "color": Colors.red,
  },
  {
    "name": "Simp",
    "color": Colors.indigo,
  },
];

class NewMatches extends StatelessWidget {
  NewMatches({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "New Matches", 
          textAlign: TextAlign.left,
          style: GoogleFonts.muli(
            textStyle: TextStyle(
              color: Colors.black, 
              letterSpacing: .5, 
              fontSize: 18.0, 
              fontWeight: FontWeight.bold
            )
          )
        ),
        buildNewMatches(),
      ]
    );
  }
}

buildNewMatches() {
  List<Widget> newMatchesList = new List<Widget>();
  for (int i = 0; i < dummyData.length; i++) {
    newMatchesList.add(
      Container(
        width: 80.0,
        height: 80.0,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Container(
              width: 60.0, 
              height: 60.0, 
              decoration: BoxDecoration(
                color: dummyData[i]["color"], 
                shape: BoxShape.circle
              )
            ),
            Text(
              dummyData[i]["name"],
              style: GoogleFonts.muli(
                textStyle: TextStyle(
                  color: Colors.black, 
                  letterSpacing: .5, 
                  fontSize: 12.0, 
                )
              )
            )
          ]
        )
      ),
    );
  }

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: newMatchesList,
    )
  );
}