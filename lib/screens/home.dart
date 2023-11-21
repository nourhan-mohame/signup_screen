import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup_screen/screens/loginscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(); // Const constructor

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String fname;

  @override
  void initState() {
    super.initState();
    _fetchName();
  }

  Future<void> _fetchName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Assuming 'username' is the key for the name in SharedPreferences
      fname = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothes Ecommerce App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Section
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome $fname',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Product List
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      // replace with the actual number of products
                      itemBuilder: (ctx, index) => Container(
                        width: 150,
                        margin: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://i5.walmartimages.com/seo/LWZWM-Workout-Tops-Men-80s-Clothing-Floral-Print-Pattern-Lapel-Short-Sleeve-Blouse-50s-Rockabilly-Yoga-Shirt-Vintage-Tees-Sport-Plus-Size-T-shirt-Kha_7d0466d8-b5ab-4f23-bb70-31c41215f0fa.b928447e15657d52b42ee4e48c5a6bf8.jpeg?odnHeight=432&odnWidth=320&odnBg=FFFFFF',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Featured Products Section
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Product Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    // to make it scrollable when needed
                    physics: const NeverScrollableScrollPhysics(),
                    // to disable scrolling
                    children: List.generate(10, (index) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://i5.walmartimages.com/seo/LWZWM-Workout-Tops-Men-80s-Clothing-Floral-Print-Pattern-Lapel-Short-Sleeve-Blouse-50s-Rockabilly-Yoga-Shirt-Vintage-Tees-Sport-Plus-Size-T-shirt-Kha_7d0466d8-b5ab-4f23-bb70-31c41215f0fa.b928447e15657d52b42ee4e48c5a6bf8.jpeg?odnHeight=432&odnWidth=320&odnBg=FFFFFF',
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // replace with the actual selected index
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black87),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black87),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black87),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.logout, color: Colors.black87),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('username');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Loginscreen(fname: '',)),
                );
              },
            ),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}