import 'package:bluebirdlike_flutterapp/data/entity/bluebird.dart';
import 'package:bluebirdlike_flutterapp/ui/cubit/homepage_cubit.dart';
import 'package:bluebirdlike_flutterapp/ui/views/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    context.read<HpCubit>().LoadbluebirdList();
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
        child: BlocBuilder<HpCubit,List<BlueBird>>(
          builder: (context, snapshot){
            if(snapshot.isNotEmpty){
              return ListView.builder(
                  itemCount: snapshot.length,
                  itemBuilder: (context,i){
                    var mt = snapshot[i];
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
