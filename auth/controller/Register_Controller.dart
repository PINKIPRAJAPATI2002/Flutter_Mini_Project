

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinki/ApiServices/Api_Services.dart';
import '../model/register_Model.dart';


class RegisterController extends GetxController{
  RxBool isLoading = false.obs;
  var response = RegisterModels().obs;
  TextEditingController nameCTC=TextEditingController();
  TextEditingController sNameCTC=TextEditingController();
  TextEditingController emailCTC=TextEditingController();
  TextEditingController passCTC=TextEditingController();

  Future<void> registerCont()async{
    try{
      isLoading(true);
      final respo =await ApiServices().register(nameCTC.text, sNameCTC.text, emailCTC.text, passCTC.text);
      if(respo.responseCode=="1"){
        response = respo.obs;
        print("hhhhhhhhhhhhh${response.value.message}");
      }
    }catch (e){
      print("Register error $e");
    }
    finally{
      isLoading(false);

    }
  }
}