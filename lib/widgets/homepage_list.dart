import 'package:CookingApp/response/cookResponse.dart';
import 'package:CookingApp/widgets/container_widget.dart';
import 'package:CookingApp/widgets/raised_button_widget.dart';
import 'package:CookingApp/widgets/richtext_widget.dart';
import 'package:flutter/material.dart';

class HomePageListWidget extends StatefulWidget {
  final CookResponse _cookResponse;

  HomePageListWidget(this._cookResponse);

  @override
  _HomePageListWidgetState createState() => _HomePageListWidgetState();
}

class _HomePageListWidgetState extends State<HomePageListWidget> {
  @override
  Widget build(BuildContext context) {
    CookResponse _response = widget._cookResponse;
    String _cookName = _response.cookName;
    int _experience = _response.experience;
    String _genderString = _getGender(_response.gender.toString());
    String _language = _response.language;
    double _rating = _response.rating;
    int _salary = _response.perMonthCharge;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Card(
        child: Column(
          children: <Widget>[
            Flexible(
              child: SizedBox(
                  child: Image.asset(
                'assets/images/cook.jpg',
                width: double.maxFinite,
                height: double.maxFinite,
              )),
              flex: 4,
              fit: FlexFit.tight,
            ),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ContainerWidget(
                  Column(children: <Widget>[
                    ContainerWidget(Text(' $_cookName')),
                    ContainerWidget(
                        Text('$_genderString | Exp : $_experience Years'))
                  ]),
                )),
            Flexible(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: ContainerWidget(
                          RichTextWidget(' $_rating', Icons.star),
                          double.infinity)),
                  Flexible(
                    child: ContainerWidget(
                        RichTextWidget(' $_salary', Icons.attach_money),
                        double.infinity),
                  )
                ],
              ),
            ),
            Flexible(flex: 1, child: ContainerWidget(
                //  TODO Change Distance here
                RichTextWidget(' 5 KM', Icons.directions_car))),
            Flexible(
                flex: 1,
                child: ContainerWidget(
                    RichTextWidget(' North Indian Dishes', Icons.fastfood))),
            Flexible(
                flex: 1,
                child:
                    ContainerWidget(RichTextWidget(' $_language', Icons.mic))),
            Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButtonWidget(
                      RichTextWidget('BOOK YOUR COOK', Icons.shopping_cart),
                      ()=>printFun),
                )),
          ],
        ),
      ),
    );
  }

  Function printFun(BuildContext context) {
    print("Hello");
  }

  String _getGender(String genderStr){
    if(genderStr == "Gender.MALE"){
      return "Male";
    }
    return "Female";
  }
}
