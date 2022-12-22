import 'package:appp_sale_29092022/presentation/features/history/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var listCart = ["12345", "asdasdasd"];
    return BlocProvider(
      create: (context) => HistoryBloc()
        ..add(
          HistoryInit(),
        ),
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
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
              itemCount: state.listCart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = state.listCart[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text('${item.dateCreated}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Tổng tiền:${item.price} VND "),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.green,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.network(
                            'https://serverappsale.onrender.com/${item.products?.first.img}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
