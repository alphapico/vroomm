import 'package:flutter_bloc/flutter_bloc.dart';
import '../../graphql/generated/graphql_api.graphql.dart';

class PassengerProfileCubit extends Cubit<GetCurrentOrder$Query$Passenger?> {
  PassengerProfileCubit() : super(null);

  void updateProfile(GetCurrentOrder$Query$Passenger? passenger) {
    emit(passenger);
  }
}
