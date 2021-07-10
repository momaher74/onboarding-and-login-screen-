import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/api/Dio.dart';
import 'package:shopapp/login%20cubit/logincubit.dart';
import 'package:shopapp/login%20cubit/loginstates.dart';
import 'package:shopapp/registScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LoginScreen());
  DioHelper.init();
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcont = TextEditingController();
  var passcont = TextEditingController();
  var myformkey = GlobalKey<FormState>();
  bool invis = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        // ignore: missing_required_param
        builder: (ctx) => BlocProvider<LoginCubit>(
          create: ( BuildContext context)=>LoginCubit(),
          child: BlocConsumer<LoginCubit , LoginStates>(
            listener: (context ,state){},
            builder: (context , state)=>Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Form(
                      key: myformkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "login to browse our products",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'invalid email';
                              }
                              return null;
                            },
                            controller: emailcont,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "enter email",
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: invis,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'password is so short';
                              }
                              return null;
                            },
                            controller: passcont,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "enter password",
                              prefixIcon: Icon(Icons.lock),
                              suffix: IconButton(
                                onPressed: (){
                                  setState(() {
                                    invis=!invis ;
                                  }) ;
                                },
                                icon: invis?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility) ,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            child:ConditionalBuilder(
                              condition:state is!LoadingState  ,
                              builder: (context)=> ElevatedButton(
                                  onPressed: () {
                                    myformkey.currentState.validate();
                                    LoginCubit.get(context).userLogin(email:emailcont.text , password:passcont.text );
                                  },
                                  child: Text("Login")),
                              fallback: (context)=>Center(child:  CircularProgressIndicator() ,),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Don't have an account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              TextButton(
                                  onPressed: () {
                                    return Navigator.of(ctx).push(MaterialPageRoute(
                                        builder: (_) =>Scaffold(body:RegisterScreen() )));
                                  },
                                  child: Text("Register"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ),
        ),
    ),
    );
  }
}
