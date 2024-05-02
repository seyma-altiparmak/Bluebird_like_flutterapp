import 'package:bluebirdlike_flutterapp/data/entity/bluebird.dart';

class BlueBirdDAO_Repository{
  Future<List<BlueBird>> LoadbluebirdList() async{
    var blueBirdlist = <BlueBird>[];

    var t1 = BlueBird(id: 1, picture: "picture2.png", username: "symaltiparmak", description: "I would like to share my happiness ");
    var t2 = BlueBird(id: 2, picture: "picture1.png", username: "maaminiz", description: "🚀 Teknolojinin 1980'den 2024'e evrimi muazzam!");

    blueBirdlist.add(t1);
    blueBirdlist.add(t2);

    return blueBirdlist;
  }
}