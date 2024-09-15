
import '../../controllers/favorite_controller.dart';
import '../../../../../utils/constants/exports.dart';


class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.find();
    final dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        title: Text('Favorites',style: CtextTheme.Welcomestyle),
        leading: IconButton(
            onPressed:(){
              Get.to(()=> HomeScreen());
            },
            icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Obx(() {
        final contractors = favoritesController.favoriteContractors;
        final laborers = favoritesController.favoriteLaborers;
        final electricians = favoritesController.favoriteElectricians;
        final plumbers = favoritesController.favoritePlumbers;
        final painters = favoritesController.favoritePainters;
        final welders = favoritesController.favoriteWelders;

        return ListView(
          padding: EdgeInsets.all(20),
          children: [
            ...contractors.map((contractor) => Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: ListTile(
                title: Text(contractor.name),
                subtitle: Text(contractor.description),
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    favoritesController.toggleFavoriteContractor(contractor);
                  },
                ),
              ),
            )),
            ...laborers.map((laborer) => ListTile(
              title: Text(laborer.name),
              subtitle: Text(laborer.description),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoritesController.toggleFavoriteLaborer(laborer);
                },
              ),
            )),
            ...electricians.map((electrician) => ListTile(
              title: Text(electrician.name),
              subtitle: Text(electrician.description),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoritesController.toggleFavoriteElectrician(electrician);
                },
              ),
            )),
            ...plumbers.map((plumber) => ListTile(
              title: Text(plumber.name),
              subtitle: Text(plumber.description),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoritesController.toggleFavoritePlumber(plumber);
                },
              ),
            )),
            ...painters.map((painter) => ListTile(
              title: Text(painter.name),
              subtitle: Text(painter.description),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoritesController.toggleFavoritePainter(painter);
                },
              ),
            )),
            ...welders.map((welder) => ListTile(
              title: Text(welder.name),
              subtitle: Text(welder.description),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favoritesController.toggleFavoriteWelder(welder);
                },
              ),
            )),

          ],
        );
      }),
    );
  }
}
