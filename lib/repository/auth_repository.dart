import 'package:demo/data/network/BaseApiServices.dart';
import 'package:demo/data/network/NetworkApiService.dart';
import 'package:demo/res/app_url.dart';
import 'package:http/http.dart';

class AuthRepository  {

  BaseApiServices _apiServices = NetworkApiService() ;


  Future<dynamic> loginApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response ;

    }catch(e){
      throw e ;
    }
  }

  Future<dynamic> signUpApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response ;


    }catch(e){
      throw e ;
    }
  }

}