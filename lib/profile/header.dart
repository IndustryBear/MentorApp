import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorApp/constants/profile_constants.dart';
 
class ProfileHeader extends StatelessWidget {  
  final String fullName;
  final Map<String, GlobalKey> keys;
  ProfileHeader({Key key, @required this.fullName, @required this.keys}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, 
      height: profileHeaderHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor, 
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0)
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            buildProfilePhoto(context),
            buildFullName(),
            buildPopUpMenuButton(context)
          ]
        )
      ),
    );
  }

  buildProfilePhoto(BuildContext context) {
    return Container(
      width: 60.0, 
      height: 60.0, 
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor, 
        shape: BoxShape.circle
      )
    );
  }

  buildFullName() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Text> [
          Text(
            fullName,
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                color: Colors.white, 
                letterSpacing: .5, 
                fontSize: 20.0, 
                fontWeight: FontWeight.bold
              ), 
            )
          )
        ]
      )
    );
  }

  buildPopUpMenuButton(BuildContext context){
    final IconData arrowDown = IconData(
      0xf3d0,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage
    );

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 30.0, maxHeight: 30.0),
      child: PopupMenuButton(
        padding: EdgeInsets.all(0.0),
        offset: Offset(MediaQuery.of(context).size.width * 0.375, 30),
        icon: Icon(
          arrowDown,
          color: Colors.white,
          size: 20.0,
        ),
        onSelected: (key) => Scrollable.ensureVisible(
            key.currentContext, 
            duration: Duration(milliseconds: 500)
        ),
        color: Theme.of(context).primaryColor,
        itemBuilder: (BuildContext menuContext) => <PopupMenuEntry<GlobalKey>>[
          buildPopUpItem(
            context, 
            keys["bioKey"], 
            sectionTitleSummary
          ),
          buildPopUpItem(
            context, 
            keys["educationKey"], 
            sectionTitleEducation
          ),
          buildPopUpItem(
            context, 
            keys["experienceKey"],
            sectionTitleExperience
          ),
          buildPopUpItem(
            context,
            keys["skillsKey"],
            sectionTitleSkills
          ),
          buildPopUpItem(
            context,
            keys["contactKey"],
            sectionTitleContact
          ),
        ],
      )
    );
  }

  buildPopUpItem(BuildContext context, GlobalKey key, String label) {
    return PopupMenuItem<GlobalKey>(
      value: key,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.muli(
            textStyle: TextStyle(
              color: Colors.white,
              letterSpacing: .5,
              height: 1.2,
              fontSize: 15.0,
              fontWeight: FontWeight.w700
            ),
          )
        )
      ),
    );
  }
}