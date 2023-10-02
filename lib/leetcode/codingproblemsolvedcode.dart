
import 'dart:collection';
import 'dart:ffi';
import 'dart:io';

class Interval {
  int start;
  int end;

  Interval(this.start, this.end);
}


class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val, [this.next]);


}



class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}










class CodingProblem {
///  find big elemnt for using that code for fdart
  ///  

  int findPeakElement(List<int> nums) {
    int left = 0;
    int right = nums.length - 1;

    while (left < right) {
      int mid = left + (right - left) ~/ 2;

      if (nums[mid] > nums[mid + 1]) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }

    return left;
  }

///  find missing possiing number
  int firstMissingPositive(List<int> nums) {
    int n = nums.length;

    for (int i = 0; i < n; i++) {
      while (nums[i] > 0 &&
          nums[i] <= n &&
          nums[i] != nums[nums[i] - 1]) {
        int temp = nums[i];
        nums[i] = nums[temp - 1];
        nums[temp - 1] = temp;
      }
    }

    for (int i = 0; i < n; i++) {
      if (nums[i] != i + 1) {
        return i + 1;
      }
    }

    return n + 1;
  }

  ///  rotate array
  ///

  List<int> rotateArray(List<int> arr, int steps) {
    int n = arr.length;
    List<int> result = List<int>.filled(n, 0);

    for (int i = 0; i < n; i++) {
      int newIndex = (i + steps) % n;
      result[newIndex] = arr[i];
    }

    return result;
  }
  List<int> mergeSort(List<int> arr) {
    if (arr.length <= 1) {
      return arr;
    }

    int middle = arr.length ~/ 2;
    List<int> left = arr.sublist(0, middle);
    List<int> right = arr.sublist(middle);

    List<int> merge(List<int> left, List<int> right) {
      List<int> result = [];
      int i = 0, j = 0;
      while (i < left.length && j < right.length) {
        if (left[i] < right[j]) {
          result.add(left[i]);
          i++;
        } else {
          result.add(right[j]);
          j++;
        }
      }
      result.addAll(left.sublist(i));
      result.addAll(right.sublist(j));
      return result;
    }

    return merge(mergeSort(left), mergeSort(right));
  }

  ///  Find the First Non-Repeating Character
  String firstNonRepeatingChar(String str) {
    Map<String, int> charCount = {};

    for (String char in str.split('')) {
      charCount[char] = (charCount[char] ?? 0) + 1;
    }

    for (String char in str.split('')) {
      if (charCount[char] == 1) {
        return char;
      }
    }

    return ""; // No non-repeating character found
  }

  int countSubstringsWithPattern(String str, String pattern) {
    int count = 0;
    for (int i = 0; i <= str.length - pattern.length; i++) {
      String sub = str.substring(i, i + pattern.length);
      if (sub == pattern) {
        count++;
      }
    }
    return count;
  }

///  reverse word in string  list of arraya
  String reverseWords(String str) {
    List<String> words = str.split(' ');
    words = words.reversed.toList();
    return words.join(' ');
  }
//// cal power of any number
  double power(double base, int exponent) {
    if (exponent == 0) {
      return 1;
    }
    return base * power(base, exponent - 1);
  }
  void selectionSort(List<int> arr) {
    for (int i = 0; i < arr.length - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[j] < arr[minIndex]) {
          minIndex = j;
        }
      }
      if (minIndex != i) {
        // Swap elements
        int temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
      }
    }
  }

  List<int> mergeSortedArrays(List<int> arr1, List<int> arr2) {
    List<int> merged = [];
    int i = 0, j = 0;

    while (i < arr1.length && j < arr2.length) {
      if (arr1[i] < arr2[j]) {
        merged.add(arr1[i]);
        i++;
      } else {
        merged.add(arr2[j]);
        j++;
      }
    }

    // Add any remaining elements from both arrays
    while (i < arr1.length) {
      merged.add(arr1[i]);
      i++;
    }
    while (j < arr2.length) {
      merged.add(arr2[j]);
      j++;
    }

    return merged;
  }
  List<int> areAnagrams(String str1, String str2) {
    str1 = str1.toLowerCase();
    str2 = str2.toLowerCase();
    return str1.runes.toList();
  }


///  findroblem: Find the GCD (Greatest Common Divisor)
  int findGCD(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }


  int sumOfDigits(int number) {

    //// int num = 12345;
    //  soem sum all digit number to saved nd write sime ocde for me to crte geneated
    int sum = 0;
    while (number > 0) {
      sum += number % 10;
      number ~/= 10; // Integer division to remove the last digit
    }
    return sum;
  }



  bool isPrime(int n) {
    if (n <= 1) {
      return false;
    }
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  int countVowels(String str) {
    str = str.toLowerCase(); // Convert to lowercase to handle uppercase vowels
    int count = 0;
    for (int i = 0; i < str.length; i++) {
      if ('aeiou'.contains(str[i])) {
        count++;
      }
    }
    return count;
  }

  /// counting shoring for dart flutter write sorting alogorithm to sorintg
  /// count short for result
  ///  List<int> input = [4, 2, 2, 8, 3, 3, 1];
  //   List<int> sorted = countingSort(input);
  List<int> countingSort(List<int> arr) {
    // Find the maximum value in the input array
    int max = arr.reduce((a, b) => a > b ? a : b);

    // Create a counting array to store the count of each element
    List<int> countArray = List<int>.filled(max + 1, 0);

    // Populate the counting array
    for (int i = 0; i < arr.length; i++) {
      countArray[arr[i]]++;
    }

    // Reconstruct the sorted array from the counting array
    List<int> sortedArray = [];
    for (int i = 0; i <= max; i++) {
      while (countArray[i] > 0) {
        sortedArray.add(i);
        countArray[i]--;
      }
    }

    return sortedArray;
  }

  ///  find number
  List<int> sieveOfEratosthenes(int n) {
    List<bool> isPrime = List<bool>.filled(n + 1, true);
    isPrime[0] = false;
    isPrime[1] = false;

    for (int p = 2; p * p <= n; p++) {
      if (isPrime[p]) {
        for (int i = p * p; i <= n; i += p) {
          isPrime[i] = false;
        }
      }
    }

    List<int> primes = [];
    for (int i = 2; i <= n; i++) {
      if (isPrime[i]) {
        primes.add(i);
      }
    }

    return primes;
  }

  int bookbinarySearch(List<Book> sortedList, Book target) {
    int left = 0;
    int right = sortedList.length - 1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2; // Calculate the middle index

      int compareResult = target.title.compareTo(sortedList[mid].title);

      if (compareResult == 0) {
        return mid; // Found the target, return its index
      } else if (compareResult > 0) {
        left = mid + 1; // Target is in the right half
      } else {
        right = mid - 1; // Target is in the left half
      }
    }

    return -1; // Target not found in the list
  }

  int binarySearchWithSortedList(List<String> sortedList, String target) {
    int left = 0;
    int right = sortedList.length - 1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2; // Calculate the middle index

      int compareResult = target.compareTo(sortedList[mid]);

      if (compareResult == 0) {
        return mid; // Found the target, return its index
      } else if (compareResult > 0) {
        left = mid + 1; // Target is in the right half
      } else {
        right = mid - 1; // Target is in the left half
      }
    }

    return -1; // Target not found in the list
  }
  int linearSearch(List<int> list, int target) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == target) {
        return i; // Found the target, return its index
      }
    }
    return -1; // Target not found in the list
  }


  int binarySearch(List<int> sortedList, int target) {
    int left = 0;
    int right = sortedList.length - 1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2; // Calculate the middle index

      if (sortedList[mid] == target) {
        return mid; // Found the target, return its index
      } else if (sortedList[mid] < target) {
        left = mid + 1; // Target is in the right half
      } else {
        right = mid - 1; // Target is in the left half
      }
    }

    return -1; // Target not found in the list
  }

  int simpleArraySum(List<int> ar) {
    return ar.reduce((a, b) => a + b);
  }
  int findMax(List<int> numbers) {
    if (numbers.isEmpty) {
      throw Exception('List is empty');
    }

    int max = numbers[0];

    for (int number in numbers) {
      if (number > max) {
        max = number;
      }
    }

    return max;
  }

  ///  find for me factorial for return int
  int factorial(int n) {
    if (n == 0) {
      return 1; // Factorial of 0 is 1 by convention.
    } else {
      int result = 1;
      for (int i = 1; i <= n; i++) {
        result *= i;
      }
      return result;
    }
  }




  int findMaxElementinlist(List<int> numbers) {
    if (numbers.isEmpty) {
      throw ArgumentError("The list is empty.");
    }

    int max = numbers[0];

    for (int number in numbers) {
      if (number > max) {
        max = number;
      }
    }

    return max;
  }

  int findMinElement(List<int> numbers) {
    if (numbers.isEmpty) {
      throw ArgumentError("The list is empty.");
    }

    int min = numbers[0];

    for (int number in numbers) {
      if (number < min) {
        min = number;
      }
    }

    return min;
  }


  /// find commnet element
  ///
  List<int> findCommonElements(List<List<int>> lists) {
    if (lists.isEmpty) {
      return [];
    }

    // Convert the first list to a set for efficient lookups.
    Set<int> commonElements = Set<int>.from(lists[0]);

    for (int i = 1; i < lists.length; i++) {
      Set<int> currentSet = Set<int>.from(lists[i]);
      commonElements = commonElements.intersection(currentSet);
    }

    return commonElements.toList();
  }

 //// traget valu in my list
  bool containsValue(List<int> numbers, int targetValue) {
    for (int number in numbers) {
      if (number == targetValue) {
        return true;
      }
    }
    return false;
  }


  String longestPalindrome(String s) {
    if (s.isEmpty) {
      return "";
    }

    int start = 0;
    int end = 0;

    for (int i = 0; i < s.length; i++) {
      int len1 = expandAroundCenter(s, i, i);
      int len2 = expandAroundCenter(s, i, i + 1);
      int maxLen = len1 > len2 ? len1 : len2;

      if (maxLen > end - start) {
        start = i - (maxLen - 1) ~/ 2;
        end = i + maxLen ~/ 2;
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


  int trap(List<int> height) {
    int volume = 0;
    int left = 0;
    int right = height.length - 1;
    int leftMax = 0;
    int rightMax = 0;

    while (left < right) {
      if (height[left] < height[right]) {
        if (height[left] > leftMax) {
          leftMax = height[left];
        } else {
          volume += leftMax - height[left];
        }
        left++;
      } else {
        if (height[right] > rightMax) {
          rightMax = height[right];
        } else {
          volume += rightMax - height[right];
        }
        right--;
      }
    }

    return volume;
  }


  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    List<int> mergedArray = [];
    int i = 0, j = 0;

    while (i < nums1.length && j < nums2.length) {
      if (nums1[i] < nums2[j]) {
        mergedArray.add(nums1[i]);
        i++;
      } else {
        mergedArray.add(nums2[j]);
        j++;
      }
    }

    while (i < nums1.length) {
      mergedArray.add(nums1[i]);
      i++;
    }

    while (j < nums2.length) {
      mergedArray.add(nums2[j]);
      j++;
    }

    int mergedLength = mergedArray.length;

    if (mergedLength % 2 == 0) {
      int mid1 = mergedArray[(mergedLength ~/ 2) - 1];
      int mid2 = mergedArray[mergedLength ~/ 2];
      return (mid1 + mid2) / 2;
    } else {
      return mergedArray[mergedLength ~/ 2].toDouble();
    }
  }



  // Median of Two Sorted Arrays" problem in Dart. In this problem, you are given two sorted arrays, and your task is to find the median of the two arrays.
  //









  /// Maximum Product Subarray" problem in Dart.
  /// In this problem, you are given an array of integers,
  /// and your task is to find the contiguous subarray within the array that has the largest product
///  max product for r=taht num subaaray available
  int maxProduct(List<int> nums) {
    if (nums.isEmpty) {
      return 0;
    }

    int maxProductSoFar = nums[0];
    int minProductSoFar = nums[0];
    int result = nums[0];

    for (int i = 1; i < nums.length; i++) {
      int temp = maxProductSoFar;
      maxProductSoFar = (nums[i] > nums[i] * maxProductSoFar) ? nums[i] : (nums[i] * maxProductSoFar);
      maxProductSoFar = (nums[i] > nums[i] * minProductSoFar) ? maxProductSoFar : (nums[i] * minProductSoFar);
      minProductSoFar = (nums[i] < nums[i] * temp) ? nums[i] : (nums[i] * temp);
      minProductSoFar = (nums[i] < nums[i] * minProductSoFar) ? minProductSoFar : (nums[i] * minProductSoFar);

      result = (maxProductSoFar > result) ? maxProductSoFar : result;
    }

    return result;
  }






//Longest Increasing Subsequence" problem in Dart. In this problem, you are given an unsorted array of integers
  int lengthOfLIS(List<int> nums) {
    if (nums.isEmpty) {
      return 0;
    }

    int n = nums.length;
    List<int> dp = List.filled(n, 1);
    int maxLength = 1;

    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[i] > nums[j]) {
          dp[i] = dp[i] > dp[j] + 1 ? dp[i] : dp[j] + 1;
        }
      }
      maxLength = maxLength > dp[i] ? maxLength : dp[i];
    }

    return maxLength;
  }


  ///e "Word Ladder" problem in Dart. In this problem, you are given two words, a beginWord and an endWord, and a word list. Your task is to find the length of the shortest transformation sequence from beginWord to endWord, such that:
  //
  // Only one letter can be changed at a time.
  // Each transformed word must exist in the word list.
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    Set<String> wordSet = Set.from(wordList);

    if (!wordSet.contains(endWord)) {
      return 0; // The endWord is not in the wordList, so transformation is not possible.
    }

    Queue<String> queue = Queue();
    queue.add(beginWord);
    int level = 1;

    while (queue.isNotEmpty) {
      int levelSize = queue.length;

      for (int i = 0; i < levelSize; i++) {
        String word = queue.removeFirst();

        for (int j = 0; j < word.length; j++) {
          for (int k = 0; k < 26; k++) {
            String newWord = word.substring(0, j) + String.fromCharCode(97 + k) + word.substring(j + 1);

            if (wordSet.contains(newWord)) {
              if (newWord == endWord) {
                return level + 1;
              }

              queue.add(newWord);
              wordSet.remove(newWord);
            }
          }
        }
      }

      level++;
    }

    return 0; // No transformation sequence found.
  }


  List<String> generateParenthesis(int n) {
    List<String> result = [];
    _generate("", 0, 0, n, result);
    return result;
  }

  void _generate(String current, int open, int close, int n, List<String> result) {
    if (current.length == n * 2) {
      result.add(current);
      return;
    }

    if (open < n) {
      _generate("$current(", open + 1, close, n, result);
    }

    if (close < open) {
      _generate("$current)", open, close + 1, n, result);
    }
  }





  /// grop anyons grama code for write that situation

  List<List<String>> groupAnagrams(List<String> strs) {
    Map<String, List<String>> anagramGroups = {};

    for (String str in strs) {
      // Sort the characters in the string to create a unique key for anagrams.
      List<String> charList = str.split('')..sort();
      String sortedStr = charList.join();

      if (!anagramGroups.containsKey(sortedStr)) {
        anagramGroups[sortedStr] = [];
      }
      anagramGroups[sortedStr]!.add(str);
    }

    return anagramGroups.values.toList();
  }

  List<int> findAnagrams(String s, String p) {
    List<int> result = [];
    Map<String, int> pFrequency = {};
    Map<String, int> sFrequency = {};
    int pLength = p.length;

    // Calculate the frequency of characters in string p.
    for (int i = 0; i < pLength; i++) {
      String char = p[i];
      pFrequency[char] = (pFrequency[char] ?? 0) + 1;
    }

    int left = 0;
    int right = 0;

    while (right < s.length) {
      String char = s[right];
      sFrequency[char] = (sFrequency[char] ?? 0) + 1;

      // Shrink the sliding window from the left if it's too large.
      while (right - left + 1 > pLength) {
        String leftChar = s[left];
        sFrequency[leftChar] = sFrequency[leftChar]! - 1;
        if (sFrequency[leftChar] == 0) {
          sFrequency.remove(leftChar);
        }
        left++;
      }

      // Check if the current window is an anagram of p.
      if (sFrequency.length == pFrequency.length &&
          sFrequency.entries.every((entry) =>
          pFrequency.containsKey(entry.key) &&
              pFrequency[entry.key] == entry.value)) {
        result.add(left);
      }

      right++;
    }

    return result;
  }








/// Maximum Subarray" problem in Dart. In this problem, you are given an array of integers, and your task is to find the
  ///
  /// contiguous subarray (containing at least one number) that
  /// has the largest sum and return its sum

///  max sub array ceretedd for that situtation
  int maxSubArray(List<int> nums) {
    int maxSum = nums[0];
    int currentSum = nums[0];

    for (int i = 1; i < nums.length; i++) {
      currentSum = (currentSum + nums[i]).clamp(nums[i], double.infinity).toInt();
      maxSum = maxSum > currentSum ? maxSum : currentSum;
    }

    return maxSum;
  }



//// find minimum elemnt for that code find

  int findMin(List<int> nums) {
    int left = 0;
    int right = nums.length - 1;

    while (left < right) {
      int mid = left + (right - left) ~/ 2;

      if (nums[mid] > nums[right]) {
        left = mid + 1;
      } else if (nums[mid] < nums[right]) {
        right = mid;
      } else {
        // Handle the case when nums[mid] == nums[right]
        right--;
      }
    }

    return nums[left];
  }



///  find majority eleemnt in my list
  int majorityElement(List<int> nums) {
    int candidate = nums[0];
    int count = 1;

    for (int i = 1; i < nums.length; i++) {
      if (count == 0) {
        candidate = nums[i];
        count = 1;
      } else if (nums[i] == candidate) {
        count++;
      } else {
        count--;
      }
    }

    return candidate;
  }

/// find missing number for ilist
  int findMissingNumber(List<int> nums) {
    int missingNumber = nums.length;

    for (int i = 0; i < nums.length; i++) {
      missingNumber ^= i ^ nums[i];
    }

    return missingNumber;
  }



  /// add to number
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {

    //
    // ListNode l1 = ListNode(2, ListNode(4, ListNode(3)));
    // ListNode l2 = ListNode(5, ListNode(6, ListNode(4)));
    //
    // ListNode result = addTwoNumbers(l1, l2);
    ListNode dummy = ListNode(0);
    ListNode current = dummy;
    int carry = 0;

    while (l1 != null || l2 != null) {
      int x = l1?.val ?? 0;
      int y = l2?.val ?? 0;

      int sum = x + y + carry;
      carry = sum ~/ 10;

      current.next = ListNode(sum % 10);
      current = current.next!;

      if (l1 != null) l1 = l1.next;
      if (l2 != null) l2 = l2.next;
    }

    if (carry > 0) {
      current.next = ListNode(carry);
    }

    return dummy.next;
  }



  List<List<String>> partition(String s) {
    List<List<String>> result = [];
    List<String> currentPartition = [];

    bool isPalindrome(String str) {
      int left = 0;
      int right = str.length - 1;

      while (left < right) {
        if (str[left] != str[right]) {
          return false;
        }
        left++;
        right--;
      }
      return true;
    }

    void backtrack(int start) {
      if (start == s.length) {
        result.add(List.from(currentPartition));
        return;
      }

      for (int end = start + 1; end <= s.length; end++) {
        String substring = s.substring(start, end);
        if (isPalindrome(substring)) {
          currentPartition.add(substring);
          backtrack(end);
          currentPartition.removeLast();
        }
      }
    }

    backtrack(0);

    return result;
  }






//// solve the "3Sum" problem in Dart. In this problem, you are given an array of integers, and your task is to find all unique triplets in the array that add up to zero.
//
// Here's the Dart code to solve this problem
  List<List<int>> threeSum(List<int> nums) {
    nums.sort();
    List<List<int>> result = [];

    for (int i = 0; i < nums.length - 2; i++) {
      if (i == 0 || (i > 0 && nums[i] != nums[i - 1])) {
        int left = i + 1;
        int right = nums.length - 1;
        int target = -nums[i];

        while (left < right) {
          if (nums[left] + nums[right] == target) {
            result.add([nums[i], nums[left], nums[right]]);
            while (left < right && nums[left] == nums[left + 1]) left++;
            while (left < right && nums[right] == nums[right - 1]) right--;
            left++;
            right--;
          } else if (nums[left] + nums[right] < target) {
            left++;
          } else {
            right--;
          }
        }
      }
    }

    return result;
  }


/// Search in Rotated Sorted Array" problem

  int search(List<int> nums, int target) {
    int left = 0;
    int right = nums.length - 1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2;

      if (nums[mid] == target) {
        return mid;
      }

      if (nums[left] <= nums[mid]) {
        // Left half is sorted.
        if (nums[left] <= target && target < nums[mid]) {
          right = mid - 1;
        } else {
          left = mid + 1;
        }
      } else {
        // Right half is sorted.
        if (nums[mid] < target && target <= nums[right]) {
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }
    }

    return -1; // Target not found.
  }



///  int maximum subarrey  subaaray will be possible maximum subarray so  thta will code be executed
//   int maxSubArray(List<int> nums) {
//
//     // List<int> nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]; // Change this to the array of integers.
//     // ///
//     if (nums.isEmpty) {
//       return 0;
//     }
//
//     int maxSum = nums[0];
//     int currentSum = nums[0];
//
//     for (int i = 1; i < nums.length; i++) {
//       currentSum = (nums[i] > currentSum + nums[i]) ? nums[i] : currentSum + nums[i];
//       maxSum = (currentSum > maxSum) ? currentSum : maxSum;
//     }
//
//     return maxSum;
//   }



  ListNode? mergeTwoLists(ListNode? l1, ListNode? l2) {


    ///  ListNode l1 = ListNode(1, ListNode(2, ListNode(4)));
    //   ListNode l2 = ListNode(1, ListNode(3, ListNode(4)));
    //
    //   ListNode mergedList = mergeTwoLists(l1, l2);
    ListNode dummy = ListNode(0);
    ListNode current = dummy;

    while (l1 != null && l2 != null) {
      if (l1.val < l2.val) {
        current.next = l1;
        l1 = l1.next;
      } else {
        current.next = l2;
        l2 = l2.next;
      }
      current = current.next!;
    }

    // Append any remaining nodes from l1 or l2.
    if (l1 != null) {
      current.next = l1;
    }
    if (l2 != null) {
      current.next = l2;
    }

    return dummy.next;
  }

  List<int> findSubstring(String s, List<String> words) {
    // String s = "barfoothefoobarman"; // Change this to the input string.
    // List<String> words = ["foo", "bar"]; // Change this to the list of words.
    //
    // List<int> indices = findSubstring(s, words);
    //
    // print("Input String: $s");
    // print("List of Words: $words");
    // print("Starting Indices: $indices");

    if (s.isEmpty || words.isEmpty) {
      return [];
    }

    int wordLength = words[0].length;
    int totalLength = wordLength * words.length;
    List<int> result = [];

    Map<String, int> wordCountMap = {};
    for (String word in words) {
      wordCountMap[word] = (wordCountMap[word] ?? 0) + 1;
    }

    for (int i = 0; i <= s.length - totalLength; i++) {
      Map<String, int> tempMap = {};
      bool isValid = true;

      for (int j = i; j < i + totalLength; j += wordLength) {
        String word = s.substring(j, j + wordLength);

        if (!wordCountMap.containsKey(word)) {
          isValid = false;
          break;
        }

        tempMap[word] = (tempMap[word] ?? 0) + 1;

        if (tempMap[word]! > wordCountMap[word]!) {
          isValid = false;
          break;
        }
      }

      if (isValid) {
        result.add(i);
      }
    }

    return result;
  }


//// length of string without repeaaterted character in strigng longest sybstring  for string
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    int left = 0;
    Map<String, int> charIndexMap = {};

    for (int right = 0; right < s.length; right++) {
      String currentChar = s[right];

      if (charIndexMap.containsKey(currentChar) && charIndexMap[currentChar]! >= left) {
        left = (charIndexMap[currentChar]! + 1);
      }

      charIndexMap[currentChar] = right;
      int currentLength = right - left + 1;

      // Calculate the maximum without using Math.max
      if (currentLength > maxLength) {
        maxLength = currentLength;
      }
    }

    return maxLength;
  }





/// mreger interval to friom
  ///  List<Interval> intervals = [
  //     Interval(1, 3),
  //     Interval(2, 6),
  //     Interval(8, 10),
  //     Interval(15, 18),
  //   ]; // Change this to the list of intervals.
  List<Interval> mergeIntervals(List<Interval> intervals) {
    if (intervals.isEmpty) {
      return [];
    }

    // Sort intervals by their start times.
    intervals.sort((a, b) => a.start.compareTo(b.start));

    List<Interval> merged = [intervals[0]];

    for (int i = 1; i < intervals.length; i++) {
      Interval current = intervals[i];
      Interval previous = merged.last;

      if (current.start <= previous.end) {
        // Overlapping intervals; merge them.
        previous.end = (previous.end > current.end) ? previous.end : current.end;
      } else {
        // Non-overlapping interval; add it to the result.
        merged.add(current);
      }
    }

    return merged;
  }

  /// reverse string

  String reverseString(String s) {
    List<String> charList = s.split('');
    charList = charList.reversed.toList();
    return charList.join('');
  }
  // maxarea uin water find
  int maxArea(List<int> height) {

    // List<int> heights = [1, 8, 6, 2, 5, 4, 8, 3, 7]; // Change this to the array of heights.
    //
    // int maxWater = maxArea(heights);
    //
    // print("Max Area of Water: $maxWater");


    int maxArea = 0;
    int left = 0;
    int right = height.length - 1;

    while (left < right) {
      int minHeight = (height[left] < height[right]) ? height[left] : height[right];
      int currentArea = (right - left) * minHeight;
      if (currentArea > maxArea) {
        maxArea = currentArea;
      }

      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxArea;
  }


///  sudukoisvalid then after my tht code run

  bool isValidSudoku(List<List<String>> board) {
    // Create sets to track the presence of numbers in rows, columns, and subgrids.
    List<Set<String>> rowSet = List.generate(9, (_) => {});
    List<Set<String>> colSet = List.generate(9, (_) => {});
    List<Set<String>> subgridSet = List.generate(9, (_) => {});

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        String cell = board[i][j];

        if (cell == '.') {
          continue; // Skip empty cells.
        }

        // Check row
        if (rowSet[i].contains(cell)) {
          return false;
        }
        rowSet[i].add(cell);

        // Check column
        if (colSet[j].contains(cell)) {
          return false;
        }
        colSet[j].add(cell);

        // Check subgrid
        int subgridIndex = (i ~/ 3) * 3 + (j ~/ 3);
        if (subgridSet[subgridIndex].contains(cell)) {
          return false;
        }
        subgridSet[subgridIndex].add(cell);
      }
    }

    return true;
  }

///  convert roman to int

  int romanToInt(String s) {

    // String romanNumeral = "MCMXCIV"; // Change this to the Roman numeral you want to convert.
    //
    // int integerValue = romanToInt(romanNumeral);
    //
    // print("Roman Numeral: $romanNumeral");
    // print("Integer Value: $integerValue");
    Map<String, int> romanToInteger = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };

    int result = 0;
    int prevValue = 0;

    for (int i = s.length - 1; i >= 0; i--) {
      String currentSymbol = s[i];
      int currentValue = romanToInteger[currentSymbol]!;

      if (currentValue < prevValue) {
        result -= currentValue;
      } else {
        result += currentValue;
      }

      prevValue = currentValue;
    }

    return result;
  }



////  reverse interger by 32but uisng that ocde
  int reverse(int x) {
    // void main() {
    //   int num = 123; // Change this to the integer you want to reverse.
    //
    //   int reversedNum = reverse(num);
    //
    //   print("Original number: $num");
    //   print("Reversed number: $reversedNum");
    // }





    int reversed = 0;

    while (x != 0) {
      int pop = x % 10;
      x ~/= 10;

      if (reversed > (2147483647 ~/ 10) || (reversed == (2147483647 ~/ 10) && pop > 7)) {
        return 0;
      }

      if (reversed < (-2147483648 ~/ 10) || (reversed == (-2147483648 ~/ 10) && pop < -8)) {
        return 0;
      }

      reversed = reversed * 10 + pop;
    }

    return reversed;
  }


  String longestCommonPrefix(List<String> strs) {

    //
    // void main() {
    //   List<String> strings = ["flower", "flow", "flight"]; // Change this to the input array of strings.
    //
    //   String commonPrefix = longestCommonPrefix(strings);
    //
    //   print("Longest Common Prefix: $commonPrefix");
    // }

    if (strs.isEmpty) {
      return "";
    }

    String prefix = strs[0]; // Initialize prefix with the first string.

    for (int i = 1; i < strs.length; i++) {
      while (strs[i].indexOf(prefix) != 0) {
        prefix = prefix.substring(0, prefix.length - 1);
        if (prefix.isEmpty) {
          return "";
        }
      }
    }

    return prefix;
  }





}






class InventoryItem {
  String name;
  int quantity;
  double price;

  InventoryItem(this.name, this.quantity, this.price);

  @override
  String toString() {
    return '$name - Quantity: $quantity, Price: \$${price.toStringAsFixed(2)}';
  }
}

datamain() {
  Map<String, InventoryItem> inventory = {};

  while (true) {
    print('Inventory Management System');
    print('1. Add Item');
    print('2. Update Item');
    print('3. Display Inventory');
    print('4. Exit');
    print('Enter your choice: ');

    String choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        print('Enter item name: ');
        String name = stdin.readLineSync() ?? '';
        print('Enter quantity: ');
        int quantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        print('Enter price: ');
        double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

        InventoryItem newItem = InventoryItem(name, quantity, price);
        inventory[name] = newItem;
        print('Item added to inventory.');
        break;

      case '2':
        print('Enter item name to update: ');
        String name = stdin.readLineSync() ?? '';
        if (inventory.containsKey(name)) {
          print('Enter new quantity: ');
          int quantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
          print('Enter new price: ');
          double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

          InventoryItem updatedItem = InventoryItem(name, quantity, price);
          inventory[name] = updatedItem;
          print('Item updated in inventory.');
        } else {
          print('Item not found in inventory.');
        }
        break;

      case '3':
        print('Inventory:');
        inventory.forEach((key, value) {
          print(value);
        });
        break;

      case '4':
        print('Exiting program.');
        return;

      default:
        print('Invalid choice. Please select a valid option.');
    }
  }
}
