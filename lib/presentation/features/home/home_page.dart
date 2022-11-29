
import 'package:appp_sale_29092022/common/constants/api_constant.dart';
import 'package:appp_sale_29092022/common/utils/extension.dart';
import 'package:appp_sale_29092022/data/model/cart_result_model.dart';
import 'package:appp_sale_29092022/data/model/result.dart';
import 'package:appp_sale_29092022/presentation/features/home/home_bloc.dart';
import 'package:appp_sale_29092022/presentation/features/home/home_event.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeContainer();
  }
}

class HomeContainer extends StatefulWidget {
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  HomeBloc bloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.dispatch(FetchProductEvent());
    bloc.dispatch(LoadCartOnAppbar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Home page", style: TextStyle(color: Colors.black),)
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.shopping_cart, color: Colors.orange,),
              ),
              Positioned(
                right: 30,
                  top: 10,
                  child: StreamBuilder<int>(
                  stream: bloc.getCartStream,
                  builder: (context, snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                        return const Text("");
                      case ConnectionState.active:
                        return Text((snapshot.data).toString(),
                            style: TextStyle( color: Colors.white,
                              backgroundColor: Colors.black,
                            ));
                      default:
                        return const Text("");
                    }
                  },)
              )
            ],
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<List<Data>>(
              stream: bloc.getStream,
                builder: (context,snapshot) {
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                      return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return _buildItemFood(snapshot.data?[index]);
                          });
                    default:
                      return Container();
                  }
                }
            ),
            StreamBuilder<String>(
              stream: bloc.getStatusAddToCart,
              builder: (context, snapshot) {

                if(snapshot.hasData){
                  switch(snapshot.data){
                    case "adding":
                      return const Positioned.fill(child: Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      ));
                    case "success":
                      return Container();
                    default:
                      return Container();
                  }
                }
                else{
                  return Container();
                }
            },)
          ],
        ),
      )
    );
  }

  Widget _buildItemFood(Data? product) {
    if (product == null) return Container();
    return Container(
      height: 135,
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(ApiConstant.BASE_URL + product.img.toString(),
                    width: 150, height: 120, fit: BoxFit.fill),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(product.name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16)),
                      ),
                      Text("Giá : ${formatPrice(product.price ?? 0)} đ",
                          style: TextStyle(fontSize: 12)),
                      ElevatedButton(
                        onPressed: () {
                          bloc.dispatch(AddToCartEvent(productId: product.sId.toString()));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromARGB(200, 240, 102, 61);
                              } else {
                                return Color.fromARGB(230, 240, 102, 61);
                              }
                            }),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                        child:
                        Text("Add To Cart", style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget? _showAlertDialog(BuildContext context,{required String title,required String content}) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
