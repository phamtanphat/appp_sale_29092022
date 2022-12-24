import 'package:appp_sale_29092022/presentation/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var list = ["ssfsfs", 'gsdgsdg', 'gggggggggg'];
    return BlocProvider(
      create: (context) => CartBloc()
        ..add(
          CartInit(),
        ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          var list = state.transaction?.products;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Cart',
                style: TextStyle(color: Colors.red),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: list == null
                ? const SizedBox.shrink()
                : list.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Chi tiết đơn hàng"),
                          const Text("Giỏ hàng của bạn chưa có sản phẩm "),
                          Image.asset("assets/images/icon_cookie.jpeg")
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                var item = list[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        //color: Colors.blue,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          child: Image.network(
                                            'https://serverappsale.onrender.com/${item.img}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("${item.name}"),
                                              Text("${item.price} VND"),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      //giảm số lượng đơn hàng
                                                      context
                                                          .read<CartBloc>()
                                                          .add(
                                                            OnTapChangedQuantity(
                                                              idProduct: state
                                                                      .transaction
                                                                      ?.id ??
                                                                  "",
                                                              idTransaction:
                                                                  item.id ?? '',
                                                              quantity:
                                                                  (item.quantity ??
                                                                          0) -
                                                                      1,
                                                            ),
                                                          );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                8, 0, 8, 0),
                                                        child: Text(
                                                          '-',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 0, 10, 0),
                                                    child: Text(
                                                        "${item.quantity}"),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      //Tăng số lượng đơn hàng
                                                      context
                                                          .read<CartBloc>()
                                                          .add(
                                                            OnTapChangedQuantity(
                                                              idProduct: state
                                                                      .transaction
                                                                      ?.id ??
                                                                  "",
                                                              idTransaction:
                                                                  item.id ?? '',
                                                              quantity:
                                                                  (item.quantity ??
                                                                          0) +
                                                                      1,
                                                            ),
                                                          );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                8, 0, 8, 0),
                                                        child: Text(
                                                          '+',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Tổng tiền : ${state.transaction?.price ?? 0} VND"),
                              const SizedBox(
                                height: 35,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //Tạo đơn hàng
                                  context.read<CartBloc>().add(
                                        OnTapOrderCart(
                                            idTransaction:
                                                state.transaction?.id ?? ""),
                                      );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Tạo đơn hàng',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ],
                      ),
          );
        },
      ),
    );
  }
}
