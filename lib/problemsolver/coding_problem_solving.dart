import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leetcode_more_problem/problemsolver/prrobelmsolver.dart';

class CodingProblemSolver extends StatefulWidget {
  const CodingProblemSolver({super.key});

  @override
  State<CodingProblemSolver> createState() => _CodingProblemSolverState();
}

class _CodingProblemSolverState extends State<CodingProblemSolver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [



            ElevatedButton(
                onPressed: () {

                  var n = 3 ;
                  List<int> nums = [10, 22, 9, 33, 21, 50, 41, 60, 80];

                  var res = ProblemSolverCodeSolution().longestIncreasingSubsequence(nums) ;
                  print(res);
                  print(res);
                  Get.snackbar(n.toString(), "${res}");
                  setState(() {});
                },
                child: Text("longestIncreasingSubsequence")),
            ElevatedButton(
                onPressed: () {

                  var n = 3 ;
                  List<int> nums = [10, 22, 9, 33, 21, 50, 41, 60, 80];

                  var res = ProblemSolverCodeSolution().longestIncreasingSubsequence(nums) ;
                  print(res);
                  print(res);
                  Get.snackbar(n.toString(), "${res}");
                  setState(() {});
                },
                child: Text("longestIncreasingSubsequence")),


          ],
        ),
      ),
    );
  }
}
