
import '../../../../../utils/constants/exports.dart';

// Define the controller for managing favorites
class FavoritesController extends GetxController {
  // Observable list to store favorite items
  var favoriteContractors = <ContractorDetails>[].obs;
  var favoriteLaborers = <LaborerDetails>[].obs;
  var favoriteElectricians = <ElectricianDetails>[].obs;
  var favoritePlumbers = <PlumberDetails>[].obs;
  var favoritePainters = <PainterDetails>[].obs;
  var favoriteWelders = <WelderDetails>[].obs;

  // Function to add or remove a contractor from favorites
  void toggleFavoriteContractor(ContractorDetails contractor) {
    if (favoriteContractors.contains(contractor)) {
      favoriteContractors.remove(contractor);
    } else {
      favoriteContractors.add(contractor);
    }
  }

  // Function to add or remove a laborer from favorites
  void toggleFavoriteLaborer(LaborerDetails laborer) {
    if (favoriteLaborers.contains(laborer)) {
      favoriteLaborers.remove(laborer);
    } else {
      favoriteLaborers.add(laborer);
    }
  }

  // Function to add or remove a Electricians from favorites
  void toggleFavoriteElectrician(ElectricianDetails electrician) {
    if (favoriteElectricians.contains(electrician)) {
      favoriteElectricians.remove(electrician);
    } else {
      favoriteElectricians.add(electrician);
    }
  }

  // Function to add or remove a Plumber from favorites
  void toggleFavoritePlumber(PlumberDetails plumber) {
    if (favoritePlumbers.contains(plumber)) {
      favoritePlumbers.remove(plumber);
    } else {
      favoritePlumbers.add(plumber);
    }
  }


  // Function to add or remove a Painter from favorites
  void toggleFavoritePainter(PainterDetails painter) {
    if (favoritePainters.contains(painter)) {
      favoritePainters.remove(painter);
    } else {
      favoritePainters.add(painter);
    }
  }


  // Function to add or remove a Welder from favorites
  void toggleFavoriteWelder(WelderDetails welder) {
    if (favoriteWelders.contains(welder)) {
      favoriteWelders.remove(welder);
    } else {
      favoriteWelders.add(welder);
    }
  }
}
