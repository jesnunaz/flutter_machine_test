import 'package:flutter/material.dart';
import 'package:machine_test/main.dart';
import 'package:machine_test/src/features/product/presentation/views/single_product_view.dart';
import 'package:machine_test/src/features/product/presentation/widgets/custom_textfield.dart';
import 'package:machine_test/src/features/product/presentation/widgets/product_card.dart';
import 'package:machine_test/src/features/product/provider/product_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => context.read<ProductProvider>().getProduct());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(builder: (context, provider, _) {
        return ListView.builder(itemCount: provider.products.length, itemBuilder: (c, i) => ProductCard(productModel: provider.products[i]));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addProduct(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  addProduct(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController categoryController = TextEditingController();

    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    controller: titleController,
                    hintText: 'Title',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: priceController,
                    hintText: 'Price',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: descriptionController,
                    hintText: 'description',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: imageController,
                    hintText: 'image',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: categoryController,
                    hintText: 'category',
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<ProductProvider>()
                            .addProduct(titleController.text, priceController.text, descriptionController.text, imageController.text, categoryController.text);
                        Navigator.pop(context);
                      },
                      child: const Text('Add Product'))
                ],
              ),
            ));
  }
}
