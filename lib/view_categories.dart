import 'package:flutter/material.dart';
import 'package:kwiz/pages/viewquizzes/view_quizzes.dart';
import 'package:kwiz/services/database.dart';
import 'package:kwiz/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kwiz/pages/home.dart';

//References: https://api.flutter.dev/flutter/material/AppBar-class.html
//Using this array to test the dynamic aspect of the page. This will be replaced by prompts from our database eventually...
var Categories = [
  'Cat 2',
  'Biology',
  'Comics',
  'Fashion',
  'Fiction',
  'Food',
  'Gaming',
  'Entertainment',
  'History',
  'Holidays',
  'Languages',
  'Mathematics',
  'Music',
  'Science',
  'Sport',
  'Politics',
  'Technology',
  'Transport'
];

//References: https://api.flutter.dev/flutter/material/AppBar-class.html
//Using this array to test the dynamic aspect of the page. This will be replaced by prompts from our database eventually...
class ViewCategories extends StatefulWidget {
  //const ViewCategoriesScreen({super.key});

  @override
  //State<ViewCategoriesScreen> createState() => _ViewCategoriesState();
  _ViewCategoriesState createState() => _ViewCategoriesState();
}

class _ViewCategoriesState extends State<ViewCategories> {
  DatabaseService service = DatabaseService();
  List? categories;
  int CatLength = 0;

  Future<void> loaddata() async {
    categories = await service.getCategories();
    CatLength = categories!.length;
  }

  @override
  void initState() {
    super.initState();
    loaddata().then((value) {
      setState(() {});
    });
  }
    bool shadowColor = false;
    double? scrolledUnderElevation;
    final TextEditingController _searchController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      //final ColorScheme colorScheme = Theme.of(context).colorScheme;
      //final Color oddItemColor = colorScheme.primary.withOpacity(0.10);
      //final Color evenItemColor = colorScheme.primary.withOpacity(0.30);
      //Search bar reference: https://flutterassets.com/search-bar-in-flutter/
      //Scaffold consists of: An app bar that contains the Home button and Search box , the body that has a gridview
      return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 140,
                    height: 70,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(width: 1.0, color: Colors.white),
                        //primary: Colors.green,
                        textStyle: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                                              ); */
                      },
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 32,
                      ),
                      label: const Text(
                        'Home',
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search Categories',
                        // Add a clear button to the search bar
                        suffixIcon: IconButton(
                          icon:
                              Icon(Icons.clear, color: Colors.black, size: 32),
                          onPressed: () => _searchController.clear(),
                        ),
                        // Add a search icon or button to the search bar
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Perform the search here
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide:
                              BorderSide(width: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: GridView.builder(
                    itemCount: CatLength,
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final Color color =
                          Colors.primaries[index % Colors.primaries.length];
                      return GestureDetector(
                        //This onTap is just to check if tapping on the cards works or not
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewQuizzes(
                                    chosenCategory: categories?[index])),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(width: 2),
                            color: color,
                          ),
                          child: Text(
                            categories?[index],
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(1.0)),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    }
  }