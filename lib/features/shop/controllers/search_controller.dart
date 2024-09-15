//
//
// import 'package:get/get.dart';
//
// class CustomSearchController extends GetxController {
//   var searchText = ''.obs;
//   var filteredItems = <String>[].obs;
//
//   List<String> contractors = ['Contractor 1', 'Contractor 2'];
//   List<String> laborers = ['Laborer 1', 'Laborer 2'];
//
//   void searchItems(String query) {
//     if (query.isEmpty) {
//       filteredItems.clear();
//     } else {
//       List<String> allItems = [...contractors, ...laborers];
//       filteredItems.value = allItems
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   }
// }

import 'package:get/get.dart';

import '../../../common/constructor/home.dart';
//
class CustomSearchController extends GetxController {
  List<T> search<T>(List<T> list, String query, String Function(T) getAttribute) {
    return list.where((item) {
      final attribute = getAttribute(item).toLowerCase();
      final lowerQuery = query.toLowerCase();
      return attribute.contains(lowerQuery);
    }).toList();
  }


  List<ContractorDetails> searchContractors(List<ContractorDetails> list, String query) {
    return search(list, query, (contractor) => contractor.name);
  }

  List<LaborerDetails> searchLaborers(List<LaborerDetails> list, String query) {
    return search(list, query, (laborer) => laborer.name);
  }

  List<ElectricianDetails> searchElectricians(List<ElectricianDetails> list, String query) {
    return search(list, query, (electrician) => electrician.name);
  }

}