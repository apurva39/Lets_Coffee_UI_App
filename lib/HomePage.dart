import 'package:flutter/material.dart';

import 'package:my_portfolio/food_data.dart';

import 'horizontals_containers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller=ScrollController();
  bool closeTopController=false;
  double topContainer=0;

  List<Widget>itemsData=[];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Expanded(
        
        child: Container(
          
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post["name"],
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post["brand"],
                        style: const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$ ${post["price"]}",
                        style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Flexible(
                    child: Image.asset(
                      "assets/images/${post["image"]}",
                      height: double.infinity,
                    ),
                  )
                ],
              ),
            )),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }
  // List<String> arrName=['Apurva','Anand','Happy','Lucky','Nicky','Sippy','Vicky','Saroj','Kundan','Chandan'];
  // List<String> tempName=[];
  @override
  void initState()
  {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value=controller.offset/119;
      setState(() {
        topContainer=value;
        closeTopController=controller.offset>50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    final double categoryHeight=size.height*0.30;
    return SafeArea(
        child: Scaffold(

          drawer: Drawer(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                DrawerHeader(
                  child: Container(
                      height: 142,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/cappuccino.png",
                      )),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // currentIndex = 3;
                    });
                    // Navigator.of(context).pop();
                  },
                  child: Text(
                    'Espresso',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Cappuccino',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  'Macchiato',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  'Mocha',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  'Turkish',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ),
          backgroundColor: Colors.white,

          appBar: AppBar(
            backgroundColor: Colors.white70,
            title: Center(child: Text("Lets Coffee",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),)),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),

          ),
          body: Container(

            height: size.height,
            child: Column(

              children: [

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text('Favorites',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20),),
                    Text('Menu',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)

                  ],
                ),
                SizedBox(height: 20,),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: closeTopController?0:1,
                  child: AnimatedContainer(
                      child: categoriesScroller,
                    duration: Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopController?0:categoryHeight ,
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)
                     {
                       double scale=1.0;
                       if(topContainer>0.5)
                         {
                           scale=index +0.5 -topContainer;
                           if(scale<0)
                             {
                               scale=0;
                             }
                           else if(scale>1)
                           {
                             scale=1;
                           }

                         }

                          return Opacity(
                            opacity: scale,
                            child: Transform(
                             alignment: Alignment.bottomCenter,
                              transform: Matrix4.identity()..scale(scale,scale),
                              child: Align(
                                heightFactor: 0.7,
                                  alignment: Alignment.topCenter,
                                  child: itemsData[index],
                              ),
                            ),
                          );
                    },
                ),
                ),



              ],
            ),


          ),
        )
    );
  }
}








