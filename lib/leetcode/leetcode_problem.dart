import 'dart:io';
import 'dart:math'; // Import the math library


class Interval {
  int start;
  int end;

  Interval(this.start, this.end);
}




class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val);
}








class LeetCodeProblem{
  int reverse(int x) {
    int result = 0;

    while (x != 0) {
      int digit = x % 10;
      x ~/= 10; // Integer division to remove the last digit
      if (result > (2147483647 - digit) ~/ 10 || result < (-2147483648 - digit) ~/ 10) {
        return 0; // Overflow or underflow occurred
      }
      result = result * 10 + digit;
    }

    return result;
  }

  void maprintstain() {
    int n = 5; // Change this value to adjust the size of the triangle

    for (int i = 1; i <= n; i++) {
      // Print spaces before stars
      for (int j = 1; j <= n - i; j++) {
        stdout.write(' ');
      }

      // Print stars
      for (int k = 1; k <= i; k++) {
        stdout.write('*');
      }

      // Move to the next line
      print('');
    }
  }


  List<List<String>> solveNQueens(int n) {
    List<List<String>> solutions = [];
    List<List<int>> board = List.generate(n, (_) => List<int>.filled(n, 0));

    void placeQueen(int row) {
      if (row == n) {
        solutions.add(generateSolution(board));
        return;
      }

      for (int col = 0; col < n; col++) {
        if (isSafe(board, row, col)) {
          board[row][col] = 1;
          placeQueen(row + 1);
          board[row][col] = 0;
        }
      }
    }

    placeQueen(0);
    return solutions;
  }

  bool isSafe(List<List<int>> board, int row, int col) {
    // Check if there's a queen in the same column
    for (int i = 0; i < row; i++) {
      if (board[i][col] == 1) {
        return false;
      }
    }

    // Check if there's a queen in the upper-left diagonal
    for (int i = row, j = col; i >= 0 && j >= 0; i--, j--) {
      if (board[i][j] == 1) {
        return false;
      }
    }

    // Check if there's a queen in the upper-right diagonal
    for (int i = row, j = col; i >= 0 && j < board.length; i--, j++) {
      if (board[i][j] == 1) {
        return false;
      }
    }

    return true;
  }

  List<String> generateSolution(List<List<int>> board) {
    List<String> solution = [];
    for (List<int> row in board) {
      String rowString = '';
      for (int cell in row) {
        rowString += (cell == 1) ? 'Q' : '.';
      }
      solution.add(rowString);
    }
    return solution;
  }

  ///
  //
  // void main() {
  //   List<int> nums = [1, 2, 3];
  //
  //   List<List<int>> permutations = permute(nums);
  //
  //   print("Permutations of $nums:");
  //   for (List<int> perm in permutations) {
  //     print(perm);
  //   }
  // }

  List<List<int>> permute(List<int> nums) {
    List<List<int>> result = [];

    void backtrack(int start) {
      if (start == nums.length) {
        result.add(List.from(nums));
        return;
      }

      for (int i = start; i < nums.length; i++) {
        // Swap elements at positions start and i
        int temp = nums[start];
        nums[start] = nums[i];
        nums[i] = temp;

        // Recursively generate permutations
        backtrack(start + 1);

        // Undo the swap for backtracking
        temp = nums[start];
        nums[start] = nums[i];
        nums[i] = temp;
      }
    }

    backtrack(0);
    return result;
  }

////emove Duplicates from Sorted Array
//
// Write a Dart function that removes duplicate elem
  int removeDuplicates(List<int> nums) {
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
  int countPrimes(int n) {
    if (n <= 2) {
      return 0;
    }

    List<bool> isPrime = List.filled(n, true);
    isPrime[0] = false;
    isPrime[1] = false;

    for (int i = 2; i * i < n; i++) {
      if (isPrime[i]) {
        for (int j = i * i; j < n; j += i) {
          isPrime[j] = false;
        }
      }
    }

    return isPrime.where((prime) => prime).length;
  }
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



  int maxProfit(List<int> prices) {
    int minPrice = prices[0];
    int maxProfit = 0;

    for (int i = 1; i < prices.length; i++) {
      if (prices[i] < minPrice) {
        minPrice = prices[i];
      } else {
        int profit = prices[i] - minPrice;
        maxProfit = max(maxProfit, profit); // Use max from dart:math
      }
    }

    return maxProfit;
  }


  String addBinary(String a, String b) {
    /// addd binary number for
    ///   String binary1 = "1010";
    //   String binary2 = "1011";
    int i = a.length - 1;
    int j = b.length - 1;
    int carry = 0;
    String result = '';

    while (i >= 0 || j >= 0 || carry > 0) {
      int digitA = i >= 0 ? int.parse(a[i]) : 0;
      int digitB = j >= 0 ? int.parse(b[j]) : 0;
      int sum = digitA + digitB + carry;

      result = (sum % 2).toString() + result;
      carry = sum ~/ 2;

      i--;
      j--;
    }

    return result;
  }


  int numIslands(List<List<String>> grid) {
    int count = 0;
    /// List<List<String>> grid = [
    //     ["1", "1", "1", "1", "0"],
    //     ["1", "1", "0", "1", "0"],
    //     ["1", "1", "0", "0", "0"],
    //     ["0", "0", "0", "0", "0"],
    //   ];

    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        if (grid[i][j] == '1') {
          count++;
          dfs(grid, i, j);
        }
      }
    }

    return count;
  }

  void dfs(List<List<String>> grid, int i, int j) {
    if (i < 0 || i >= grid.length || j < 0 || j >= grid[0].length || grid[i][j] == '0') {
      return;
    }

    grid[i][j] = '0';

    dfs(grid, i - 1, j);
    dfs(grid, i + 1, j);
    dfs(grid, i, j - 1);
    dfs(grid, i, j + 1);
  }


  int hammingDistance(int x, int y) {
    /// hamping distance for dataa
    int xorResult = x ^ y;
    int distance = 0;

    while (xorResult > 0) {
      if (xorResult & 1 == 1) {
        distance++;
      }
      xorResult >>= 1;
    }

    return distance;
  }
  bool isPerfectSquare(int num) {

    /// int num1 = 16;
    //   int num2 = 14;
    //
    //   print("$num1 is a Perfect Square: ${isPerfectSquare(num1)}"); // true
    //   print("$num2 is a Perfect Square: ${isPerfectSquare(num2)}"); // false
    int left = 1;
    int right = num;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2;
      int square = mid * mid;

      if (square == num) {
        return true;
      } else if (square < num) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return false;
  }







  List<List<int>> generatePascalsTriangle(int numRows) {

    /// genarete  pascal for develope  for that code rurn
    List<List<int>> triangle = [];

    for (int i = 0; i < numRows; i++) {
      List<int> row = [];
      for (int j = 0; j <= i; j++) {
        if (j == 0 || j == i) {
          row.add(1);
        } else {
          row.add(triangle[i - 1][j - 1] + triangle[i - 1][j]);
        }
      }
      triangle.add(row);
    }

    return triangle;
  }

  List<int> topKFrequent(List<int> nums, int k) {
    ///  List<int> nums = [1, 1, 1, 2, 2, 3];
    //   int k = 2;


    Map<int, int> numFrequency = {};
    for (int num in nums) {
      numFrequency[num] = (numFrequency[num] ?? 0) + 1;
    }

    List<int> uniqueNums = numFrequency.keys.toList();
    uniqueNums.sort((a, b) => numFrequency[b]! - numFrequency[a]!);

    return uniqueNums.sublist(0, k);
  }

  int subarraySum(List<int> nums, int k) {


    ///List<int> nums = [1, 1, 1];
    //   int k = 2;
    //
    //   int totalCount = subarraySum(nums, k);
    //   print("Total Subarrays with Sum $k: $totalCount"); // 2

    Map<int, int> prefixSumCount = {0: 1};
    int count = 0;
    int prefixSum = 0;

    for (int num in nums) {
      prefixSum += num;
      if (prefixSumCount.containsKey(prefixSum - k)) {
        count += prefixSumCount[prefixSum - k]!;
      }
      prefixSumCount[prefixSum] = (prefixSumCount[prefixSum] ?? 0) + 1;
    }

    return count;
  }


  int reverseBits(int n) {
    int result = 0;
    //// int n = 43261596;
    //   int reversed = reverseBits(n);
    //   print("Reversed Bits: $reversed"); // 964176192
    int power = 31;

    while (n != 0) {
      result += (n & 1) << power;
      n = n >> 1;
      power -= 1;
    }

    return result;
  }

  bool isPowerOfThree(int n) {

    /// taht code check its value power is 3  or not
    if (n <= 0) {
      return false;
    }

    while (n % 3 == 0) {
      n ~/= 3;
    }

    return n == 1;
  }
  List<int> mergeSortedArrays(List<int> nums1, int m, List<int> nums2, int n) {


    ///  List<int> nums1 = [1, 2, 3, 0, 0, 0];
    //   int m = 3;
    //   List<int> nums2 = [2, 5, 6];
    //   int n = 3;

    int i = m - 1;
    int j = n - 1;
    int k = m + n - 1;

    while (i >= 0 && j >= 0) {
      if (nums1[i] > nums2[j]) {
        nums1[k--] = nums1[i--];
      } else {
        nums1[k--] = nums2[j--];
      }
    }

    while (j >= 0) {
      nums1[k--] = nums2[j--];
    }

    return nums1;
  }

  String convertToTitle(int columnNumber) {
    String result = '';
    ////  int columnNumber1 = 1;
    //   int columnNumber2 = 28;
    //   int columnNumber3 = 701;

    while (columnNumber > 0) {
      columnNumber--;
      int remainder = columnNumber % 26;
      result = String.fromCharCode('A'.codeUnitAt(0) + remainder) + result;
      columnNumber ~/= 26;
    }

    return result;
  }

  int trap(List<int> height) {
    int left = 0;
    int right = height.length - 1;
    int leftMax = 0;
    int rightMax = 0;
    int trappedWater = 0;

    while (left < right) {
      if (height[left] < height[right]) {
        if (height[left] >= leftMax) {
          leftMax = height[left];
        } else {
          trappedWater += leftMax - height[left];
        }
        left++;
      } else {
        if (height[right] >= rightMax) {
          rightMax = height[right];
        } else {
          trappedWater += rightMax - height[right];
        }
        right--;
      }
    }

    return trappedWater;
  }

  //
  // void main() {
  //   int n = 3;
  //   List<String> validParentheses = generateParenthesis(n);
  //
  //   print("Valid combinations of $n pairs of parentheses:");
  //   for (String parentheses in validParentheses) {
  //     print(parentheses);
  //   }
  // }


  List<String> generateParenthesis(int n) {
    List<String> result = [];
    generate(result, "", n, n);
    return result;
  }

  void generate(List<String> result, String current, int open, int close) {
    if (open == 0 && close == 0) {
      result.add(current);
      return;
    }

    if (open > 0) {
      generate(result, "$current(", open - 1, close);
    }

    if (close > open) {
      generate(result, "$current)", open, close - 1);
    }
  }









  // void main() {
  //   String input = "abcabcbb";
  //   int result = lengthOfLongestSubstring(input);
  //   print("Longest substring without repeating characters: $result");
  // }
  int lengthOfLongestSubstring(String s) {
    if (s.isEmpty) return 0;

    Map<String, int> charIndexMap = {};
    int maxLength = 0;
    int startIndex = 0;

    for (int endIndex = 0; endIndex < s.length; endIndex++) {
      String currentChar = s[endIndex];

      if (charIndexMap.containsKey(currentChar) && charIndexMap[currentChar]! >= startIndex) {
        startIndex = charIndexMap[currentChar]! + 1;
      }

      charIndexMap[currentChar] = endIndex;
      int currentLength = endIndex - startIndex + 1;
      maxLength = maxLength > currentLength ? maxLength : currentLength;
    }

    return maxLength;
  }


  // Create two sample linked lists representing numbers:
  // l1: 2 -> 4 -> 3 (represents the number 342)
  // // l2: 5 -> 6 -> 4 (represents the number 465)
  // ListNode l1 = ListNode(2);
  // l1.next = ListNode(4);
  // l1.next!.next = ListNode(3);
  //
  // ListNode l2 = ListNode(5);
  // l2.next = ListNode(6);
  // l2.next!.next = ListNode(4);
  //
  // print("Linked List 1:");
  // printLinkedList(l1);
  //
  // print("Linked List 2:");
  // printLinkedList(l2);
  //
  // ListNode? result = addTwoNumbers(l1, l2);
  //
  // print("Sum Linked List:");
  // printLinkedList(result);
  // le for a LeetCode problem. Let's solve the "Add Two Numbers" problem,
  // which involves adding two non-empty linked lists
  // representing two non-negative integers.
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode? dummyHead = ListNode(0);
    ListNode? current = dummyHead;
    int carry = 0;

    while (l1 != null || l2 != null) {
      int x = l1?.val ?? 0;
      int y = l2?.val ?? 0;

      int sum = carry + x + y;
      carry = sum ~/ 10;

      current!.next = ListNode(sum % 10);
      current = current.next!;

      if (l1 != null) l1 = l1.next;
      if (l2 != null) l2 = l2.next;
    }

    if (carry > 0) {
      current!.next = ListNode(carry);
    }

    return dummyHead.next;
  }






  //
  // void main() {
  //   // Create a sample linked list: 1 -> 2 -> 3 -> 4 -> 5
  //   ListNode head = ListNode(1);
  //   head.next = ListNode(2);
  //   head.next!.next = ListNode(3);
  //   head.next!.next!.next = ListNode(4);
  //   head.next!.next!.next!.next = ListNode(5);
  //
  //   print("Original Linked List:");
  //   printLinkedList(head);
  //
  //   ListNode? reversed = reverseLinkedList(head);
  //
  //   print("Reversed Linked List:");
  //   printLinkedList(reversed);
  // }


  ListNode? reverseLinkedList(ListNode? head) {
    ListNode? prev = null;
    ListNode? current = head;

    while (current != null) {
      ListNode? nextTemp = current.next;
      current.next = prev;
      prev = current;
      current = nextTemp;
    }

    return prev;
  }


  // void main() {
  //   List<Interval> intervals = [Interval(1, 3), Interval(2, 6), Interval(8, 10), Interval(15, 18)];
  //   List<Interval> merged = merge(intervals);
  //
  //   print("Merged Intervals:");
  //   for (Interval interval in merged) {
  //     print("[${interval.start}, ${interval.end}]");
  //   }
  // }

  // Merged Intervals:
  // [1, 6]
  // [8, 10]
  // [15, 18]

  // merge short for interval to creete for interval to check

  List<Interval> merge(List<Interval> intervals) {
    if (intervals.isEmpty) return [];

    intervals.sort((a, b) => a.start.compareTo(b.start));

    List<Interval> mergedIntervals = [intervals[0]];

    for (int i = 1; i < intervals.length; i++) {
      Interval currentInterval = intervals[i];
      Interval previousInterval = mergedIntervals.last;

      if (currentInterval.start <= previousInterval.end) {
        previousInterval.end = previousInterval.end > currentInterval.end ? previousInterval.end : currentInterval.end;
      } else {
        mergedIntervals.add(currentInterval);
      }
    }

    return mergedIntervals;
  }





// void main() {
//   String input = "abcabcbb";
//   int result = LeetCodeProblem .lengthOfLongestSubstring(input);
//   print("Length of the longest substring without repeating characters: $result");
// }
///
  /// give me as
  /// length of substring to tat code find
  static int lengthOfLongestSubstringd(String s) {
    if (s.isEmpty) return 0;

    Map<String, int> charIndexMap = {};
    int maxLength = 0;
    int start = 0;

    for (int end = 0; end < s.length; end++) {
      String currentChar = s[end];

      if (charIndexMap.containsKey(currentChar) && charIndexMap[currentChar]! >= start) {
        start = (charIndexMap[currentChar] !+ 1);
      }

      charIndexMap[currentChar] = end;
      int currentLength = end - start + 1;
      maxLength = maxLength > currentLength ? maxLength : currentLength;
    }

    return maxLength;
  }

///"Maximum Subarray" problem, which involves finding the contiguous subarray with the largest sum within an array of numbers.
  int maxSubArray(List<int> nums) {

    // void main() {
    //   List<int> nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
    //   int result = maxSubArray(nums);
    //   print("Maximum Subarray Sum: $result");
    // }
    if (nums.isEmpty) return 0;

    int maxSum = nums[0];
    int currentSum = nums[0];

    for (int i = 1; i < nums.length; i++) {
      currentSum = currentSum > 0 ? currentSum + nums[i] : nums[i];
      maxSum = maxSum > currentSum ? maxSum : currentSum;
    }

    return maxSum;
  }

  bool isValid(String s) {


    // void main() {
    //   String input = "{[()]}";
    //   bool result = isValid(input);
    //   print("Is the parentheses string valid? $result");
    // }


    final Map<String, String> parenthesesMap = {
      ')': '(',
      '}': '{',
      ']': '[',
    };

    final List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      final char = s[i];
      if (parenthesesMap.containsValue(char)) {
        stack.add(char);
      } else if (parenthesesMap.containsKey(char)) {
        if (stack.isEmpty || stack.last != parenthesesMap[char]) {
          return false;
        }
        stack.removeLast();
      }
    }

    return stack.isEmpty;
  }



}


