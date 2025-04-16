import 'dart:io';
import 'dart:math';

//Hangman code

const wordList = [
    'abruptly','absurd','abyss','affix','askew',
    'avenue','awkward','axiom','azure','bagpipes'
    ];
const stages = [
    '''
  +---+
  |   |
  O   |
 /|\\  |
 / \\  |
      |
=========
''',
    '''
  +---+
  |   |
  O   |
 /|\\  |
      |
      |
=========
''',
    '''
  +---+
  |   |
  O   |
  |   |
      |
      |
=========
''',
    '''
  +---+
  |   |
  O   |
      |
      |
      |
=========
''',
    '''
  +---+
  |   |
      |
      |
      |
      |
=========
'''
  ];
int lives = stages.length;
String random_word = wordList[Random().nextInt(wordList.length)];

void main(){

List<String> guessedword = List.filled(random_word.length, '_');

print('Welcome to hangman game 🎮');
print('Your lives are 5 ❤❤❤❤❤');
print('Enter a letter to guess the word 🤩');
while(lives != 0)
{
  
  bool repeated_letter = false;
  String letter = stdin.readLineSync()!;

        if(random_word.contains(letter)){
        for(int i = 0; i < random_word.length; i++)
        {
               if(guessedword[i] == '_' && random_word[i] == letter){
                      print('Right guess 👏');
                      repeated_letter = true;
                      guessedword[i] = letter;
                      print_list(guessedword);
                      if(!guessedword.contains('_')){
                      print('Congratulation 🎉... You get the word🥳');
                      print('The word was ${random_word}');
                      break;
                      }
                    else
                        print('guess one more 🤔');
                      break;
               }        
          }
        }
        if(!repeated_letter || !random_word.contains(letter)){
          WrongGuess();
        }


  }
}

void WrongGuess(){
        lives--;
        if(lives != 0){
        print(stages[lives]);
        print_hearts(lives);
        print('\nWrong guess 😰');
        print('Try again!');
        }
        else{
          print(stages[0]);
          print('\nWrong guess 😑');
          print('Game Over 💔');
          print('The word was ${random_word}');
        }
}

void print_list(List<String> l){
  for(int i = 0 ; i < l.length; i++)
      stdout.write('${l[i]} ');
      print('\n');
}

void print_hearts(int lifes){
  for(int i= 0 ; i< lifes; i++)
    stdout.write('❤');
}
