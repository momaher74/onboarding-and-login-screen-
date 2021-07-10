import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/api/Dio.dart';
import 'package:shopapp/api/end%20point.dart';
import 'package:shopapp/login%20cubit/loginstates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit():super(InitState());
  static LoginCubit get(context)=>BlocProvider.of(context);
void userLogin({@required email , @required password }){
  emit(LoadingState());
  DioHelper.postData(url:LOGIN, data: {'email':email , 'password':password ,}).then((value) {
    emit(SuccessState());
    print(value.data);
  }).catchError((error){
    emit(ErrorState(error.toString()));
  });

}}