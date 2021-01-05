import 'package:flutter/material.dart';



class BimCalculator extends StatefulWidget{
  //BimCalculator({Key key}):super(key: key);
  @override
  _BimCalculatorState createState()=>_BimCalculatorState();

}
class _BimCalculatorState extends State<BimCalculator>{
  String result="";
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  double height=0;
  double weight=0;
  int currentIndex=0;
  Widget build(BuildContext context)
  {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.pink, 0),
                    radioButton("Woman", Colors.pink, 1)
                  ],
                ),
                SizedBox(
                  height: 20.0,

                ),
                Text(
                  "Your Height In CM :",style: TextStyle(
                    fontSize: 18,

                  ),
                  
                ),
                SizedBox(
                  height: 8.0,

                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Height In CM ",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,

                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Text(
                  "Your Weight in KG :",style: TextStyle(
                    fontSize: 18,

                  ),
                  
                ),
                SizedBox(
                  height: 8.0,

                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Weight in KG ",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,

                    ),
                  ),
                ),
                SizedBox(height: 40.0,
                ),

                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                      });
                      caluclateBIM(height, weight);
                    },
                    color: Colors.pink,

                    child: Text('Calculate',
                    style: TextStyle(color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Your BMI Is',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '$result'+' '+'KG/M\u00B2.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void caluclateBIM(double height,double weight)
  {
    double finalResult =weight/(height*height/10000);
    String bim=finalResult.toStringAsFixed(2);
    setState(() {
      result=bim;      
    });
  }
  void changeIndex(int index)
  {
    setState(() {
      currentIndex=index;
    });
  }
  Widget radioButton(String value , Color color,int index)
  {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,

        child: FlatButton(

          color: currentIndex==index?color:Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.5)
          ),
          onPressed: (){
            changeIndex(index);
          },
          child: Text(value ,style: TextStyle(
            color: currentIndex==index?Colors.white:color,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,


          ),),
        ),
      ),
    );
  }
}