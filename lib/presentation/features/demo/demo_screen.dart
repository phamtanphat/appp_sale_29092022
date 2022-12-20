import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/demo_bloc.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DemoBloc(),
      child: BlocBuilder<DemoBloc, DemoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Demo'),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  Text('${state.so}'),
                  SizedBox(
                    height: 40,
                  ),
                  Text('${state.text}'),
                  SizedBox(height: 50),
                  Container(
                    height: 50,
                    color: state.isBlue == true ? Colors.blue : Colors.red,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Press'),
                      onPressed: () {
                        context.read<DemoBloc>().add(NhapVoTangSoDem());
                        context.read<DemoBloc>().add(NhapVoDoiMau());
                        context.read<DemoBloc>().add(DoiChuDoiMau());
                        // xu ly tiep
                      },
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
