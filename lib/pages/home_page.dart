import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_there/cubit/color_cubit.dart';

///will be used to display the only screen of the app
class HomePage extends StatefulWidget {
  ///initializing constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final greetingText = "hello there...";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            BlocProvider.of<ColorCubit>(context).updateBackgroundColor();
          },
          child: Stack(
            children: [
              BlocBuilder<ColorCubit, ColorState>(
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeIn,
                    color: (state is ColorUpdated)
                        ? state.loadedColor
                        : Colors.black87,
                  );
                },
              ),
              Center(
                child: TweenAnimationBuilder<int>(
                  builder: (context, value, child) {
                    return Text(
                      greetingText.substring(0, value),
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    );
                  },
                  duration: const Duration(seconds: 2),
                  tween: IntTween(begin: 0, end: greetingText.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
