import 'package:flutter/material.dart';

import 'package:secret_pr/payment/payment.dart';
import 'package:secret_pr/usedmanytimes/glass.dart';

int total_balance = 0;
int invested = 0;
int today_income = 0;
int withdrawl = 0;

class user_details extends StatelessWidget {
  const user_details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 216, 252),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                glass(
                    Padding(
                      padding: const EdgeInsets.all(55.0),
                      child: Column(
                        children: [
                          Text("Total Balance"),
                          Text("$total_balance"),
                        ],
                      ),
                    ),
                    150.0,
                    360.0),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: glass(
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 35, 0, 20),
                            child: Column(
                              children: [
                                Text("Invested"),
                                Text("$invested"),
                              ],
                            ),
                          ),
                          100.0,
                          150.0),
                    ),
                    glass(
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 35, 0, 20),
                          child: Column(
                            children: [
                              Text("Today's income"),
                              Text("$today_income"),
                            ],
                          ),
                        ),
                        100.0,
                        150.0),
                  ],
                ),
                glass(
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 35, 0, 20),
                      child: Column(
                        children: [
                          Text("Withdrawl"),
                          Text("$withdrawl"),
                        ],
                      ),
                    ),
                    100.0,
                    390.0),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                        child: Text(
                          "add money",
                          style: TextStyle(
                              color: Color.fromARGB(255, 252, 253, 253)),
                        ),
                        style: ButtonStyle(
                            splashFactory: InkSparkle.splashFactory),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Withdraw",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        style: ButtonStyle(
                            splashFactory: InkSparkle.splashFactory),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
