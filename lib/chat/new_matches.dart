import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../constants/chat_constants.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../services/user_service.dart';
import './chat_messenger.dart';

class NewMatches extends StatefulWidget {
  final List<Match> newMatchesList;
  const NewMatches({Key key, @required this.newMatchesList}): super(key: key);

  @override
  _NewMatchesState createState() => _NewMatchesState();
}

class _NewMatchesState extends State<NewMatches> {

  Store<AppState> store;
  String uid;

  bool isMatchesLoaded;

  final List<User> _matchesPeerList = [];

  @override
  void initState() {
    super.initState();
    isMatchesLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    store = StoreProvider.of<AppState>(context);
    uid = userIdSelector(store);

    if (!isMatchesLoaded) {
      loadMatches(widget.newMatchesList, uid);
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            chatNewMatchesTitle, 
            textAlign: TextAlign.left,
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                color: Colors.black, 
                letterSpacing: .5, 
                fontSize: 18.0, 
                fontWeight: FontWeight.bold
              )
            )
          )
        ),
        isMatchesLoaded ?
          buildNewMatches(
            context, 
            _matchesPeerList, 
            widget.newMatchesList, 
            uid
          ) :
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).accentColor
            )
          )
      ]
    );
  }

  loadMatches(newMatchesList, uid) async {
    for (var match in newMatchesList) {
      if (match.pair[0] == uid) {
        var user = await getUser(match.pair[1]);
        _matchesPeerList.add(User.fromJson(user));
      } else {
        var user = await getUser(match.pair[0]);
        _matchesPeerList.add(User.fromJson(user));
      }
    }

    setState(() {
      isMatchesLoaded = true;
    });
  }
}

buildNewMatches(context, matchesPeerList, newMatchesList, id) {
  var newMatchesWidgetList = <Widget>[];
    for (var i = 0; i < matchesPeerList.length; i++) {
    newMatchesWidgetList.add(
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => 
              ChatMessenger(
                recipient: matchesPeerList[i].fullName, 
                peerId: matchesPeerList[i].id, 
                id: id, 
                groupChatId: newMatchesList[i].matchId,
              )
            )
          );
        },
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Container(
                width: 60.0, 
                height: 60.0, 
                decoration: BoxDecoration(
                  color: Colors.black, 
                  shape: BoxShape.circle
                )
              ),
              Flexible(
                child: Text(
                  matchesPeerList[i].fullName,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.muli(
                    textStyle: TextStyle(
                      color: Colors.black, 
                      letterSpacing: .5, 
                      fontSize: 12.0, 
                      fontWeight: FontWeight.w600
                    )
                  )
                )
              )
            ]
          )
        )
      ),
    );
  }

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: newMatchesWidgetList,
    )
  );
}