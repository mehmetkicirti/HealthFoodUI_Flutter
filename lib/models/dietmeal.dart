class DietMeal {
  String imagePath;
  String mealName;
  String price;
  int calorie;
  int weight;
  List<String> vitamins;

  DietMeal(
      {this.imagePath,
      this.mealName,
      this.price,
      this.calorie,
      this.weight,
      this.vitamins});
}

final meals = [
  DietMeal(
    imagePath: "assets/plate1.png",
    mealName:"Special 1",
    calorie: 312,
    price: "\$25.00",
    vitamins: ["A+","B+","B2"],
    weight: 250
  ),
  DietMeal(
      imagePath: "assets/plate2.png",
      mealName:"Special 2",
      calorie: 350,
      price: "\$29.00",
      vitamins: ["C"],
      weight: 320
  ),
  DietMeal(
      imagePath: "assets/plate3.png",
      mealName:"Special 3",
      calorie: 392,
      price: "\$22.00",
      vitamins: ["A+","B+","B2","B1","A3"],
      weight: 190
  ),
  DietMeal(
      imagePath: "assets/plate4.png",
      mealName:"Avocado Bowl",
      calorie: 272,
      price: "\$17.00",
      vitamins: ["D"],
      weight: 182
  ),
  DietMeal(
      imagePath: "assets/plate5.png",
      mealName:"Spring Bowl",
      calorie: 254,
      price: "\$21.50",
      vitamins: ["B","B2"],
      weight: 200
  ),
  DietMeal(
      imagePath: "assets/plate6.png",
      mealName:"Berry Bowl",
      calorie: 261,
      price: "\$28.70",
      vitamins: ["B3","C"],
      weight: 320
  )
];
