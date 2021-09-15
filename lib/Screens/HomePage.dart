import 'package:bmi_calculator/Constants/TextStyling.dart';
import 'package:bmi_calculator/Screens/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator/Provider_Class/ProviderClass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 170;
  bool maleSelected = true;
  int index = 0;
  @override
  Widget build(BuildContext context) {

    final weight = Provider.of<Weight>(context, listen: false);
    final age = Provider.of<Age>(context, listen: false);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(

          backgroundColor: Color(0xFF0A0E21),

          appBar: AppBar(
            title: Text("BMI CALCULATOR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            backgroundColor:Color(0xFF0A0E21),
            elevation: 5,
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        maleSelected = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: maleSelected? selected : notSelected,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      height: height*0.25,
                      width: width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(FontAwesomeIcons.male, size: 120, color: Colors.white,),
                          Text("MALE", style: defaultTextStyle,)
                        ],
                      ),
                    ),
                  ), // for male icon

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        maleSelected = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: maleSelected? notSelected : selected,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      height: height*0.25,
                      width: width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(FontAwesomeIcons.female, size: 120, color: Colors.white,),
                          Text("FEMALE", style: defaultTextStyle,)
                        ],
                      ),
                    ),
                  ), //for female icon

                ],
              ), //for male and female

              Container(
                decoration: defaultDecoration,
                height: height*0.25,
                width: width*0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: defaultTextStyle,),
                    // Text("${value.round()}"+ " cm", style: defaultTextStyle),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "${value.round()}",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),
                          TextSpan(text: " cm",style: TextStyle(fontSize: 25))
                        ]
                      ),
                    ),
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: notSelected,
                      value: value,
                      max: 250,
                      min: 50,
                      onChanged:(value){
                        setState(() {
                          this.value = value;
                        });
                      },
                    ),
                  ],
                ),
              ), //for height slider

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Container(
                    decoration: defaultDecoration,
                    height: height*0.25,
                    width: width*0.45,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("WEIGHT",  style: defaultTextStyle),
                        // Text("${context.watch<Weight>().weight}"+ " kg", style: defaultTextStyle),
                        Consumer<Weight>(
                          builder:(context,weight,child) => RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(text: "${weight.userWeight}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
                                  TextSpan(text: " Kg",style: TextStyle(fontSize: 25))
                                ]
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            MaterialButton(
                                color: Colors.grey[350],
                                shape: CircleBorder(),
                                child : Text("-", style: plusMinusButton),
                                onPressed: (){
                                  weight.removeWeight();
                                }),
                            MaterialButton(
                              color: Colors.grey[350],
                              shape: CircleBorder(),
                              child : Text("+",  style: plusMinusButton),
                                onPressed: (){
                              weight.addWeight();
                            })

                          ],
                        )
                      ],
                    )
                  ), // for Weight Counter

                  Container(
                    decoration: defaultDecoration,
                    height: height*0.25,
                    width: width*0.45,


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("AGE", style: defaultTextStyle),
                          // Text("${context.watch<Age>().age}"+ " years", style: defaultTextStyle),
                          Consumer<Age>(
                            builder:(_,age,__) => RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: "${age.age}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
                                    TextSpan(text: " Years",style: TextStyle(fontSize: 25))
                                  ]
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              MaterialButton(
                                  color: Colors.grey[350],
                                  shape: CircleBorder(),
                                  child : Text("-",  style: plusMinusButton),
                                  onPressed: (){
                                    age.removeAge();
                                  }),
                              MaterialButton(
                                  color: Colors.grey[350],
                                  shape: CircleBorder(),
                                  child : Text("+",  style: plusMinusButton),
                                  onPressed: (){
                                    age.addAge();
                                  })

                            ],
                          )
                        ],
                      )
                  ), //for Age counter

                ],
              ), //for weight and age

              MaterialButton(
                color: Color.fromRGBO(253, 2, 37, 1),
                minWidth: width*0.95,
                height: height*0.05,
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder:(context) {
                            return ResultPage(height: value.round().toInt() ,);
                          }
                          )
                  );
                },
                child: Text("CALCULATE", style: defaultTextStyle,),
                  ), //Calculate Button

            ],
          ),

        )
    );
  }
}
