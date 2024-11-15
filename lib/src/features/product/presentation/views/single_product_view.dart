import 'package:flutter/material.dart';
import 'package:machine_test/src/features/product/provider/product_provider.dart';
import 'package:provider/provider.dart';

class SingleProductView extends StatefulWidget {
  const SingleProductView({super.key, required this.id});
  final String id;

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => context.read<ProductProvider>().getSingleProduct(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(provider.selectedProduct?.title ?? ''),
        ),
        body: provider.isloading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Container(
                    height: 200,
                    child: Image.network(provider.selectedProduct?.image ?? ""),
                  ),
                  Text(provider.selectedProduct?.title ?? ''),
                  Text(provider.selectedProduct?.price ?? ''),
                  Text(provider.selectedProduct?.category ?? ''),
                  Text(provider.selectedProduct?.description ?? ''),
                ],
              ),
      );
    });
  }
}
