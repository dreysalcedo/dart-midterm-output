import 'dart:io';
import 'dart:math';
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart'; // to use Emoji utilities
Emoji scissors = Emoji.byChar(Emojis.scissors);
Emoji paper = Emoji.byChar(Emojis.rollOfPaper);
Emoji rock = Emoji.byChar(Emojis.rock);
int bot = 0;
int you= 0;

String Player(){
  print("Papel, Gunting, Bato! What's your Pick? ");
  String choice =  stdin.readLineSync().toUpperCase();
  var emoji = new Map();
  emoji['1']= paper;
  emoji['2']= rock;
  emoji['3']=scissors;
  switch(choice){
    case "PAPEL":
      return "Papel";
      break;
    case '1':
      return "Papel";
      break;
    case "BATO":
      return "Bato";
      break;
    case '2':
      return "Bato";
      break;
    case "GUNTING":
      return "Gunting";
      break;
    case '3':
      return "Gunting";
      break;
    default:
      return "quit";
      break;
  }
}
String Bot(){
  Random r= new Random();
  int choice = r.nextInt(3);
  switch(choice){
    case 0:
      return "Bato";
      break;
    case 1:
      return "Papel";
      break;
    case 2:
      return "Gunting";
      break;
  }
}

String Match(String Player, String Bot) {
  if (Player == Bot) { //if the same, it's a tie
    return "Tie";
  } else if (Player == "Papel" && Bot == "Bato") {
    print('$paper vs $rock');
    you++;
    return "You Win!";
  } else if (Player == "Gunting" && Bot == "Papel") {
    print('$scissors vs $paper');
    you++;
    return "You Win!";
  } else if (Player == "Bato" && Bot == "Gunting") {
    print('$rock vs $scissors');
    you++;
    return "You Win!";
    //--------------------------bot wins---------------
  } else if (Player == "Bato" && Bot == "Papel") {
    print('$rock vs $paper');
    bot++;
    return "Bot Wins!";
  } else if (Player == "Papel" && Bot == "Gunting") {
    print('$paper vs $scissors');
    bot++;
    return "Bot Wins!";
  } else if (Player == "Gunting" && Bot == "Bato") {
    print('$scissors vs $rock');
    bot++;
    return "Bot Wins!";
  }
  /*
  } else if (Bot == "Papel" && Player == "Bato") {
    print('$paper vs $rock');
    bot++;
    return "You Win!";
  } else if (Bot== "Gunting" && Player == "Papel") {
    print('$scissors vs $paper');
    bot++;
    return "You Win!";
  } else if(Bot == "Bato" && Player == "Gunting"){
    print('$rock vs $scissors');
    bot++;
    return "Bot Wins!";
  }
}
*/
}

void main(){
  while(true) {

    String playerMove = Player();
    if (playerMove == "Quit") {
      exit(0);
      return;
    }

    print("You played $playerMove");
    String computerMove = Bot();
    print("Bot played $computerMove");
    print(Match(playerMove, computerMove));
    print("You: $you Bot: $bot");
  }


}
