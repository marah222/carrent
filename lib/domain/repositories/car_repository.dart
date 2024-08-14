import '../../data/model/car.dart';

abstract class CarRepository{

  Future<List<Car>> fetchCars();
}