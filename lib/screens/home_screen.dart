import 'package:bloc_internet_connection/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_internet_connection/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return const Text("Connected");
          } else if (state is InternetLostState) {
            return const Text("Not Connected");
          } else {
            return const Text("Loading...");
          }
        },
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Internet Connected")));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red, content: Text("No Internet")));
          }
        },
      )),
    );
  }
}
