import 'package:appp_sale_29092022/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeInit()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final listCart = state.listCard;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Food',
                style: TextStyle(color: Colors.red),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/history");
                  },
                  icon: const Icon(
                    Icons.history_outlined,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/cart");
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            // backgroundColor: Colors.white,
            body: Stack(
              children: [
                ListView.builder(
                  itemCount: listCart.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = listCart[index];
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        children: [
                          //image
                          Expanded(
                            flex: 9,
                            child: SizedBox(
                              height: 110,
                              child: Image.network(
                                'https://serverappsale.onrender.com/${item.gallery?.first}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          //content
                          Expanded(
                            flex: 11,
                            child: SizedBox(
                              height: 100,
                              //color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item.name}',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${item.address}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${item.price} VND',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<HomeBloc>()
                                          .add(OnTapAdd(idProduct: item.id!));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'ADD',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
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
                state.status == HomeStatus.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
