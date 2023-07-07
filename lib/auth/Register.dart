import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:steno_bano_flutter/color/MyColor.dart';
import 'package:steno_bano_flutter/models/model_login.dart';
import 'package:steno_bano_flutter/models/model_otp.dart';
import 'package:steno_bano_flutter/session/Session.dart';
import 'package:steno_bano_flutter/style/AppStyle.dart';
import 'package:steno_bano_flutter/utility/Utility.dart';

import '../ApiService.dart';
import '../src/_HomeState.dart';

class Register extends StatefulWidget
{

  @override
  _Register createState()=>_Register();

}


 class _Register extends State<Register>
 {
   ModelOtp?_mdelLogin=null;
   ModelLogin?modelLogin=null;

   final businessname = TextEditingController();
   final businessaddress = TextEditingController();
   final businessemail = TextEditingController();
   final businessnumber = TextEditingController();

   final businessgst = TextEditingController();
   final businespincode = TextEditingController();


   late  final textotp = TextEditingController();
   var otp="";
   var typedoce=1;

   File?  _image=null;
   File?img_aadhar=null;
   var gsttext="XXXXXXXXXX1212";
   var aadhartext="XXXXXXX1234";
   _imgFromCamera() async {
     File image = (await ImagePicker.platform.pickImage(
         source: ImageSource.camera, imageQuality: 50
     )) as File;

     setState(() {
       if(typedoce==1)
         {
           _image = image;
           gsttext="Selected";
           print("cemrapthis"+_image.toString());
         }
       else
         {
           aadhartext="Selected";
           img_aadhar = image;
           print("cemrapthis"+_image.toString());
         }

     });
   }

   _imgFromGallery() async {
     File image = (await  ImagePicker.platform.pickImage(
         source: ImageSource.gallery, imageQuality: 50
     )) as File;

     setState(() {
       if(typedoce==1)
       {
         _image = image;
         gsttext="Selected";

         print("cemrapthis"+_image.toString());
       }
       else
       {
         img_aadhar = image;
         aadhartext="Selected";
         print("cemrapthis"+_image.toString());
       }
     });
   }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Register",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,color: Colors.black,), onPressed: () {
        },
        ),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child:Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[


              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.maxFinite,
                padding: const EdgeInsets.only(),
                child:Text("Enter Business Details",style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              ),


              Container(
                margin: const EdgeInsets.only(left: 2,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("Business name *"),
              ),
              Container(
                  width: double.maxFinite,
                  height: 42,
                  child: TextField(
                    controller: businessname,
                    keyboardType: TextInputType.text,
                    style: addressTextStyle(),
                    decoration: registerInputDecoration("Business name"),

                  )
              ),


              Container(
                margin: const EdgeInsets.only(left: 2,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("Business address *"),
              ),
              Container(
                  width: double.maxFinite,
                  height: 42,
                  child: TextField(
                    controller: businessaddress,
                    keyboardType: TextInputType.streetAddress,
                    style: addressTextStyle(),
                    decoration: registerInputDecoration("Business address"),

                  )
              ),


              Container(
                margin: const EdgeInsets.only(left: 2,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("Business email *"),
              ),
              Container(
                  width: double.maxFinite,
                  height: 42,
                  child: TextField(
                    controller: businessemail,
                    keyboardType: TextInputType.emailAddress,
                    style: addressTextStyle(),
                    decoration: registerInputDecoration("Business email"),

                  )
              ),



              Container(
                margin: const EdgeInsets.only(left: 2,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("Mobile number *"),
              ),
              Container(
                  width: double.maxFinite,
                  height: 42,
                  child: TextField(
                    controller: businessnumber,
                    keyboardType: TextInputType.number,
                    style: addressTextStyle(),
                    maxLength: 10,
                    buildCounter: null,
                    decoration: registerInputDecoration("Mobile number"),

                  )
              ),


              Container(
                margin: const EdgeInsets.only(left: 2,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("GST"),
              ),
              Container(
                  width: double.maxFinite,
                  height: 42,
                  child: TextField(
                    controller: businessgst,
                    keyboardType: TextInputType.text,
                    style: addressTextStyle(),
                    maxLength: 15,
                    buildCounter: null,
                    decoration: registerInputDecoration("Company GST number"),

                  )
              ),

              Container(
                margin: const EdgeInsets.only(left: 2,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("Zipcode"),
              ),
              Container(
                  width: double.maxFinite,
                  height: 42,
                  child: TextField(
                    controller: businespincode,
                    keyboardType: TextInputType.number,
                    style: addressTextStyle(),
                    maxLength: 6,
                    buildCounter: null,
                    decoration: registerInputDecoration("ZipCode"),

                  )
              ),

              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.maxFinite,
                padding: const EdgeInsets.only(),
                child:Text("Attach Documents",style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              ),


              Container(

                margin: const EdgeInsets.only(left: 5,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("GST Docs *"),

              ),
              Container(
                height: 42,
                decoration: addressContainerBg(),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                          width: double.maxFinite,
                           child:Text(gsttext,style: TextStyle(fontSize: 14,color: Colors.grey)),
                      ),),
                    Align(
                      child:InkWell(
                        child:  Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Text("Attach",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color: ColorConstants.appColor))),
                        onTap:()=>{
                          typedoce=1,
                          _showPicker(context)
                        },
                      ),
                    ),

                  ],
                ),
              ),

              Container(

                margin: const EdgeInsets.only(left: 5,top: 20),
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 2),
                child:addressText("Aadhar Docs *"),

              ),
              Container(
                height: 42,
                decoration: addressContainerBg(),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: double.maxFinite,
                        child:Text(aadhartext,style: TextStyle(fontSize: 14,color: Colors.grey)),
                      ),),
                    Align(
                      child:InkWell(
                        child:  Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Text("Attach",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color: ColorConstants.appColor))),
                        onTap:()=>{
                          typedoce=2,
                          _showPicker(context)
                        },
                      ),
                    ),

                  ],
                ),
              ),






              Container(
                width: double.maxFinite,
                height: 40,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: ColorConstants.appColor, borderRadius: BorderRadius.circular(6)),
                child: FlatButton(
                  onPressed: () {
                    /*  Navigator.push(
                    //  context, MaterialPageRoute(builder: (_) => HomeMain()));
                      context, MaterialPageRoute(builder: (_) => ModalBottomSheetDemo()));*/
                    /*  dialogBottomSheet();*/
                    chechValiddation();
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 14,letterSpacing: 1),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(left: 20,top: 10,right: 10,bottom: 5),
                child:Text(
                  'If you have an account?Login here',
                  textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }


   void dialogBottomSheet(String? code) {

     showModalBottomSheet(
         context: context,
         isScrollControlled: true,
         isDismissible: true,
         builder: (context) {

           return FractionallySizedBox(
             heightFactor: 0.9,
             child: Container(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   Container(
                     width: double.maxFinite,
                     height: 50,
                     margin: EdgeInsets.only(left: 10),
                     alignment: Alignment.centerLeft,
                     child: Align(
                       alignment: Alignment.centerLeft,
                       child:IconButton(icon: Icon(Icons.arrow_back),
                         onPressed: () {
                           Navigator.of(context).pop();
                         },
                       ),

                     ),
                   ),
                   Container(
                     width: double.maxFinite,
                     padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 2),
                     child:Text(
                       'Enter 4 Digit OTP number',
                       textAlign: TextAlign.left,
                       style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                     ),
                   ),
                   Container(
                     width: double.maxFinite,
                     padding: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 5),
                     child:Text(
                       'Please enter the OTP code we have sent to phone number '+businessnumber.text,
                       textAlign: TextAlign.left,style: TextStyle(color: Colors.grey),
                     ),

                   ),
                   IntrinsicWidth(child:  TextField(
                     controller: textotp,
                     keyboardType: TextInputType.number,
                     maxLength: 4,
                     minLines: 1,
                     style: TextStyle(
                       fontSize: 24.0,
                       color: Colors.black,
                       letterSpacing: 12.0,
                     ),
                     decoration: InputDecoration(
                       hintText: '0000',
                       hintStyle: TextStyle(
                         letterSpacing: 12.0,
                       ),),

                   ),),
                   Container(
                     margin: EdgeInsets.only(top: 20),
                     child:Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text("Reset OTP ",),
                         Padding(
                             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                             child: Text('00:00', style: TextStyle(fontSize: 20))),
                       ],
                     ),
                   ),
                   Container(
                     width: double.maxFinite,
                     height: 40,
                     margin: const EdgeInsets.only(left: 20.0,top: 50,right: 20),
                     decoration: BoxDecoration(
                         color: ColorConstants.appColor, borderRadius: BorderRadius.circular(6)),
                     child: FlatButton(
                         onPressed: () {

                         },
                         child: new FlatButton(onPressed: () {
                           checkOtpCalidation(code!);
                         },  child: Text(
                           'SUBMIT OTP',
                           style: TextStyle(color: Colors.white, fontSize: 14,letterSpacing: 1),
                         ),

                         )

                     ),
                   ),
                 ],
               ),
             ),
           );

         });
   }

  chechValiddation(){

    if(businessname.text == '')
    {
      showToast('Enter Business name',2);

    }

    else if(businessaddress.text == '')
    {
      showToast('Enter Business address',2);
    }
    else if(businessemail.text == '')
    {
      showToast('Enter Business email',2);
    }

    else if(businessnumber.text == ''||businessnumber.text.length<10)
    {
      showToast('Invalid mobile number',2);
    }
    else if(businespincode.text == '')
    {
      showToast('Enter Zip Code',2);
    }
    else if(_image==null)
    {
      showToast('Select GSt Docs!',2);
    }
    else if(img_aadhar==null)
    {
      showToast('Select Aadhar docs Docs!',2);
    }

    else
    {
      generateOtp(context,businessnumber.text).then((value) =>
      {
        setState(() {
          _mdelLogin=value;
          if(_mdelLogin!=null)
          {
            if(_mdelLogin?.code==1)
            {
              dialogBottomSheet(_mdelLogin?.payload?.otp.toString());
            }

          }
        })
      }
      );
    }

  }




   checkOtpCalidation(String Otp){
     String otptext = textotp.text;
     if(otptext != Otp)
     {
       showToast('Incorrect OTP!!',2);
     }
     else
     {


       var params = {
         "email":businessemail.text,
         "password":textotp.text,
         "phone":businessnumber.text,
         "alternate_phone":businessnumber.text,

         "business_name":businessname.text,
         "business_onwer":businessname.text,
         "business_address":businessaddress.text,
         "zipcode":businespincode.text,
         "gst_number":businessgst.text,


       };


       regsiter(context,params,_image!,img_aadhar!).then((value) =>
           loadSharedPrefs(value));
          // print("registervalueis.."+value.payload.phone));

     }

   }

   loadSharedPrefs(ModelLogin modelLogin) {

     if(modelLogin!=null)
     {
       if(modelLogin.code==1)
       {

         sp.save(modelLogin);
         print("userdata6666"+ json.encode(modelLogin));
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomeMain()), (e) => false);
         //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeMain()));
       }
       else
         {
           showToast(modelLogin.message!,2);
         }

     }

   }



   void _showPicker(context) {
     showModalBottomSheet(
         context: context,
         builder: (BuildContext bc) {
           return SafeArea(
             child: Container(
               child: new Wrap(
                 children: <Widget>[
                   new ListTile(
                       leading: new Icon(Icons.photo_library),
                       title: new Text('Photo Library'),
                       onTap: () {
                         _imgFromGallery();
                         Navigator.of(context).pop();
                       }),
                   new ListTile(
                     leading: new Icon(Icons.photo_camera),
                     title: new Text('Camera'),
                     onTap: () {
                       _imgFromCamera();
                       Navigator.of(context).pop();
                     },
                   ),
                 ],
               ),
             ),
           );
         }
     );
   }




 }

