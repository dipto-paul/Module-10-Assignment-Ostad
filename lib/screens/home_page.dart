import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  productDialog(){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Add Product"),
      content: Column(
        children: [

        ],
      ),

    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4382DF),
        title: Text('Products',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            iconSize: 36,
            color: Colors.white,
            icon: Icon(Icons.search), onPressed: (){
          },
          )
        ],
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu, size: 30,color: Colors.white,),
        ),
      ),

      body: GridView.builder(
          padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.80,
              ),

              itemCount: 10,
              itemBuilder: (context, index){

                return Column(
                  children: [
                    SizedBox(
                      child: Image.network('https://media.istockphoto.com/id/1412240771/photo/headphones-on-white-background.jpg?s=612x612&w=0&k=20&c=DwpnlOcMzclX8zJDKOMSqcXdc1E7gyGYgfX5Xr753aQ=')),

                    Text("Wireless Headphone", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),),

                    Text("Price: 300", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),),
                    SizedBox(height: 5,)
                  ],
                );
          }),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProduct(),
            ),
          );
        },
        child: Icon(Icons.add,),
      ),

    );
  }
}
