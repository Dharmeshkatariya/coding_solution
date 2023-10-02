import 'dart:io';
import 'dart:math';

void main() {
  final Random random = Random();
  final List<String> suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades'];
  final List<String> ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'];

  List<String> deck = [];
  List<String> playerHand = [];
  List<String> dealerHand = [];

  // Create a deck of cards
  for (String suit in suits) {
    for (String rank in ranks) {
      deck.add('$rank of $suit');
    }
  }

  // Shuffle the deck
  deck.shuffle(random);

  // Deal initial cards
  playerHand.add(deck.removeLast());
  dealerHand.add(deck.removeLast());
  playerHand.add(deck.removeLast());
  dealerHand.add(deck.removeLast());

  print("Welcome to Blackjack!");
  print("Your hand: ${playerHand.join(', ')}");
  print("Dealer's face-up card: ${dealerHand[1]}");

  while (true) {
    print("\n1. Hit");
    print("2. Stand");
    stdout.write("Choose an option: ");
    String choice = stdin.readLineSync() ?? '';

    if (choice == '1') {
      playerHand.add(deck.removeLast());
      print("Your hand: ${playerHand.join(', ')}");

      // Check if player busts
      if (calculateHandValue(playerHand) > 21) {
        print("Bust! You lose.");
        break;
      }
    } else if (choice == '2') {
      // Dealer's turn
      while (calculateHandValue(dealerHand) < 17) {
        dealerHand.add(deck.removeLast());
      }

      print("\nDealer's hand: ${dealerHand.join(', ')}");

      // Determine the winner
      int playerValue = calculateHandValue(playerHand);
      int dealerValue = calculateHandValue(dealerHand);

      if (dealerValue > 21 || playerValue > dealerValue) {
        print("You win!");
      } else if (playerValue < dealerValue) {
        print("Dealer wins.");
      } else {
        print("It's a tie!");
      }

      break;
    } else {
      print("Invalid choice. Please choose 1 (Hit) or 2 (Stand).");
    }
  }

  print("Thanks for playing Blackjack!");
}

int calculateHandValue(List<String> hand) {
  int value = 0;
  int numAces = 0;

  for (String card in hand) {
    if (card.contains('Ace')) {
      value += 11;
      numAces++;
    } else if (card.contains('King') || card.contains('Queen') || card.contains('Jack')) {
      value += 10;
    } else {
      value += int.parse(card.split(' ')[0]);
    }
  }

  // Adjust for Aces
  while (numAces > 0 && value > 21) {
    value -= 10;
    numAces--;
  }

  return value;
}
