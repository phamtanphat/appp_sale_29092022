import 'package:appp_sale_29092022/data/model/card_response.dart';
import 'package:appp_sale_29092022/presentation/features/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc()
        ..add(
          DetailInit(),
        ),
      child: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          // var list=state.listCart
          final argument = ModalRoute.of(context)!.settings.arguments;
          List<CardModel> listProduct = [];
          int total = 0;
          if (state.listCart.isNotEmpty) {
            for (int i = 0; i < state.listCart.length; i++) {
              if (state.listCart[i].id == argument) {
                listProduct = state.listCart[i].products ?? [];
                total = state.listCart[i].price ?? 0;
              }
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Detail',
                style: TextStyle(color: Colors.red),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listProduct.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = listProduct[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 100,
                            child: Image.network(
                              'https://serverappsale.onrender.com/${item.img}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${item.name}"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("Giá tiền: ${item.price} VND"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("Số lượng: ${item.quantity}"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  const Text("Tổng tiền của đơn hàng"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$total VND",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}
