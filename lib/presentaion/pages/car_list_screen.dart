import 'package:carrent/presentaion/widgets/car_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/car_bloc.dart';
import '../bloc/car_state.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose your Car"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(builder: (context, state) {
          if (state is CarsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (BuildContext context, int index) {
                return CarCard(car: state.cars[index]);
              },
            );
          }else if(state is CarsError){
            return Center(child: Text("error : ${state.message}"),);
          }
          return Container();
        }));
  }
}
