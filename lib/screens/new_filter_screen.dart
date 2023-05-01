import 'package:flutter/material.dart';
import 'package:hekkathon/model/price_model.dart';
import 'package:hekkathon/model/category_model.dart';

//import '../widgets/custom_category_filter.dart';
//import '../widgets/custom_price_filter.dart';

class NewFilterScreen extends StatelessWidget {
  const NewFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        backgroundColor: Color.fromARGB(255, 99, 87, 204),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Price',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          CustomPriceFilter(prices: Price.prices),
          Text(
            'Category',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          CustomCategoryFilter(categories: Category.categories),
        ]),
      ),
    );
  }
}

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;

  const CustomCategoryFilter({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categories[index].name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 25,
                child: Checkbox(value: false, onChanged: (bool? newValue) {}),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomPriceFilter extends StatelessWidget {
  final List<Price> prices;
  const CustomPriceFilter({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: prices
          .map((price) => InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(price.price),
                ),
              ))
          .toList(),
    );
  }
}