import 'dart:math';



class ComplexLeetCodeConverter {


  bool isPalindrome(String s) {
    // Remove non-alphanumeric characters and convert to lowercase.
    s = s.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();

    int left = 0;
    int right = s.length - 1;

    while (left < right) {
      if (s[left] != s[right]) {
        return false;
      }
      left++;
      right--;
    }

    return true;
  }



  List<int> mergeSortedArrays(List<int> nums1, int m, List<int> nums2, int n) {
    // you are given two sorted arrays, and you need to merge them into one sorted array.

    //
    // void main() {
    //   List<int> nums1 = [1, 2, 3, 0, 0, 0]; // Change this to the first sorted array.
    //   int m = 3;
    //   List<int> nums2 = [2, 5, 6]; // Change this to the second sorted array.
    //   int n = 3;
    //
    //   List<int> mergedArray = mergeSortedArrays(nums1, m, nums2, n);
    //
    //   print("Merged Array: $mergedArray");
    // }

    int index1 = m - 1;
    int index2 = n - 1;
    int currentIndex = m + n - 1;

    while (index1 >= 0 && index2 >= 0) {
      if (nums1[index1] > nums2[index2]) {
        nums1[currentIndex] = nums1[index1];
        index1--;
      } else {
        nums1[currentIndex] = nums2[index2];
        index2--;
      }
      currentIndex--;
    }

    while (index2 >= 0) {
      nums1[currentIndex] = nums2[index2];
      index2--;
      currentIndex--;
    }

    return nums1;
  }



  // "Remove Duplicates from Sorted Array" problem. In this problem, you are given a sorted array, and your task is to modify the array in-place such that duplicates are removed, and you return the new length of the modified array
  int removeDuplicates(List<int> nums) {


    ///
    // void main() {
    //   List<int> sortedArray = [1, 1, 2, 2, 2, 3, 4, 4, 5]; // Change this to the input array.
    //
    //   int newLength = removeDuplicates(sortedArray);
    //
    //   print("Modified Array: ${sortedArray.sublist(0, newLength)}");
    //   print("New Length: $newLength");
    // }
    if (nums.isEmpty) {
      return 0;
    }

    int uniqueIndex = 0;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] != nums[uniqueIndex]) {
        uniqueIndex++;
        nums[uniqueIndex] = nums[i];
      }
    }

    return uniqueIndex + 1;
  }

  // Certainly! Here's a Dart code example for solving the "Maximum Subarray" problem, also known as Kadane's Algorithm. In this problem, you are given an array of integers, and you need to find the contiguous subarray (containing at least one number) that has the largest sum.


  int maxSubArray(List<int> nums) {

    // void main() {
    //   List<int> numbers = [-2, 1, -3, 4, -1, 2, 1, -5, 4]; // Change this to the input array.
    //
    //   int maxSubarraySum = maxSubArray(numbers);
    //
    //   print("Maximum subarray sum: $maxSubarraySum");
    // }


    int maxSum = nums[0]; // Initialize maxSum with the first element.
    int currentSum = nums[0]; // Initialize currentSum with the first element.

    for (int i = 1; i < nums.length; i++) {
      // Choose the maximum between the current element and the sum of the current element and the previous subarray.
      currentSum = (nums[i] > currentSum + nums[i]) ? nums[i] : currentSum + nums[i];

      // Update maxSum if the currentSum is greater.
      maxSum = (maxSum > currentSum) ? maxSum : currentSum;
    }

    return maxSum;
  }




  int findMissingNumber(List<int> nums) {


    // void main() {
    //   List<int> numbers = [3, 0, 1, 4, 6, 2]; // Change this to the input array.
    //
    //   int missingNumber = findMissingNumber(numbers);
    //
    //   print("The missing number is: $missingNumber");
    // }
    int n = nums.length;
    int totalSum = (n * (n + 1)) ~/ 2; // Sum of all numbers from 0 to n.

    int actualSum = 0;
    for (int num in nums) {
      actualSum += num;
    }

    return totalSum - actualSum;
  }



  void fizzBuzz(int n) {
   //Certainly! Here's another Dart code example for solving a common coding problem:
    /// "FizzBuzz." In this problem, you need to print numbers from 1 to n, but for multiples of 3, print "Fizz,"
    ///for multiples of 5, print "Buzz,"
    /// and for multiples of both 3 and 5, print "FizzBuzz."

    for (int i = 1; i <= n; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        print("FizzBuzz");
      } else if (i % 3 == 0) {
        print("Fizz");
      } else if (i % 5 == 0) {
        print("Buzz");
      } else {
        print(i);
      }
    }
  }

  String reverseString(String s) {
    // Use Dart's split(), join() and reversed() methods to reverse the string.
    return s.split('').reversed.join('');
  }

  String longestPalindrome(String s) {
    //
    // void main() {
    //   String input = "babad";
    //
    //   String result = longestPalindrome(input);
    //
    //   print("Longest palindromic substring: $result");
    // }

    if (s.isEmpty) return "";

    int start = 0;
    int end = 0;

    for (int i = 0; i < s.length; i++) {
      int len1 = expandAroundCenter(s, i, i);
      int len2 = expandAroundCenter(s, i, i + 1);
      int maxLength = max(len1, len2);

      if (maxLength > end - start) {
        start = i - (maxLength - 1) ~/ 2;
        end = i + maxLength ~/ 2;
      }
    }

    return s.substring(start, end + 1);
  }

  int expandAroundCenter(String s, int left, int right) {
    while (left >= 0 && right < s.length && s[left] == s[right]) {
      left--;
      right++;
    }
    return right - left - 1;
  }

  int combinationSum4(List<int> nums, int target) {
    // void main() {
    //   List<int> nums = [1, 2, 3];
    //   int target = 4;
    //
    //   int result = combinationSum4(nums, target);
    //
    //   print("Number of combinations to reach $target: $result");
    // }

    List<int> dp = List.filled(target + 1, 0);
    dp[0] = 1; // There is one way to reach target 0.

    for (int i = 1; i <= target; i++) {
      for (int num in nums) {
        if (i - num >= 0) {
          dp[i] += dp[i - num];
        }
      }
    }

    return dp[target];
  }

//Certainly! Here's a Dart code example for a unique problem: "Minimum Path Sum." In this problem, you're given a grid filled with non-negative numbers, and you need to find a path from the top-left corner to the bottom-right corner that minimizes the sum of all numbers along its path.
  int minPathSum(List<List<int>> grid) {
    // void main() {
    //   List<List<int>> grid = [
    //     [1, 3, 1],
    //     [1, 5, 1],
    //     [4, 2, 1]
    //   ];
    //
    //   int result = minPathSum(grid);
    //
    //   print("Minimum path sum: $result");
    // }

    if (grid.isEmpty || grid[0].isEmpty) {
      return 0;
    }

    int m = grid.length;
    int n = grid[0].length;

    // Initialize a 2D array to store the minimum path sum values.
    List<List<int>> dp = List.generate(m, (i) => List.filled(n, 0));

    // Initialize the first cell with the grid value.
    dp[0][0] = grid[0][0];

    // Initialize the first row and first column.
    for (int i = 1; i < m; i++) {
      dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    for (int j = 1; j < n; j++) {
      dp[0][j] = dp[0][j - 1] + grid[0][j];
    }

    // Fill in the rest of the dp table.
    for (int i = 1; i < m; i++) {
      for (int j = 1; j < n; j++) {
        dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1]);
      }
    }

    // The bottom-right cell contains the minimum path sum.
    return dp[m - 1][n - 1];
  }

  bool exist(List<List<String>> board, String word) {
    // void main() {
    //   List<List<String>> board = [
    //     ["A", "B", "C", "E"],
    //     ["S", "F", "C", "S"],
    //     ["A", "D", "E", "E"]
    //   ];
    //
    //   String word = "ABCCED";
    //
    //   if (exist(board, word)) {
    //     print("The word '$word' exists in the board.");
    //   } else {
    //     print("The word '$word' does not exist in the board.");
    //   }
    // }

    for (int row = 0; row < board.length; row++) {
      for (int col = 0; col < board[0].length; col++) {
        if (search(board, row, col, word, 0)) {
          return true;
        }
      }
    }
    return false;
  }

  bool search(
      List<List<String>> board, int row, int col, String word, int index) {
    if (index == word.length) {
      return true;
    }

    if (row < 0 ||
        row >= board.length ||
        col < 0 ||
        col >= board[0].length ||
        board[row][col] != word[index]) {
      return false;
    }

    final char = board[row][col];
    board[row][col] = "#"; // Mark the cell as visited.

    final isFound = search(board, row + 1, col, word, index + 1) ||
        search(board, row - 1, col, word, index + 1) ||
        search(board, row, col + 1, word, index + 1) ||
        search(board, row, col - 1, word, index + 1);

    board[row][col] = char; // Restore the cell.

    return isFound;
  }
}
