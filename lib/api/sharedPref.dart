import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {
 static SharedPreferences sharedPref  ;
  init()async{
    sharedPref = await SharedPreferences.getInstance() ;
  }

 static Future<bool> setData({@required String key , @required value ,})async
{

    if (key is String){return await sharedPref.setString(key, value) ;}
    if (key is bool){return await   sharedPref.setBool(key, value) ;}
    if (key is int){return await    sharedPref.setInt(key, value) ;}
    return await sharedPref.setDouble(key, value) ;
}

 static dynamic getData({@required key }){

    return sharedPref.get(key);
}
}
