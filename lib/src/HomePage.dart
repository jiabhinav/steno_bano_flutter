import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ApiService.dart';
import '../color/MyColor.dart';
import '../models/model_dash_board.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

 class _MyAppState extends State<HomePage> {
  late Future<ModelDashBoard> futureAlbum;
    ModelDashBoard?_modelDashBoard=null;
  @override
  void initState() {
    super.initState();

   getDashboard(context).then((value) => {
  // _modelDashBoard=value
      setState(() {
        _modelDashBoard=value;
    })
    });

  }

  @override
  Widget build(BuildContext context) {
    if(_modelDashBoard!=null)
      {
        return SingleChildScrollView(

            child:Column(
              children:<Widget> [
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.lightgray),
                      borderRadius: new BorderRadius.all(new Radius.circular(18.0)),
                      color: ColorConstants.lightgray
                  ),
                  child: Text('Search...',textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ),
                CarouselSlider(
                  options: CarouselOptions(height:  MediaQuery.of(context).size.height * 0.22,
                    viewportFraction: .95,
                  ),
                  items: _modelDashBoard?.payload!.banners!.map((i)
                  {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(i.image!),
                              fit: BoxFit.cover,
                            ),
                          ),

                        );
                      },
                    );
                  }).toList(),
                ),

                Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                       itemCount: _modelDashBoard?.payload!.categories!.length,
                      //itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        var countproduct=_modelDashBoard?.payload!.categories![index].products!.length;
                        var category=_modelDashBoard?.payload!.categories![index];
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                width: double.maxFinite,
                                  child:Row(
                                    children: [
                                      Expanded(child:Text(category!.name!, textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500))),

                                      InkWell(
                                        onTap:()=>{
                                        //  Navigator.push(context, MaterialPageRoute(builder: (_) => ProductList(category.categoryId.toString())))
                                        },
                                        child:Align(
                                          alignment: Alignment.topRight,
                                          child:Container(
                                            padding:EdgeInsets.only(left: 5,right: 5,top: 1,bottom: 1),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                border: Border.all(color: ColorConstants.appColor)
                                            ),
                                            child:Text("View All", textAlign: TextAlign.start, style: TextStyle(fontSize: 12),),
                                          ),

                                        ),
                                      ),


                                    ],
                                  ),
                              ),

                         //=======================nestedScroll=======================
                              Container(
                               margin:EdgeInsets.only(top: 5),
                                height: MediaQuery.of(context).size.width * 0.45,
                              ),



                            ],
                          ),
                        );


                      }
                  ),
                )



              ],

            )

        );
      }
    else{
      return SingleChildScrollView();
    }

  }

}