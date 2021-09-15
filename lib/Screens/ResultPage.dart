import 'package:bmi_calculator/Constants/Colors.dart';
import 'package:bmi_calculator/Constants/TextStyling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator/Provider_Class/ProviderClass.dart';

List<Widget> text1 = [
  Text("Normal",style: TextStyle(color: Colors.green, fontSize: 40),),
  Text("Underweight",style: TextStyle(color: Colors.red, fontSize: 40),),
  Text("Overweight",style: TextStyle(color: Colors.red, fontSize: 40),),
];

List<Widget> text2 = [
  Text("You have a normal body weight.", style: defaultTextStyle, textAlign: TextAlign.center,),
  Text("You need to gain some weight.", style: defaultTextStyle, textAlign: TextAlign.center,),
  Text("You need to lose some weight.", style: defaultTextStyle, textAlign: TextAlign.center,)
];
class ResultPage extends StatelessWidget {
  final height;
  const ResultPage({Key? key, @required this.height}) : super(key: key);

  Widget build(BuildContext context) {
    var mediaQHeight = MediaQuery.of(context).size.height;
    var mediaQWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kbackgroundColor,

      appBar: AppBar(
        title: Text("BMI CALCULATOR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: kbackgroundColor,
        elevation: 5,
      ),

      body: Center(
        child: Container(
          decoration: defaultDecoration,
          width: mediaQWidth*0.90,
          height: mediaQHeight*0.80,
          child: Consumer<Weight>(
            builder:(context,weight, child)=> Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                text1[result(calculateBMI(weight.userWeight,height))],
                SizedBox(height: 30),
                Text("${calculateBMI(weight.userWeight,height)}",
                        style: TextStyle(fontSize: 70, color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 50),
                Text("Normal BMI Range:", style: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.5)),),
                Text("18.5 - 25 kg/m2", textAlign: TextAlign.center, style: defaultTextStyle,),
                SizedBox(height: 50),
                text2[result(calculateBMI(weight.userWeight,height))]
              ],
            ),
          ),
        ),
      ),

    );
  }


  double calculateBMI(weight, height) {
    double calculatedBMI = (weight/(height*height))*10000;
    calculatedBMI = double.parse((calculatedBMI).toStringAsFixed(2));
    return calculatedBMI;
  }

  int result(calculatedBMI)
  {
    var index = 0;
    if((18.5 <= calculatedBMI) && (calculatedBMI <= 25))
    {
      index = 0;
    }
    if(calculatedBMI < 18.5)
    {
      index = 1;
    }
    if(calculatedBMI > 25 )
    {
      index = 2;
    }
    return index;
  }
}
