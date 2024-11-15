import 'package:flutter/material.dart';
import 'package:machine_test/src/features/product/model/product_model.dart';
import 'package:machine_test/src/features/product/presentation/views/single_product_view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => SingleProductView(id: productModel.id.toString()))),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
            Container(
              height: 170,
              // width: 170,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(productModel.image!))),
            ),
            Text(productModel.title!),
            Text(productModel.price!),
          ],
        ),
      ),
    );
  }
}
