import 'package:flutter/material.dart';
import 'package:home_service/widgets/card.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<Map<String, dynamic>> categories = [
    {'name': 'All'},
    {'name': 'Plumbing'},
    {'name': 'Cleaning'},
    {'name': 'Electrical'},
    {'name': 'Painting'},
    {'name': 'Carpentry'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(219, 222, 246, 1),
              Colors.blue[50]!,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.zero,
                          minimumSize: Size(45, 45),
                          maximumSize: Size(45, 45),
                        ),
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Most Popular Services',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                    
                SizedBox(height: 15),
                    
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 7),
                      itemCount: categories.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: index == 0
                                ? LinearGradient(colors: [Colors.blue[800]!, Colors.blue[400]!])
                                : null,
                            color: index == 0 ? null : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(categories[index]['name'], style: TextStyle(color: index == 0 ? Colors.white : Colors.black),)),
                        );
                      },
                    ),
                  ),
                ),
                    
                SizedBox(height: 15),
                    
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                  child: CardWidget(  
                    totalItems: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
