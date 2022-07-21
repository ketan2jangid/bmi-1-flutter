import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 width: 130,
                 child: TextField(
                   controller: heightController,
                   style: TextStyle(
                     fontSize: 42,
                     fontWeight: FontWeight.w300,
                     color: accentHexColor
                   ),
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: "Height",
                     hintStyle: TextStyle(
                       fontSize: 42,
                       fontWeight: FontWeight.w300,
                       color: Colors.white.withOpacity(.8)),
                   ),
                 ),
               ),
               Container(
                 width: 130,
                 child: TextField(
                   controller: weightController,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       fontSize: 42,
                       fontWeight: FontWeight.w300,
                       color: accentHexColor),
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: "Weight",
                       hintStyle: TextStyle(
                         fontSize: 42,
                         fontWeight: FontWeight.w300,
                         color: Colors.white.withOpacity(.8)),
                   ),
                 ),
               ),
             ],
            ),

            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                double h = double.parse(heightController.text);
                double w = double.parse(weightController.text);
                setState((){
                  bmiResult = w/(h*h);
                  if(bmiResult>25){
                    textResult = "You're overweight";
                  }else if(bmiResult>=18.5){
                    textResult = "You BMI is good";
                  }else{
                    textResult = "You are underweight";
                  }
                });
              },
              child: Container(
                child: Text("Calculate", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accentHexColor),),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(bmiResult.toStringAsFixed(2), style: TextStyle(fontSize: 90, color: accentHexColor),),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Container(
                child: Text(
                textResult,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor),
              ),
            )
          ),

          ],
        ),
      ));
  }
}
