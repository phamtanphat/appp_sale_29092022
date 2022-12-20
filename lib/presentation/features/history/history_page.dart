import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var listCart = ["12345", "asdasdasd"];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(color: Colors.red),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: listCart.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = listCart[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //height: 100,
              //color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text("2022 - 12 - 20"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Tổng tiền:200,000 VND "),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Colors.green,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        'https://serverappsale.onrender.com/assets/images/achay/banner.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
