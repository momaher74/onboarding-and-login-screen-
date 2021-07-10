import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
class DioHelper {
  static Dio dio  ;
   static init(){
    dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type':'application/json'
        } ,
        baseUrl: "https://student.valuxapps.com/api/" ,
        receiveDataWhenStatusError: true ,
      )
    );
  }
  static Future<Response> getData( {@required String url , @required query  })async{
    return  await    dio.get(url , queryParameters:  query);
  }
 static Future postData({@required url , @required data , query })async{
 return await     dio.post(url , data:  data   , queryParameters: query ) ;

 }
}