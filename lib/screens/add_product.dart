import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5346E0),
        title: Text('Add Products',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),),
        centerTitle: true,
        elevation: 0,

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 30,color: Colors.white,),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Product Name",
                    hintStyle: TextStyle(color: Colors.black, )

                ),
              ),

              SizedBox(height: 30),

              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.price_check_outlined),
                    hintText: "Price",
                    hintStyle: TextStyle(color: Colors.black, )

                ),
              ),

              SizedBox(height: 30),

              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.image),
                    hintText: "Image",
                    hintStyle: TextStyle(color: Colors.black, )

                ),
              ),

              SizedBox(height: 70),

              ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5346E0),
                  //padding: EdgeInsets.vertical(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Save Product',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              ),
            ],
          ),
        ),

      ),

    );
  }
}
