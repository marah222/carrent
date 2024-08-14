import 'package:carrent/data/%20datasources/firebase_car_data_source.dart';
import 'package:carrent/data/model/car.dart';
import 'package:carrent/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
