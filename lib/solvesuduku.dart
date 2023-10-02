bool solveSudoku(List<List<String>> board) {
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      if (board[row][col] == ".") {
        for (int num = 1; num <= 9; num++) {
          String numStr = num.toString();
          if (isValid(board, row, col, numStr)) {
            board[row][col] = numStr;
            if (solveSudoku(board)) {
              return true;
            }
            board[row][col] = ".";
          }
        }
        return false;
      }
    }
  }
  return true;
}

bool isValid(List<List<String>> board, int row, int col, String num) {
  for (int i = 0; i < 9; i++) {
    if (board[row][i] == num || board[i][col] == num || board[row - row % 3 + i ~/ 3][col - col % 3 + i % 3] == num) {
      return false;
    }
  }
  return true;
}

void printSudoku(List<List<String>> board) {
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      if (col == 8) {
        print(board[row][col]);
      } else {
        print(board[row][col] + " ");
      }
    }
  }
}

void main() {
  List<List<String>> sudokuBoard = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];

  print("Sudoku board before solving:");
  printSudoku(sudokuBoard);

  if (solveSudoku(sudokuBoard)) {
    print("\nSudoku board after solving:");
    printSudoku(sudokuBoard);
  } else {
    print("\nNo solution exists.");
  }
}
