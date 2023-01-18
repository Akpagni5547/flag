import 'package:first_exo/cubit/flag_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubitPage extends StatelessWidget {
  const ColorCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color page cubit'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                context.read<FlagCubit>().resetColor();
              },
              child: const Icon(
                Icons.reset_tv,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: (){
              context.read<FlagCubit>().addColor();
            },
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: (){
              context.read<FlagCubit>().removeColor();
            },
          )
        ],
      ),
      body: BlocBuilder<FlagCubit, FlagState>(builder:
          (context, state) {
        if (state is FlagInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final color = state as FlagLoaded;
          final drapeau = color.flag;
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: color.count >= 1 ?  drapeau.primaryColor : Colors.grey,

                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: color.count >= 2 ?  drapeau.secondaryColor : Colors.grey,

                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: color.count >= 3 ?  drapeau.tertiaryColor : Colors.grey,

                  )
                ],
              )
            ],
          );
        }
      }
      ),
    );
  }
}
