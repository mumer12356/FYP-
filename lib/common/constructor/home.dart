import '../../utils/constants/exports.dart';

final List<String> images = [
  'home decorating ideas things.jpg',
  'Renovation Journey_ Surprise At Every Turn.jpg',
  'kitchen home.jpg',
  'The Amour by Webb & Brown-Neaves.jpg',
];



final List<String> ContractorImages=[
  'Free Vector _ Isolated construction site with workers.jpg',
  'Home Improvement Contractor - Marwood Construction.jpg',
  'labor.jpg',
  'Work.jpg',
  'Electric line.jpg',
  'Wiring.jpg',
  'Geasure.jpg',
  'Kitchen.jpg',
  'Taps.jpg'
];


final List<String> category = [
  'Home constructor.jpg',
  'labrorer.jpg',
  'Local Sydney Electrician.jpg',
  'Plumber.jpg',
  'Painter.jpg',
  'Welder.jpg'
];
final List<String> CategoryText=[
  'Contractors',
  'Labrorers',
  'Electricians',
  'Plumbers',
  'Painters',
  'Welders'
];


// Define a class to represent services
///Used In detail Screen
class Service {
  final String name;
  final double price;

  Service(this.name, this.price);
}

class ConstructionDetails {
  List<ContractorDetails> contractors;
  List<LaborerDetails> laborers;
  List<ElectricianDetails> electricians;
  List<PlumberDetails> plumbers;
  List<PainterDetails> painters;
  List<WelderDetails> welders;

  ConstructionDetails({
    required this.contractors,
    required this.laborers,
    required this.electricians,
    required this.plumbers,
    required this.painters,
    required this.welders,
  });
}

// Create an instance of ConstructionDetails with the lists of details
ConstructionDetails constructionDetails = ConstructionDetails(
  contractors: contractors,
  laborers: laborer,
  electricians: electrition,
  plumbers: plumber,
  painters: painters,
  welders: welders,
);


class ContractorDetails{
  final String name;
  final String Images;
  final String description;
  final String rating;
  final String expertise;
  final String service1;
  final String service2;
  final String service3;
  final String services_detail1;
  final String services_detail2;
  final String services_detail3;
  final String amount1;
  final String amount2;
  final String amount3;
  final String Mobile_Number;
  final String Price;



  ContractorDetails({required this.name, required this.expertise,
    required this.rating,required this.Images,required this.description,required this.service1,
    required this.service2,required this.service3, required this.services_detail1,required this.services_detail2,
    required this.services_detail3, required this.amount1, required this.amount2, required this.amount3,
    required this.Mobile_Number,required this.Price
  });
}

class LaborerDetails {
  final String name;
  final String Images;
  final String description;
  final String rating;
  final String expertise;

  final String service1;
  final String service2;
  final String service3;
  final String services_detail1;
  final String services_detail2;
  final String services_detail3;
  final String amount1;
  final String amount2;
  final String amount3;
  final String Mobile_Number;
  final String Price;


  LaborerDetails({required this.name, required this.expertise,
    required this.rating,required this.Images,required this.description, required this.service1,
    required this.service2,required this.service3,required this.Price,
    required this.services_detail1,required this.services_detail2,required this.services_detail3,
    required this.amount1, required this.amount2, required this.amount3, required this.Mobile_Number,
  });
}

class ElectricianDetails {
  final String name;
  final String Images;
  final String description;
  final String rating;
  final String expertise;
  final String service1;
  final String service2;
  final String service3;
  final String services_detail1;
  final String services_detail2;
  final String services_detail3;
  final String amount1;
  final String amount2;
  final String amount3;
  final String Mobile_Number;
  final String Price;



  ElectricianDetails({required this.name, required this.expertise,
    required this.rating,required this.Images,required this.description, required this.service1,
    required this.service2,required this.service3,required this.Price,
    required this.services_detail1,required this.services_detail2,required this.services_detail3,
    required this.amount1, required this.amount2, required this.amount3, required this.Mobile_Number,
  });
}

class PlumberDetails {
  final String name;
  final String Images;
  final String description;
  final String rating;
  final String expertise;
  final String service1;
  final String service2;
  final String service3;
  final String services_detail1;
  final String services_detail2;
  final String services_detail3;
  final String amount1;
  final String amount2;
  final String amount3;
  final String Mobile_Number;
  final String Price;



  PlumberDetails({required this.name, required this.expertise,
    required this.rating,required this.Images,required this.description, required this.service1,
    required this.service2,required this.service3,required this.Price,
    required this.services_detail1,required this.services_detail2,required this.services_detail3,
    required this.amount1, required this.amount2, required this.amount3, required this.Mobile_Number,
  });
}

class PainterDetails{
  final String name;
  final String Images;
  final String description;
  final String rating;
  final String expertise;
  final String service1;
  final String service2;
  final String service3;
  final String services_detail1;
  final String services_detail2;
  final String services_detail3;
  final String amount1;
  final String amount2;
  final String amount3;
  final String Mobile_Number;
  final String Price;



  PainterDetails({required this.name, required this.expertise,
    required this.rating,required this.Images,required this.description,required this.service1,
    required this.service2,required this.service3, required this.services_detail1,required this.services_detail2,
    required this.services_detail3, required this.amount1, required this.amount2, required this.amount3,
    required this.Mobile_Number,required this.Price
  });
}

class WelderDetails{
  final String name;
  final String Images;
  final String description;
  final String rating;
  final String expertise;
  final String service1;
  final String service2;
  final String service3;
  final String services_detail1;
  final String services_detail2;
  final String services_detail3;
  final String amount1;
  final String amount2;
  final String amount3;
  final String Mobile_Number;
  final String Price;



  WelderDetails({required this.name, required this.expertise,
    required this.rating,required this.Images,required this.description,required this.service1,
    required this.service2,required this.service3, required this.services_detail1,required this.services_detail2,
    required this.services_detail3, required this.amount1, required this.amount2, required this.amount3,
    required this.Mobile_Number,required this.Price,
  });
}
