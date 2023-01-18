import 'package:first_exo/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                context.read<ColorBloc>().add(ColorResetEvent());
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
              context.read<ColorBloc>().add(ColorRandomEvent());
            },
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: (){
              context.read<ColorBloc>().add(ColorRemoveEvent());
            },
          )
        ],
      ),
      body: BlocBuilder<ColorBloc, ColorState>(builder:
      (context, state) {
        if (state is ColorInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final color = state as ColorLoaded;
          final drapeau = color.drapeauSelected;
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
