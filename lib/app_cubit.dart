import 'package:equatable/equatable.dart';
import 'package:pdthang/cubit_state.dart';

import 'data_service/DataService.dart';

/*class AppCubits extends Cubit<CubitStates> {
  AppCubits(this.dataServices) : super(LoadingState());
  final DataServices dataServices;
  // final Authenti`cationService authService;

  var destinations;
  late List<PlaceModel> places;
  late List<PlaceModel> favoritePlaces = [];

  var welcome;
  var userModel;

  void loadWelcomePage() async {
    try {
      emit(LoadingState());
      welcome = await dataServices.welcome();
      emit(WelcomeLoadedState(welcomes: welcome));
    } catch (e) {
      print(e);
    }
  }
}*/

