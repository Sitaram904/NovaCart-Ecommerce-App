import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        title:Text('Notifications',style: Theme.of(context).textTheme.headlineMedium,),
        centerTitle: true,
      ),
      body:6<1? ListView.builder(
        itemCount: 5,
        itemBuilder: (_,index){
        return Column(
          children: [
            ListTile(
              isThreeLine:true,
              leading:Image.network(
                height: 50,
                width: 50,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrGJiyCmWj0yTOh13N6skUjf59jTaSa1oZYpXD9IgBxaSaFuu5ZbRcO8tV&s=10'),
                title:Text(
                
                  maxLines: 1,
                  "Tommorw's Offer last day",
                  style:Theme.of(context).textTheme.headlineMedium
                  ),
                subtitle:Text(
                  maxLines: 3,
                  "Last chance to add a little extra to your Monday delevery.",
                  style: TextStyle(
                    fontWeight:FontWeight.w400,
                    color: AppColors.grey
                  ),
                  ),
              trailing: Text("2 days ago"),
            ),
            SizedBox(height: 10,)
          ],
        );
      })
      :
      Center(
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  spacing: 10,
  children: [

    Icon(Icons.message,color: Colors.grey,size: 50,),
    SizedBox(height: 20,),
    Text(
                
                  maxLines: 1,
                  "No Notifications",
                  style:Theme.of(context).textTheme.headlineMedium
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    "We'll let you know when there will be sometihing to update you.",
                    style: TextStyle(
                      fontWeight:FontWeight.w400,
                      color: AppColors.grey
                    ),
                    ),
                  ),
  ],
),
      )
    );
  }
}