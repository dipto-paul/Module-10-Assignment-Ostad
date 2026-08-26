import 'package:flutter/material.dart';
import 'package:module10_assignment_ostad/controller/product_controller.dart';
import 'package:module10_assignment_ostad/model/product_model.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productQTYController = TextEditingController();

  ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Color(0xFF5346E0),

        title: Text(
          'Add Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),

        centerTitle: true,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),

          child: Column(
            children: [

              SizedBox(height: 30),

              // ================= PRODUCT NAME =================
              TextFormField(
                controller: productNameController,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  prefixIcon: Icon(
                    Icons.shopping_bag,
                  ),

                  hintText: "Product Name",

                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // ================= PRICE =================
              TextFormField(
                controller: productPriceController,

                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  prefixIcon: Icon(
                    Icons.price_check_outlined,
                  ),

                  hintText: "Price",

                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // ================= QUANTITY =================
              TextFormField(
                controller: productQTYController,

                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  prefixIcon: Icon(
                    Icons.production_quantity_limits,
                  ),

                  hintText: "QTY",

                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // ================= IMAGE =================
              TextFormField(
                controller: productImageController,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  prefixIcon: Icon(
                    Icons.image,
                  ),

                  hintText: "Image URL",

                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 70),

              // ================= SAVE BUTTON =================
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: () async {

                    // TextField থেকে value নিচ্ছি
                    String productName =
                        productNameController.text;

                    String productImage =
                        productImageController.text;

                    int productPrice =
                    int.parse(productPriceController.text);

                    int productQty =
                    int.parse(productQTYController.text);


                    // Data object তৈরি করছি
                    Data data = Data(
                      productName: productName,
                      img: productImage,
                      qty: productQty,
                      totalPrice: productPrice,
                    );


                    // Controller এর createProduct call করছি
                    bool result =
                    await productController.createProduct(data);


                    // যদি product successfully add হয়
                    if (result) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Product Added Successfully",
                          ),
                        ),
                      );

                      // HomePage এ ফিরে যাব
                      // true পাঠাচ্ছি যাতে HomePage বুঝতে পারে
                      // product add হয়েছে
                      Navigator.pop(context, true);

                    } else {

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Product Add Failed",
                          ),
                        ),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5346E0),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),

                    elevation: 0,
                  ),

                  child: Text(
                    'Save Product',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
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