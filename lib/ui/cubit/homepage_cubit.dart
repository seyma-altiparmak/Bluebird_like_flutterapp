import 'package:bluebirdlike_flutterapp/data/entity/bluebird.dart';
import 'package:bluebirdlike_flutterapp/data/repos/apprepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HpCubit extends Cubit<List<BlueBird>>{
  HpCubit():super(<BlueBird>[]);

  var mrepo = BlueBirdDAO_Repository();

  Future<void> LoadbluebirdList() async{
    var list = await mrepo.LoadbluebirdList();
    emit(list);
  }
}