import 'package:flutter/material.dart';
import './header.dart';
import './sections/sections.dart';

// TODO: Replace with real data
Map dummyData = {
  "fullName": "John Doe",
  "contact": {
    "emailAddress": "johndoe@ualberta.ca",
    "phoneNumber": "1234567890",
    "website": "http://johndoe.com"
  },
  "summary": """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
  "schools": [
    { "school": "University of Alberta",
      "program": "Bachelor of Science (BSc) Specialization, Computing Science",
      "startYear": "2015",
      "endYear": "2020"
    }
  ],
  "jobs": [
    {
      "jobTitle": "Software Developer Intern",
      "company": "Intuit",
      "startDate": "January 2020",
      "endDate": "Present"
    }, 
    {
      "jobTitle": "Research Assistant",
      "company": "University of Alberta",
      "startDate": "May 2019",
      "endDate": "December 2020"
    }
  ],
  "skills": [
    {
      "skill": "Front-end development",
      "rating": 9.0
    },
    {
      "skill": "Back-end development",
      "rating": 6.0
    },
    {
      "skill": "React",
      "rating": 8.0
    },
    {
      "skill": "Java",
      "rating": 7.0
    },
    {
      "skill": "C#",
      "rating": 5.0
    }
  ]
};
 
class UserProfile extends StatelessWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
  final Map<String, GlobalKey> keys = {
    "bioKey": GlobalKey(),
    "educationKey": GlobalKey(),
    "experienceKey": GlobalKey(),
    "skillsKey": GlobalKey(),
    "contactKey": GlobalKey()
  };

    return Stack(
      children: <Widget>[
        //TODO: Add background
        /* Image.asset(
          "images/DefaultBg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ), */
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: const EdgeInsets.all(0),
            child: Center(
              child: Column(
                children: buildUserProfileView(keys)
              )
            )
          )
        )
      ]
    );
  }

  buildUserProfileView(Map<String, GlobalKey> keys) {
    return (
      <Widget>[
        ProfileHeader(
          fullName: dummyData["fullName"], 
          keys: keys
        ),
        ProfileSections(
          data: dummyData, 
          keys: keys
        )
      ]
    );
  }

}
