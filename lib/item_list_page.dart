import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:intl/intl.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final NumberFormat numberFormat = NumberFormat('###,###,###,###');

  List<Product> productList = [
    Product(
        productNo: 1,
        productName: "노트북(Laptop)",
        productImageUrl: "https://picsum.photos/id/1/300/300",
        price: 600000),
    Product(
        productNo: 2,
        productName: "스마트폰(Phone)",
        productImageUrl: "https://picsum.photos/id/20/300/300",
        price: 500000),
    Product(
        productNo: 3,
        productName: "머그컵(Cup)",
        productImageUrl: "https://picsum.photos/id/30/300/300",
        price: 15000),
    Product(
        productNo: 4,
        productName: "키보드(Keyboard)",
        productImageUrl: "https://picsum.photos/id/60/300/300",
        price: 50000),
    Product(
        productNo: 5,
        productName: "포도(Grape)",
        productImageUrl: "https://picsum.photos/id/75/200/300",
        price: 75000),
    Product(
        productNo: 6,
        productName: "책(book)",
        productImageUrl: "https://picsum.photos/id/24/200/300",
        price: 24000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("제품 리스트"),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // 그리드를 어떻게 만들 것인지
            childAspectRatio: 0.9,
            crossAxisCount: 2, // 가로줄에 총 몇개를 둘 것인지
          ),
          itemBuilder: (context, index) {
            return productContainer(
              productName: productList[index].productName ??
                  "", // !를 쓰면 실행도중에 에러발생. null이 될 수도 있어서
              productImageUrl: productList[index].productImageUrl ?? "",
              price: productList[index].price ?? 0,
            );
          },
        ));
  }

  Widget productContainer({
    required String productName,
    required String productImageUrl,
    required double price,
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          CachedNetworkImage(
            height: 150,
            fit: BoxFit.cover,
            imageUrl: productImageUrl,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
            errorWidget: (context, url, error) {
              // 네트워크 오류 시
              return const Center(
                child: Text("오류 발생"),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              productName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text("${numberFormat.format(price)}원"),
          ),
        ],
      ),
    );
  }
}
