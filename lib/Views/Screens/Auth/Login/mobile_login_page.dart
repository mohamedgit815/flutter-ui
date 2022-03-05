import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tests/Helper/Constance/const_color.dart';
import 'package:tests/Helper/Constance/const_variable.dart';
import 'package:tests/Helper/Widgets/Custom/custom_buttons.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';
import 'package:tests/Helper/Widgets/Default/default_expanded_auth.dart';
import 'package:tests/Helper/Widgets/Default/default_textformfeild.dart';
import 'package:tests/State/Functions/functions_auth.dart';
import 'package:tests/State/State/switch_state.dart';
import 'package:tests/Views/Main/conditional_builder.dart';
import 'package:tests/constants.dart';



class MobileLoginPage extends ConsumerStatefulWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  _MobileLoginPageState createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends ConsumerState<MobileLoginPage> with _MixinMobileLoginPage{

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPw.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool _keyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final Size _mediaQ = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          return customExitApp(dateTime: _dateTime);
        },
        child: Scaffold(
          body: Container(
            height: double.infinity ,
            width: double.infinity ,
            decoration: const BoxDecoration(
              gradient: constGradient
            ),
            child: LayoutBuilder(
              builder:(context, constraints) => ListView(
                physics: const BouncingScrollPhysics(),
                children: [

                  SizedBox(
                    height: constraints.maxHeight * 0.1,
                  ) ,

                  _buildColumn(keyBoard: _keyBoard, constraints: constraints, mediaQ: _mediaQ,ref: ref),

                  Visibility(
                    visible: _keyBoard ? false : true,
                    child: SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                  ) ,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset('$assetsPath/facebook.svg'),
                      SvgPicture.asset('$assetsPath/twitter.svg'),
                      SvgPicture.asset('$assetsPath/google.svg'),
                    ],
                  )
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}

mixin _MixinMobileLoginPage {
  final DateTime _dateTime = DateTime.now();
  final _switchProv = ChangeNotifierProvider<SwitchState>((ref)=>SwitchState());
  final _circleProv = ChangeNotifierProvider<SwitchState>((ref)=>SwitchState());
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();


 Column _buildColumn({
   required bool keyBoard, required BoxConstraints constraints,
   required Size mediaQ ,
   required WidgetRef ref
}) {
    return Column(
      children: [
        SizedBox(
          height: !keyBoard ? constraints.maxHeight * 0.7 : mediaQ.height * 0.75,
          child: Stack(
            children: [
              Visibility(
                visible: keyBoard ? false : true,
                child: Positioned(
                  bottom: 0,
                    right: constraints.maxWidth * 0.1,
                    child: Builder(
                      builder:(BuildContext context)=> GestureDetector(
                        onTap: () async {
                          return await FunctionsAuth.goToSignUpPage(context);
                        },
                        child: Container(
                          width: constraints.maxWidth * 0.7,
                          height: constraints.maxHeight * 0.1,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 10.0),
                          decoration: const BoxDecoration(
                              color: mainWhiteColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0) ,
                                bottomLeft: Radius.circular(10.0)
                            )
                          ),
                          child: const CustomText(text: 'I don\'t have an Account? Sign Up',),
                        ),
                      ),
                    )
                ),
              ),


              SizedBox(
                height: !keyBoard ? constraints.maxHeight * 0.65 : mediaQ.height * 0.7,
                child: Container(
                  width: constraints.maxWidth * 0.9 ,
                  decoration: BoxDecoration(
                      color: mainWhiteColor ,
                      borderRadius: BorderRadius.circular(15.0) ,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            color: colorGrey
                        )
                      ]
                  ),

                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10.0),
                            child: const CustomText(
                              text: 'Sign In',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ) ,


                        Expanded(
                          child: DefaultExpandedAuth(
                              child: DefaultTextFormField(
                                controller: _controllerEmail,
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.emailAddress,
                                hint: 'Enter your Email',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0) ,
                                ) ,
                                validator: (String? v) {
                                  return FunctionsAuth.validatorEmail(v);
                                },
                              )),
                        ) ,


                        Expanded(
                          child: DefaultExpandedAuth(
                              child: Builder(
                                builder:(BuildContext context)=> Consumer(
                                  builder:(context,prov,_)=> DefaultTextFormField(
                                    controller: _controllerPw,
                                    inputAction: TextInputAction.done,
                                    inputType: TextInputType.visiblePassword,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0) ,
                                    ) ,
                                    hint: 'Enter your Password',
                                    password: prov.watch(_switchProv).varSwitch,
                                    suffixIcon: AnimatedConditionalBuilder(
                                      duration: const Duration(milliseconds: 250),
                                      condition: prov.read(_switchProv).varSwitch,
                                      builder: (context)=>IconButton(onPressed: (){
                                        prov.read(_switchProv).funcSwitch();
                                      },icon: const Icon(Icons.visibility),),
                                      fallback: (context)=>IconButton(onPressed: (){
                                        prov.read(_switchProv).funcSwitch();
                                      },icon: const Icon(Icons.visibility_off),),
                                    ),
                                    validator: (String? v){
                                      return FunctionsAuth.validatorPw(v);
                                    },
                                    onSubmitted: (v) async {
                                      return await FunctionsAuth.loginButton(
                                          globalKey: _globalKey ,
                                          context: context ,
                                          email: _controllerEmail.text ,
                                          password: _controllerPw.text ,
                                          state: _circleProv ,
                                          ref: ref
                                      );
                                    },
                                  ),
                                ),
                              )),
                        ) ,


                        Expanded(
                            child: Consumer(
                              builder:(BuildContext context,prov,_)=> AnimatedConditionalBuilder(
                                condition: prov.watch(_circleProv).varSwitch,
                                builder: (BuildContext context){
                                  return DefaultExpandedAuth(
                                    child: Container(
                                      height: mediaQ.height * 0.09,
                                      decoration: BoxDecoration(
                                        gradient: constGradient,
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: CustomTextButton(
                                        child: const CustomText(
                                          text: 'Login',
                                          color: mainWhiteColor,
                                          fontSize: 18.0,
                                        ),
                                        onPressed: () async {
                                          return await FunctionsAuth.loginButton(
                                              globalKey: _globalKey ,
                                              context: context ,
                                              email: _controllerEmail.text ,
                                              password: _controllerPw.text ,
                                              ref: prov ,
                                              state: _circleProv
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                fallback: (BuildContext context){
                                  return const Center(child: CircularProgressIndicator.adaptive());
                                },
                              ),
                            )) ,


                        Expanded(
                          child: Builder(
                            builder:(BuildContext context)=> Center(
                              child: GestureDetector(
                                onTap: (){

                                },
                                child: const CustomText(text: 'Forget your Password?',
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}