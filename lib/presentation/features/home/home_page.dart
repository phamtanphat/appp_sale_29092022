import 'package:appp_sale_29092022/common/bases/base_widget.dart';
import 'package:appp_sale_29092022/data/datasources/remote/api_request.dart';
import 'package:appp_sale_29092022/data/repositories/product_repository.dart';
import 'package:appp_sale_29092022/presentation/features/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      providers: [
        Provider(create: (context) => ApiRequest()),
        ProxyProvider<ApiRequest, ProductRepository>(
          create: (context) => ProductRepository(),
          update: (context, request, repository) {
            repository?.updateApiRequest(request);
            return repository!;
          },
        ),
        ProxyProvider<ProductRepository, HomeBloc>(
          create: (context) => HomeBloc(),
          update: (context, repository, bloc) {
            bloc?.updateAuthenRepo(repository);
            return bloc!;
          },
        )
      ],
      child: HomeContainer(),
    );
  }
}

class HomeContainer extends StatefulWidget {

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  @override
  void initState() {
    super.initState();
    ProductRepository productRepository = context.read();
    productRepository.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

