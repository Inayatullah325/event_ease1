import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_ease/UI/Screens/ManagerUI/OrderDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders",style: TextStyle(fontSize: 22.sp,
            fontWeight: FontWeight.bold,color: Colors.white ),),
        backgroundColor:  Color(0XFF2f9494),
        centerTitle: true,
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Order").snapshots(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child:  CircularProgressIndicator());
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,

              itemBuilder: (context,index){
              var data = snapshot.data!.docs[index];

              return ListTile(
                tileColor: Colors.grey,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child:  Icon(Icons.person),

                ),
                title: Text(data['name'],style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                subtitle: Text(data['date'],style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),

                trailing: Wrap(children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => OrderDetailScreen(
                            name: data['name'], address: data['address'], documentId: '',
                          )));

                        },
                        child: Icon(Icons.check,color: Colors.green,)),
                  ),
                  InkWell(
                      onTap: ()async{
                        await FirebaseFirestore.instance.collection("Order").doc(data.id).delete();

                  },
                      child: Icon((Icons.close))),
                ],),
              );
              });
        },
      ),
    );
  }
}
