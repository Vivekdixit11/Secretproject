import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secret_pr/allshares/allshares.dart';

class company_details extends StatelessWidget {
  const company_details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 229, 229),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                width: 400,
                child: UserDataDisplay(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Text(
                    "All Things Finance, is Right here. ✨",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Build For a Growing India.📈",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: Color.fromARGB(
                          255, 3, 252, 119), // Text Color (Foreground color)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const sahres()),
                      );
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Center(
                  child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.timestamp(),
                lastDate: DateTime(9999),
                onDateChanged: (value) => Null,
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class UserDataDisplay extends StatefulWidget {
  @override
  _UserDataDisplayState createState() => _UserDataDisplayState();
}

class _UserDataDisplayState extends State<UserDataDisplay> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget is first initialized
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      Map<String, dynamic>? fetchedUserData = await fetchUserDataFromFirebase();
      setState(() {
        userData = fetchedUserData;
      });
    } catch (e) {
      // Handle errors during data retrieval
      print('Error fetching user data: $e');
    }
  }

  Future<Map<String, dynamic>?> fetchUserDataFromFirebase() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    if (userSnapshot.exists) {
      return userSnapshot.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: userData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${userData!['name']}'),
                  // Text('Phone Number: ${userData!['phone_number']}'),
                  // Text('Address: ${userData!['address']}'),
                  // Add other fields as needed
                ],
              )
            : CircularProgressIndicator(), // Display a loading indicator while data is being fetched
      ),
    );
  }
}
