import 'package:bluebirdlike_flutterapp/data/entity/bluebird.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  BlueBird blueBird;

  DetailsPage({required this.blueBird});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.directions_bike_rounded,color: Colors.blue),
          const Text(" BlueBird",style: TextStyle(color: Colors.blue),),
        ],), backgroundColor: Colors.white,),
    body: Card(
      child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("pictures/${widget.blueBird.picture}",height: 200,width: 200,),
          ],
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${widget.blueBird.username}",
                style: TextStyle(fontSize: 50),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${widget.blueBird.description}",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  print("you added a friend ${widget.blueBird.username}");
                }, child: const Icon(Icons.add, color: Colors.blue,))
              ],
            ),
          ),
        ),
      ],
    ),
    ),
    );
  }
}
