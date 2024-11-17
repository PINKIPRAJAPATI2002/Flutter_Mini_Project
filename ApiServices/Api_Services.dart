import 'package:dio/dio.dart';
import 'package:pinki/Tree/model/get_tree_model.dart';
import '../auth/model/register_Model.dart';



class ApiServices{
  final dio = Dio();
  var baseUrl = "https://www.sparkstoideas.com/LJ/api/";


  Future<RegisterModels> register (Name,SurName,Email,Password)async{
    final user_form =FormData();

    user_form.fields.add(MapEntry("Name",Name ));
    user_form.fields.add(MapEntry("SurName",SurName ));
    user_form.fields.add(MapEntry("Email",Email ));
    user_form.fields.add(MapEntry("Password",Password ));
    final value_user = await dio.post("${baseUrl}register",data: user_form);
    if(value_user.statusCode == 200){
      final result_user = RegisterModels.fromJson(value_user.data);
      return result_user;
    }else{
      throw 'Something went wrong';
    }
  }



  Future<GetTreeModel> getTree() async {
  final value_user = await dio.get("${baseUrl}get_tree_plant");
  if (value_user.statusCode == 200) {
  final result_user = GetTreeModel.fromJson(value_user.data);
  return result_user;
  } else {
  throw 'error found';
  }
  }
  }

