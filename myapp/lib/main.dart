import 'package:flutter/material.dart';

import 'dart:convert';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _jsonPost=[];

  Future fetchData() async{
    try{
      final response=await
    get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final jsonData=jsonDecode(response.body);
    setState((){
      _jsonPost=jsonData;
    });


    }catch(err){
      print("This is the${err}");

    }
  }
  // Map mapResponse;
  // var stringResponse;
  // Future getData()async{
  //   Response response;
  //   // var url=''
  //   response= await http.get(
  //     Uri.parse("https://reqres.in/api/users/2")
  //     );
  //     if(response.statusCode==200){
  //       setState(() {
  //          mapResponse=jsonDecode(response.body);
  //       });
        
  //     }
     

// int count=0;
// List? data;

// getData()async{
//   try{
//     final result=
//     await http.Client().get(Uri.parse('https://jsonplaceholder.typicode.com/posts')
//     );
//     setState(() {
//       data=jsonDecode(result.body);
//     });
//   }catch(err){
//     print('Error${err}');

//   }
// // }
//   void initState(){
//     super.initState();
//     getData();
//   }
void initState(){
  super.initState();
  fetchData();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body:ListView.builder(
          itemCount:_jsonPost.lenght,
          itemBuilder:(context, index){
            final post=_jsonPost[index];
            return Text("Title:${post["title"]}\n body:${post["body"]}\n\n")
          }
        )
      )

    );
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.purple,
//           title: Text(
//             'API',
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: Container(
//                 child:Column(
//                   children: [
//                     Text(
//                       //data![count]['title'],
//                       mapResponse==null?Text('data is loading'):Text(
//                         "${mapResponse?["data"].toString()}",
//                       ).toString(),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                       ),

//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     RaisedButton(
//                       child: Text('get data'),
//                       onPressed:(){
//                         setState(() {
//                           count++;
//                         });
//                       } 
//                     ),
//                   ],
//                 ) ,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
