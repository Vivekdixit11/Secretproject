import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secret_pr/usedmanytimes/glass.dart';

int total_shares = 50;
int per_sharing = 150;
int c = total_shares * per_sharing;

class refreal extends StatefulWidget {
  const refreal({super.key});

  @override
  State<refreal> createState() => _refrealState();
}

class _refrealState extends State<refreal> {
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
      backgroundColor: Color.fromARGB(221, 239, 219, 219),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: glass(
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 0, 20),
                  child: Column(
                    children: [
                      Text('Total number of shares'),
                      Text('Name: ${userData!['name']}'),
                      Text('Phone Number: ${userData!['phone_number']}'),
                      Text('Address: ${userData!['address']}'),
                    ],
                  ),
                ),
                100.0,
                390.0),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: glass(
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 0, 20),
                  child: Column(
                    children: [
                      Text('Earned by sharing'),
                      Text('$c'),
                    ],
                  ),
                ),
                100.0,
                390.0),
          ),
          Column(children: [
            Text(" refreal code is "),
            Text("CY!234"),
          ]),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("The refreeal you have done :-",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
