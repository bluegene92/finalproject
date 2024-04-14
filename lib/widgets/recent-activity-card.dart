import 'package:flutter/material.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 390,
          height: 400,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(211, 230, 227, 1.0),
              border: Border.all(color: Colors.black87, width: 3.0),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child:
                    Text("Recent Activities", style: TextStyle(fontSize: 24)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.black87, width: 2.0)),
                        child: Icon(Icons.arrow_back),
                      ),
                      title: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Heading',
                                style: TextStyle(
                                    height: 0.8,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            Text('Heading',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ))
                          ]),
                      trailing: const Text('\$50',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 18)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
