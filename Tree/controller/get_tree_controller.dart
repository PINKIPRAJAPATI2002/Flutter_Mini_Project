
import 'package:get/get.dart';
import 'package:pinki/ApiServices/Api_Services.dart';
import 'package:pinki/Tree/model/get_tree_model.dart';


class GetTreeController extends GetxController {
  RxBool isLoding = false.obs;
  var response =GetTreeModel().obs;

  Future<void>getTreeCont()async{
    try{
      isLoding(true);
      final respo=await ApiServices().getTree();
      if(respo.responseCode=="1"){
        response =respo.obs;
        print("${response.value.message}");
      }

    }
    catch(e)
    {
      print("Get Tree error $e");
    }
    finally{
      isLoding(false);
    }
  }

}
