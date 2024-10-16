import 'dart:math';

class RandomCasino {
  static const List casinoItems = ["bar", "cerise", "cloche", "diamant", "pasteque", "sept", "fer-a-cheval"];

  String getRandomItem() {
    int randomIndex = Random().nextInt(casinoItems.length);
    return casinoItems[randomIndex];
  }
}