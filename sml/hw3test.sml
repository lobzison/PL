(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1_1 = only_capitals ["A","B","C"] = ["A","B","C"]

val test1_2 = only_capitals ["Aasd","baldslads","asdqdDAsd"] = ["Aasd"]

val test1_3 = only_capitals ["asdasdD","BsdsD","asdDAsdDASD"] = ["BsdsD"]

val test1_4 = only_capitals ["DASQSDqQqw","QDDsdQDQDsq"] = ["DASQSDqQqw","QDDsdQDQDsq"]

val test1_5 = only_capitals ["s"] = []

val test1_6 = only_capitals ["ASD","AdD","SadA","bad"] = ["ASD","AdD","SadA"]

val test2_1 = longest_string1 ["A","bc","C"] = "bc"

val test2_2 = longest_string1 ["Aasdafv","basd","fa"] = "Aasdafv"

val test2_3 = longest_string1 ["Afa","sfdsfd","asdfasdf"] = "asdfasdf"

val test2_4 = longest_string1 ["ad","asddqddq","C"] = "asddqddq"

val test2_5 = longest_string1 ["AD","DB","C"] = "AD"

val test3_1 = longest_string2 ["AD","DB","C"] = "DB"

val test3_2 = longest_string2 ["Afa","sfdsfd","asdfasdf"] = "asdfasdf"




val test4a_0 = longest_string3 ["A","bc","C"] = "bc"

val test4a_1 = longest_string3 ["A","bc","C"] = "bc"

val test4a_2 = longest_string3 ["Aasdafv","basd","fa"] = "Aasdafv"

val test4a_3 = longest_string3 ["Afa","sfdsfd","asdfasdf"] = "asdfasdf"

val test4a_4 = longest_string3 ["ad","asddqddq","C"] = "asddqddq"

val test4a_5 = longest_string3 ["AD","DB","C"] = "AD"

val test4b_0 = longest_string4 ["A","B","C"] = "C"

val test4b_1 = longest_string4 ["AD","DB","C"] = "DB"

val test4b_2 = longest_string4 ["Afa","sfdsfd","asdfasdf"] = "asdfasdf"



val test5_0 = longest_capitalized ["A","bc","C"] = "A"

val test5_1 = longest_capitalized ["A","B","C"] = "A"

val test5_2 = longest_capitalized ["Aasd","baldslads","asdqdDAsd"] = "Aasd"

val test5_3 = longest_capitalized ["asdasdD","BsdsD","asdDAsdDASD"] = "BsdsD"

val test5_4 = longest_capitalized ["DASQSDqQqw","QDDsdQDQDsq"] = "QDDsdQDQDsq"

val test5_5 = longest_capitalized ["s"] = ""

val test5_6 = longest_capitalized ["ASD","AdD","SadA","bad"] = "SadA"

val test6_1 = rev_string "abc" = "cba"

val test6_2 = rev_string "AdsA" = "AsdA"

val test6_3 = rev_string "JiUj" = "jUiJ"

val test6_4 = rev_string "" = ""


val test7_0 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test7_1 = ((first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3] ;
               false) 
              handle NoAnswer => true)



val test8_0 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE

val test8_1 = all_answers (fn x => SOME[x]) ([2,3,4,5,1,7]) = (SOME [7,1,5,4,3,2])
 
val test8_2 = all_answers (fn x => if x = 1 then SOME [7] else NONE) ([1,1]) = (SOME [7,7])

val test8_3 = all_answers (fn x => if x = 1 then SOME [7] else NONE) [] = SOME []


val test9a_1 = count_wildcards Wildcard = 1

val test9a_2 = count_wildcards (TupleP[Wildcard,Wildcard]) = 2

val test9a_3 = count_wildcards (TupleP[Wildcard,Wildcard,UnitP,Wildcard]) = 3

val test9b_1 = count_wild_and_variable_lengths (Variable("a")) = 1

val test9b_2 = count_wild_and_variable_lengths (TupleP[Wildcard,Wildcard,UnitP,Wildcard]) = 3

val test9b_3 = count_wild_and_variable_lengths (Variable("asdf")) = 4

val test9b_4 = count_wild_and_variable_lengths (TupleP[Wildcard,Wildcard,Variable("dw"),Wildcard]) = 5

val test9c_1 = count_some_var ("x", Variable("x")) = 1

val test9c_2 = count_some_var ("y", Variable("x")) = 0

val test9c_3 = count_some_var ("x", TupleP[Variable("x"),Variable("y"),Variable("x")]) = 2

val test10_1 = check_pat (Variable("x")) = true

val test10_2 = check_pat (TupleP[Variable("x"),Variable("y"),Variable("x")]) = false



 
val test11_1 = match (Const(1), UnitP) = NONE

val test11_2 = match (Unit, UnitP) = SOME []


val test12 = first_match Unit [UnitP] = SOME [] 
