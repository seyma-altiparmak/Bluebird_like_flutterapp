import 'package:bluebirdlike_flutterapp/data/entity/bluebird.dart';
import 'package:bluebirdlike_flutterapp/ui/views/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<BlueBird>> LoadbluebirdList() async{
    var blueBirdlist = <BlueBird>[];

    var t1 = BlueBird(id: 1, picture: "picture2.png", username: "symaltiparmak", description: "I would like to share my happiness ");
    var t2 = BlueBird(id: 2, picture: "picture1.png", username: "maaminiz", description: "🚀 Teknolojinin 1980'den 2024'e evrimi muazzam!");

    blueBirdlist.add(t1);
    blueBirdlist.add(t2);

    return blueBirdlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.directions_bike_rounded,color: Colors.blue),
        const Text(" BlueBird",style: TextStyle(color: Colors.blue),),
      ],), backgroundColor: Colors.white,),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: FutureBuilder<List<BlueBird>>(
          future: LoadbluebirdList(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var t = snapshot.data;
              return ListView.builder(
                  itemCount: t!.length,
                  itemBuilder: (context,i){
                    var mt = t[i];
                    return GestureDetector(
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(blueBird: mt,)));
                        },
                      child: Container(
                        child: Card(
                          color: Color.fromRGBO(218, 243, 247, 200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                  Image.asset("pictures/${mt.picture}",height: 35,width: 35,),
                                    Text("@${mt.username}",style: TextStyle(color: Colors.black38,),)
                                                            ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text("${mt.description}."),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(onPressed: (){
                                      print("You liked post ${mt.username}.");
                                    }, child: Icon(Icons.heart_broken,color: Colors.blue,)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(onPressed: (){
                                      print("You interested post ${mt.username}.");
                                    }, child: Icon(Icons.comment,color: Colors.blue,)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(onPressed: (){
                                      print("You reported post ${mt.username}.");
                                    }, child: Icon(Icons.report,color: Colors.blue,)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  );
            }
            else{
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
