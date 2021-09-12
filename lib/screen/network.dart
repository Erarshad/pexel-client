import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rajsthan_studio/center/theme.dart';


class network extends StatefulWidget {
  @override
  _networkState createState() => _networkState();
}

class _networkState extends State<network> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        Container(child: 
         Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
       
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Image.asset(
                      "assets/no_internet.png",
                      height: 225.0,
                    ))
              ],
            ),
        Text("No Internet Connection",
        style: TextStyle(color: theme.base,
       
        ),
        ),
          
           
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Container(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Color.fromRGBO(241, 94, 90, 1.0)),
                  ),
                  primary: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  child: Text(
                     "Recheck",
                    style: TextStyle(color: theme.base),
                  ),
                ),
                onPressed: () {
                   Phoenix.rebirth(context);

                }),
          ),
        )
      ],
    )));
  }
}
