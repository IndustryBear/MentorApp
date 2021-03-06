import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../../constants/constants.dart';
import '../login.dart';
import './mentee_sign_up.dart';
import './mentor_sign_up.dart';

class SignUpFunnel extends StatelessWidget {
  
  SignUpFunnel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Replace with primary when center ano image is updated
      backgroundColor: Color(0xFF0B0B33),
      body: Container(
        child: Stack(
          children: [ 
            buildHeader(context), 
            buildCenterAno(context), 
            buildFooter(context)
          ]
        )
      )
    );
  }

  getNextPage(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login())
    );
  }

  GlobalHeader buildHeader(context) {
    return GlobalHeader(
        actionText: signInAction, 
        onActionTap: () => getNextPage(context), 
        isLight: true
      );
  }

  Widget buildCenterAno(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/sign_up/ano_hands_up.png', 
          height: ScreenSize.height * 0.11
        ),
        Container(height: 1.5, color: Colors.white)
      ]
    );
  }

  // TODO: Make a common global_footer widget to maintain consistent padding
  Widget buildFooter(context) {
    var verticalPadding = ScreenSize.height * 0.08;
    var horizontalPadding = ScreenSize.width * 0.21;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, 
        vertical: verticalPadding
      ), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildFunnelText(), 
          buildCircleIndicators(), 
          ...buildFunnelButtons(context)
        ]
      )
    );
  }

  Widget buildFunnelText() {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.0),
      child: FormatText(
        text: funnelQuestionText,
        textColor: Colors.white,
        textAlign: TextAlign.center,
        fontSize: 14.0,
        fontWeight: FontWeight.w500
      )
    );
  }
  
  // TODO: Make a common circle_indicators widget is created
  Row buildCircleIndicators() {
    var circleDimensions = ScreenSize.width * 0.01;
    var circles = <Widget>[];
    for (var i = 0; i < 3; i++) {
      circles.add(
        Container(
          width: circleDimensions, 
          height: circleDimensions, 
          margin: EdgeInsets.all(ScreenSize.width * 0.02), 
          decoration: BoxDecoration(
            color: i == 0 ? 
              ThemeColors.accent : Colors.grey, 
            shape: BoxShape.circle
          )
        )
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: circles
    ); 

  }
  
  List<PrimaryButton> buildFunnelButtons(context) {
    var isLight = true;
    return [
      PrimaryButton(
        text: isMentorAction,
        isLight: isLight, 
        onPressed: () => Navigator.pushReplacement(
          context, MaterialPageRoute(
            builder: (context) => MentorSignUp()
          )
        )
      ), 
      PrimaryButton(
        text: isMenteeAction,
        isLight: isLight, 
        onPressed: () => Navigator.pushReplacement(
          context, MaterialPageRoute(
            builder: (context) => MenteeSignUp()
          )
        )
      ), 
    ];
  }
  
}
