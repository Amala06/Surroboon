import 'package:flutter/material.dart';

class OwnMessage extends StatelessWidget {
  const OwnMessage({Key ?key,required this.message,required this.time}):super(key: key);
  final String message;
    final String time;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child:  Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          color: Colors.pink,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,right: 60,top: 5,bottom: 20),
                child: Text(message,style: TextStyle(fontSize: 16,color: Colors.white),),
              ),
              SizedBox(width: 5,),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [Text(time,
                      style: TextStyle(fontSize: 13,color: Colors.grey[300]),
                    ), Icon(Icons.done_all,size: 20,)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
