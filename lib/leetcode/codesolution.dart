






class CodeSolution{
  void rotate(List<List<int>> matrix) {
    int n = matrix.length;

    // Transpose the matrix
    for (int i = 0; i < n; i++) {
      for (int j = i; j < n; j++) {
        int temp = matrix[i][j];
        matrix[i][j] = matrix[j][i];
        matrix[j][i] = temp;
      }
    }

    // Reverse each row
    for (int i = 0; i < n; i++) {
      matrix[i].reversed ;
    }
  }
  // find duplicate
  List<int> findDuplicates(List<int> nums) {
    List<int> result = [];

    for (int num in nums) {
      int index = num.abs() - 1;
      if (nums[index] < 0) {
        result.add(index + 1);
      } else {
        nums[index] = -nums[index];
      }
    }

    for (int i = 0; i < nums.length; i++) {
      nums[i] = nums[i].abs();
    }

    return result;
  }

  List<int> intersection(List<int> nums1, List<int> nums2) {
    ///List<int> nums1 = [1, 2, 2, 1];
    //   List<int> nums2 = [2, 2];
    Set<int> set1 = nums1.toSet();
    Set<int> set2 = nums2.toSet();

    return set1.intersection(set2).toList();
  }

  int findPeakElement2D(List<List<int>> matrix) {

    ///List<List<int>> matrix = [
    //     [1, 4, 3],
    //     [3, 2, 6],
    //     [5, 8, 7],
    //   ];
    int numRows = matrix.length;
    int numCols = matrix[0].length;

    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        int current = matrix[i][j];
        bool isPeak = true;

        if (i > 0 && current < matrix[i - 1][j]) {
          isPeak = false;
        }

        if (i < numRows - 1 && current < matrix[i + 1][j]) {
          isPeak = false;
        }

        if (j > 0 && current < matrix[i][j - 1]) {
          isPeak = false;
        }

        if (j < numCols - 1 && current < matrix[i][j + 1]) {
          isPeak = false;
        }

        if (isPeak) {
          return current;
        }
      }
    }

    return -1; // No peak element found
  }

/// climb stair
  int climbStairs(int n) {
    if (n <= 2) {
      return n;
    }

    int prev1 = 1;
    int prev2 = 2;

    for (int i = 3; i <= n; i++) {
      int current = prev1 + prev2;
      prev1 = prev2;
      prev2 = current;
    }

    return prev2;
  }


  int numIslands(List<List<String>> grid) {

    /// List<List<String>> grid = [
    //     ['1', '1', '0', '0', '0'],
    //     ['1', '1', '0', '0', '0'],
    //     ['0', '0', '1', '0', '0'],
    //     ['0', '0', '0', '1', '1'],
    //   ];
    int numRows = grid.length;
    if (numRows == 0) return 0;
    int numCols = grid[0].length;

    int numIslands = 0;

    void dfs(int row, int col) {
      if (row < 0 || row >= numRows || col < 0 || col >= numCols || grid[row][col] == '0') {
        return;
      }

      grid[row][col] = '0'; // Mark the current cell as visited

      // Explore neighbors
      dfs(row - 1, col);
      dfs(row + 1, col);
      dfs(row, col - 1);
      dfs(row, col + 1);
    }

    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        if (grid[i][j] == '1') {
          numIslands++;
          dfs(i, j);
        }
      }
    }

    return numIslands;
  }

  double myPow(double x, int n) {
    if (n == 0) {
      return 1;
    }

    if (n < 0) {
      x = 1 / x;
      n = -n;
    }

    double result = 1;
    double currentProduct = x;

    for (int i = n; i > 0; i ~/= 2) {
      if (i % 2 == 1) {
        result *= currentProduct;
      }
      currentProduct *= currentProduct;
    }

    return result;
  }


  Map<T, int> countOccurrences<T>(List<T> list) {

    ///  List<String> words = ["apple", "banana", "apple", "cherry", "banana"];
    //   Map<String, int> wordCounts = countOccurrences(words);
    //   print("Word Occurrences: $wordCounts");

    Map<T, int> counts = {};

    for (T item in list) {
      counts[item] = (counts[item] ?? 0) + 1;
    }

    return counts;
  }



  ///  find all subsewtof for all
  List<List<int>> findSubsets(List<int> nums) {
    List<List<int>> subsets = [[]];

    for (int num in nums) {
      int subsetCount = subsets.length;
      for (int i = 0; i < subsetCount; i++) {
        List<int> newSubset = List<int>.from(subsets[i]);
        newSubset.add(num);
        subsets.add(newSubset);
      }
    }

    return subsets;
  }
}