(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


val test1_1 = is_older ((1,2,3),(2,3,4)) = true

val test1_2 = is_older ((1000,2,3),(2018,2,3)) = true

val test1_3 = is_older ((2017,12,31),(2018,1,1)) = true

val test1_4 = is_older ((2039,12,31),(2018,1,1)) = false

val test1_5 = is_older ((2018,1,2),(2018,1,1)) = false

val test1_6 = is_older ((1,2,25),(1,12,29)) = true

val test2_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1

val test2_2 = number_in_month ([(2012,2,28),(2013,12,1),(2014,12,1),(2018,2,1),(2018,1,1),(2019,2,1)],2) = 3

val test2_4 = number_in_month ([],2) = 0

val test3_1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val test3_2 = number_in_months ([(2012,2,28),(2013,4,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 4

val test3_3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0

val test3_4 = number_in_months ([],[1,2,3]) = 0

val test4_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test4_2 = dates_in_month ([],2) = []

val test4_3 = dates_in_month ([(2012,2,28),(2013,2,1),(2018,12,31),(2013,11,1),(2013,8,1),(2018,2,1),(2013,12,1)],2) = [(2012,2,28),(2013,2,1),(2018,2,1)]

val test5_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test5_2 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []

val test5_3 = dates_in_months ([],[2,3,4]) = []

val test5_4 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12,3]) = [(2013,12,1),(2011,3,31)]

val test6_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test6_2 = get_nth (["benis"], 1) = "benis"

val test6_3 = get_nth (["hi", "there", "how", "are", "e"], 5) = "e"

val test7_1 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test7_2 = date_to_string (2018, 6, 15) = "June 15, 2018"

val test7_3 = date_to_string (2017, 1, 29) = "January 29, 2017"

val test8_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test8_2 = number_before_reaching_sum (12, [13,2,3,4,5]) = 0

val test8_3 = number_before_reaching_sum (5, [2,1,0,1,5]) = 4

val test9_1 = what_month 20 = 1

val test9_2 = what_month 32 = 2

val test9_3 = what_month 70 = 3

val test9_4 = what_month 190 = 7

val test9_5 = what_month 360 = 12

val test10_1 = month_range (31, 34) = [1,2,2,2]

val test10_2 = month_range (35, 34) = []

val test10_3 = month_range (58, 63) = [2,2,3,3,3,3]

val test11_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test11_2 = oldest([]) = NONE

val test11_3 = oldest([(2012,2,28),(2011,3,31),(2011,01,28),(1998,2,28),(1998,2,27),(1998,3,1)]) = SOME (1998,2,27)

val test11_4 = oldest[(5,5,2),(5,10,2),(5,2,2),(5,12,2)] = SOME (5,2,2)

val test12_1 = number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,4,2,3,2,3]) = 3

val test12_3 = dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12,3,3,12,3,12]) = [(2011,3,31),(2013,12,1)]