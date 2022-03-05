import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/Helper/Constance/const_color.dart';
import 'package:tests/Helper/Widgets/Custom/custom_buttons.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';
import 'package:tests/Helper/Widgets/Default/default_expanded_auth.dart';
import 'package:tests/Helper/Widgets/Default/default_textformfeild.dart';
import 'package:tests/State/Functions/functions_auth.dart';
import 'package:tests/State/State/switch_state.dart';
import 'package:tests/Views/Main/conditional_builder.dart';
import 'package:tests/constants.dart';



class MobileSignUpPage extends ConsumerStatefulWidget {
  const MobileSignUpPage({Key? key}) : super(key: key);

  @override
  _MobileSignUpPageState createState() => _MobileSignUpPageState();
}

class _MobileSignUpPageState extends ConsumerState<MobileSignUpPage> with _MixinMobileSignUpPage{

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerName.dispose();
    _controllerPhone.dispose();
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
      child: Scaffold(
          body: Container(
            height: double.infinity ,
            width: double.infinity ,
            decoration: const BoxDecoration(
                gradient: constGradient
            ),
            child: LayoutBuilder(
                builder:(context, constraints) => Center(
                  child: ListView(
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.1,
                      ) ,

                      Column(
                        children: [
                          SizedBox(
                            height: !_keyBoard ? constraints.maxHeight * 0.85 : _mediaQ.height * 0.9,
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
                                          text: 'Sign Up',
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ) ,


                                    Expanded(
                                      child: DefaultExpandedAuth(
                                          child: DefaultTextFormField(
                                            controller: _controllerName,
                                            inputAction: TextInputAction.next,
                                            inputType: TextInputType.text,
                                            hint: 'Enter your Name',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10.0) ,
                                            ) ,
                                            validator: (String? v) {
                                              return FunctionsAuth.validatorName(v);
                                            },
                                          )),
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
                                          child: DefaultTextFormField(
                                            controller: _controllerPhone,
                                            inputAction: TextInputAction.next,
                                            inputType: TextInputType.phone,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10.0) ,
                                            ) ,
                                            hint: 'Enter your Phone',
                                            validator: (String? v){
                                              return FunctionsAuth.validatorPhone(v);
                                            },
                                          )),
                                    ) ,


                                    Expanded(
                                      child: DefaultExpandedAuth(
                                          child: Consumer(
                                            builder:(context,prov,_)=> DefaultTextFormField(
                                              controller: _controllerPw ,
                                              inputAction: TextInputAction.done ,
                                              inputType: TextInputType.visiblePassword ,
                                              password: prov.watch(_switchProv).varSwitch ,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none ,
                                                borderRadius: BorderRadius.circular(10.0) ,
                                              ) ,
                                              hint: 'Enter your Password' ,
                                              suffixIcon: AnimatedConditionalBuilder(
                                                duration: const Duration(milliseconds: 250),
                                                condition: prov.read(_switchProv).varSwitch,
                                                builder: (context)=>IconButton(onPressed: (){
                                                  prov.read(_switchProv).funcSwitch();

                                                },icon: const Icon(Icons.visibility),),
                                                fallback: (context)=>IconButton(onPressed: (){
                                                  prov.read(_switchProv).funcSwitch();
                                                },icon: const Icon(Icons.visibility_off),),
                                              ) ,
                                              validator: (String? v) {
                                                return FunctionsAuth.validatorPw(v);
                                              },
                                              onSubmitted: (v) async {
                                                return await FunctionsAuth.registerButton(
                                                    globalKey: _globalKey ,
                                                    context: context ,
                                                    name: _controllerName.text ,
                                                    email: _controllerEmail.text ,
                                                    phone: _controllerPhone.text ,
                                                    password: _controllerPw.text ,
                                                    ref: ref ,
                                                    state: _circleProv
                                                );
                                              },
                                            ),
                                          )),
                                    ) ,


                                    Expanded(
                                        child: Consumer(
                                          builder: (context,prov,_)=>AnimatedConditionalBuilder(
                                            condition: prov.watch(_circleProv).varSwitch,
                                            builder: (BuildContext context){
                                              return DefaultExpandedAuth(
                                                child: Container(
                                                  height: _mediaQ.height * 0.09,
                                                  decoration: BoxDecoration(
                                                    gradient: constGradient,
                                                    borderRadius: BorderRadius.circular(15.0),
                                                  ),
                                                  child: CustomTextButton(
                                                    child: const CustomText(
                                                      text: 'Sign Up',
                                                      color: mainWhiteColor,
                                                      fontSize: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      return await FunctionsAuth.registerButton(
                                                          globalKey: _globalKey ,
                                                          context: context ,
                                                          name: _controllerName.text ,
                                                          email: _controllerEmail.text ,
                                                          phone: _controllerPhone.text ,
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
                                        )),


                                    Expanded(
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: (){
                                            FunctionsAuth.goToMainPage(context);
                                          },
                                          child: const CustomText(text: 'I have an Account',
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) ,

                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
}


mixin _MixinMobileSignUpPage {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final _switchProv = ChangeNotifierProvider<SwitchState>((ref)=>SwitchState());
  final _circleProv = ChangeNotifierProvider<SwitchState>((ref)=>SwitchState());

}