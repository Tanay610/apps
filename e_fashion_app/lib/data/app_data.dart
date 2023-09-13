import 'package:e_fashion_app/model/base_model.dart';
import 'package:e_fashion_app/model/categories_model.dart';

List<CategoriesModel> categories = [
  CategoriesModel(
      imageUrl: "assets/images/todd-kent-QG756pvuQZ0-unsplash.jpg",
      title: "Kids"),
  CategoriesModel(
      imageUrl: "assets/images/tamara-bellis-1hDT7YDdMtw-unsplash.jpg",
      title: "Men"),
  CategoriesModel(
      imageUrl: "assets/images/pexels-pixabay-247298.jpg", title: "Women"),
  CategoriesModel(
      imageUrl: "assets/images/pexels-kha-ruxury-921646.jpg", title: "Shoes"),
  CategoriesModel(
      imageUrl: "assets/images/pexels-craig-adderley-1605177.jpg",
      title: "Bag"),
  CategoriesModel(
      imageUrl: "assets/images/pexels-chloe-1004642.jpg", title: "Glass"),
  CategoriesModel(
      imageUrl: "assets/images/pexels-athena-1758144.jpg", title: "Hat"),
];

List<BaseModel> mainList = [
  BaseModel(
      id: 1,
      imageUrl:
          "assets/images/clothes/viktor-nikolaienko-EU-xyudgHPc-unsplash.jpg",
      name: "Red Shirt",
      price: 300.99,
      review: 2.5,
      stars: 3.8,
      value: 1),
  BaseModel(
      id: 2,
      imageUrl: "assets/images/clothes/tobias-tullius-Fg15LdqpWrs-unsplash.jpg",
      name: "Orange Jacket",
      price: 200,
      review: 1.9,
      stars: 4.0,
      value: 1),
  BaseModel(
      id: 3,
      imageUrl: "assets/images/clothes/toa-heftiba-9PVUNBgqVRo-unsplash.jpg",
      name: "Women t-shirts",
      price: 400.99,
      review: 4.1,
      stars: 3.9,
      value: 1),
  BaseModel(
      id: 4,
      imageUrl: "assets/images/clothes/thai-an-kog39lmHguY-unsplash.jpg",
      name: "Blazer",
      price: 299.99,
      review: 3.7,
      stars: 3.5,
      value: 1),
  BaseModel(
      id: 5,
      imageUrl: "assets/images/clothes/tessa-simpson-eTCogYz7kQE-unsplash.jpg",
      name: "Leather Jackets",
      price: 599.99,
      review: 2.1,
      stars: 4.5,
      value: 1),
  BaseModel(
      id: 6,
      imageUrl: "assets/images/clothes/olivia-connell-GIJilzvYLP8-unsplash.jpg",
      name: "Denim shirt",
      price: 699.99,
      review: 1.7,
      stars: 4.7,
      value: 1),
];

List<BaseModel> itemsOnSearch = [];

List<BaseModel> itemsOncart = [];
