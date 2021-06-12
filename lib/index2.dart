import 'dart:math';

win(board) {
  //determines if a player has won, returns 0 otherwise.
  var wins = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  int i;
  for (i = 0; i < 8; ++i) {
    if (board[wins[i][0]] != 0 &&
        board[wins[i][0]] == board[wins[i][1]] &&
        board[wins[i][0]] == board[wins[i][2]]) return board[wins[i][2]];
  }
  return 0;
}

minimax(board, player) {
  //How is the position like for player (their turn) on board?
  int winner = win(board);
  if (winner != 0) return winner * player;

  int move = -1;
  int score = -2; //Losing moves are preferred to no move
  int i;
  for (i = 0; i < 9; ++i) {
    //For all moves,
    if (board[i] == 0) {
      //If legal,
      board[i] = player; //Try the move
      int thisScore = -minimax(board, player * -1);
      if (thisScore > score) {
        score = thisScore;
        move = i;
      } //Pick the one that's worst for the opponent
      board[i] = 0; //Reset board after try
    }
  }
  if (move == -1) return 0;
  return score;
}

computerMove(board) {
  int move = -1;
  int score = -2;
  int i;
  for (i = 0; i < 9; ++i) {
    if (board[i] == 0) {
      board[i] = 1;
      int tempScore = -minimax(board, -1);
      board[i] = 0;
      if (tempScore > score) {
        score = tempScore;
        move = i;
      }
    }
  }
  //returns a score based on minimax tree at a given node.
  board[move] = 1;
  return move;
}

getIndex(board, ai, lvl) {
  var temp_board = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  for (int i = 0; i < 9; i++) {
    if (board[i] == ai) {
      temp_board[i] = 1;
    } else if (board[i] == '') {
      temp_board[i] = 0;
    } else {
      temp_board[i] = -1;
    }
  }

  if (lvl == "Hard") {
    return computerMove(temp_board);
  } else if (lvl == "Easy") {
    Random random = new Random();
    int randomNumber = random.nextInt(8);
    while (temp_board[randomNumber] != 0) {
      randomNumber = random.nextInt(8);
    }
    return randomNumber;
  } else if (lvl == "Medium") {
    Random random = new Random();
    int randomNumber = random.nextInt(1);

    if (randomNumber == 0) {
      int randomNumber2 = random.nextInt(8);
      while (temp_board[randomNumber2] != 0) {
        randomNumber2 = random.nextInt(8);
      }
      return randomNumber2;
    } else if (randomNumber == 1) {
      return computerMove(temp_board);
    }
  }
}
