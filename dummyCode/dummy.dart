// Expanded(
//   child: ListView.builder(
//
//     itemCount: arrName.length,
//     scrollDirection: Axis.vertical,
//     itemBuilder: (context,index)
//     {
//       return InkWell(
//         onTap: (){
//           setState(() {
//             if(tempName.contains(arrName[index]))
//             {
//               tempName.remove(arrName[index]);
//             }
//             else
//             {
//               tempName.add(arrName[index]);
//             }
//
//           });
//          print(tempName);
//         },
//           child: Card(
//             child: ListTile(
//               title: Text(arrName[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//               ),
//               trailing: Container(
//                 height: 30,
//                 width: 60,
//                 decoration: BoxDecoration(color:tempName.contains(arrName[index])? Colors.redAccent:Colors.blueAccent,borderRadius: BorderRadius.circular(10)),
//                 child: Center(child: Text(tempName.contains(arrName[index])?'remove':'Add')),
//               ),
//             ),
//           ),
//           );
//     },
//
//
//   ),
// ),





// drawer: Drawer(
// child: ListView(
// padding: EdgeInsets.zero,
// children: <Widget>[
// DrawerHeader(
// child: Text(''),
// decoration: BoxDecoration(
// // color: Colors.blue,
// image: DecorationImage(
// image: AssetImage("assets/images/espresso.png"),
// fit: BoxFit.contain)
// ),
// ),
// ListTile(
// title: Text('Item 1'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ListTile(
// title: Text('Item 2'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ],
// ),
// ),