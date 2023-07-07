import 'dart:collection';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:steno_bano_flutter/color/MyColor.dart';
import 'package:steno_bano_flutter/models/model_order_details.dart';
import 'package:steno_bano_flutter/session/Session.dart';
import 'package:vibration/vibration.dart';


  late AlertDialog alert;
  showLoader(BuildContext context){
    var _isLoading=true;
    new Future.delayed(Duration.zero, () {
    /*  alert=AlertDialog(
        backgroundColor: Colors.transparent,
       content: new Row(
          children: [
            CircularProgressIndicator(),
            Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
          ],),

      );*/

      showDialog(barrierDismissible: false,
        context:context,
      /*  builder:(BuildContext context){
          return alert;
        },*/
          builder: (_) =>Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child:Container(
                width: 30,
                height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: ColorConstants.appColor,
                   // strokeWidth: 2,
                  )
              ),

          )
      );
    });


  }


   dialogLogoutBottomSheet(BuildContext context) {

   showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return FractionallySizedBox(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 32,
                          height: 32,
                          decoration: new BoxDecoration(
                            color: ColorConstants.lightgray,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: new Icon(Icons.circle_notifications, size: 20.0, color:Colors.black)),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text("Logout",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 18),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.4,
                  color: ColorConstants.lightgray,
                ),
                Container(

                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 10,top: 20,right: 10,bottom: 20),
                  child:Text(
                    'Are you sure want to Logout?',
                    textAlign: TextAlign.left,style: TextStyle(color: Colors.grey),
                  ),

                ),

                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 10,top: 20,right: 30,bottom: 20),
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child:  Padding(padding: EdgeInsets.only(right: 20),
                          child: Text("Cancel ",style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 16),),
                        ),
                        onTap:()=>{
                          Navigator.pop(context)
                        },
                      ),
                      InkWell(
                        child: Text("Logout Now",style: TextStyle(color: ColorConstants.appColor,fontWeight:FontWeight.w500,fontSize: 16),),
                        onTap: ()=>{
                          logout()
                        },
                      )

                    ],
                  ),
                ),

              ],
            ),
          ),
        );

      });
}

   getLogo(double size,double margin)
   {
     return Container(
         margin: EdgeInsets.only(top: margin),
         width: size,
         height: size,
         decoration: new BoxDecoration(
           color: ColorConstants.black,
           border: Border.all(color: ColorConstants.light_orang),
           borderRadius: BorderRadius.circular(30.0),
         ),
         child: Image.asset('assets/image/logo1.png'));
   }



void logout()
{
  sp.logoutApp();
  SystemNavigator.pop();
}


  dismissLoader(BuildContext context){

    new Future.delayed(Duration.zero, () {

      Navigator.pop(context);

    });



  }

  showToast(String mesg,int possType)
  {

        Fluttertoast.showToast(
            msg: mesg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: possType==1? ToastGravity.TOP:possType==2?ToastGravity.CENTER:ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white
        );
  }

   checkEmail(String email)
  {
    final bool _isValid = EmailValidator.validate(email);
    return _isValid;
  }

  vibrate()
  async {
    if(await Vibration.hasCustomVibrationsSupport()!=null)
      {

      }
    if (await Vibration.hasCustomVibrationsSupport()!=null) {
     Vibration.vibrate(duration: 100);
  } else {
  Vibration.vibrate();
  await Future.delayed(Duration(milliseconds: 100));
  Vibration.vibrate();
  }
  }

  getOrderStatus()
  {
    //todo 1=>Pending, 2=>Approved, 3=> Rejected, 4 => Cancelled, 5=>Dispatched, 6=>Complete
    final status = <int>[];
    for (var i = 1; i < 7; i++) {
      status.add(i);
    }
    return status;
  }

    checkOrderStatus(int status)
    {
      //todo 1=>Pending, 2=>Approved, 3=> Rejected, 4 => Cancelled, 5=>Dispatched, 6=>Complete
      return status==1? "Pending":status==2? "Approved":status==3? "Rejected":status==4? "Cancelled":status==5? "Dispatched":"Complete";
    }

    matchStatus(int status2,List<Order_status>? orderStatus)
    {
      //todo 1=>Pending, 2=>Approved, 3=> Rejected, 4 => Cancelled, 5=>Dispatched, 6=>Complete

      var data= orderStatus!.where((item) => item.orderStatus!.toString().contains(status2.toString()));
     if(data.length >=1)
       {
         return true;
       }
     else{
       return false;
     }

    }












