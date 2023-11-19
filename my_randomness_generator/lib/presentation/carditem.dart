import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  late String title;
  late String route;
  late String image;

  CardItem({required this.title, required this.route, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, route);
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4,
          child: Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.indigo, width: 2.0),
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/$image'),
                    ),
                    Text(title, style: TextStyle(fontSize: 25, color: Colors.black), textAlign: TextAlign.center)
                  ],
                ),
              )
            ),
          )
        )
    );
  }
}
