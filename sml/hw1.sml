
(*1. Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same,
the result is false.) *)

fun is_older (dt1 : (int*int*int), dt2 : (int*int*int)) =
    if #1 dt1 = #1 dt2
    then if #2 dt1 = #2 dt2
         then #3 dt1 < #3 dt2
         else #2 dt1 < #2 dt2
    else #1 dt1 < #1 dt2

(*2. Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns
how many dates in the list are in the given month. TODO: fix*)

fun number_in_month (dts : (int*int*int) list, m : int) = 
    if null dts
    then 0
    else if #2 (hd dts)=m
         then 1 + number_in_month(tl dts, m)
         else number_in_month(tl dts, m)

(*3. Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns the number of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated. Hint: Use your answer to the previous problem.*)

fun number_in_months (dts : (int*int*int) list, ms : int list) =
    if null ms
    then 0
    else number_in_month(dts, hd ms) + number_in_months(dts, tl ms)

(*4. Write a function dates_in_month that takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. The returned list should
contain dates in the order they were originally given.*)

fun dates_in_month (dts : (int*int*int) list, m : int) =
    if null dts
    then []
    else if #2 (hd dts)=m
         then hd dts::dates_in_month(tl dts, m)
         else dates_in_month(tl dts, m)

(*5. Write a function dates_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns a list holding the dates from the argument list of dates that are in any of the months in
the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the
previous problem and SML’s list-append operator (@)*)

fun dates_in_months (dts : (int*int*int) list, ms : int list) =
    if null ms
    then []
    else dates_in_month(dts, hd ms) @ dates_in_months(dts, tl ms)

(*6. Write a function get_nth that takes a list of strings and an int n and returns the n
th element of the
list where the head of the list is 1st. Do not worry about the case where the list has too few elements:
your function may apply hd or tl to the empty list in this case, which is okay.*)

fun get_nth (sl : string list, n : int) =
    if n = 1
    then hd sl
    else get_nth(tl sl, n-1)

(*7. Write a function date_to_string that takes a date and returns a string of the form January 20, 2013
(for example). Use the operator ^ for concatenating strings and the library function Int.toString
for converting an int to a string. For producing the month part, do not use a bunch of conditionals.
Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a
comma following the day and use capitalized English month names: January, February, March, April,
May, June, July, August, September, October, November, December.*)

fun date_to_string(dt : (int*int*int)) =
    let
        val months = ["January", "February", "March", "April", "May",
                   "June", "July", "August", "September", "October",
                   "November", "December"]
    in
        get_nth(months, #2 dt) ^" "^ Int.toString(#3 dt) ^ ", " ^ Int.toString(#1 dt)
    end

(*8. Write a function number_before_reaching_sum that takes an int called sum, which you can assume
is positive, and an int list, which you can assume contains all positive numbers, and returns an int.
You should return an int n such that the first n elements of the list add to less than sum, but the first
n + 1 elements of the list add to sum or more. Assume the entire list sums to more than the passed in
value; it is okay for an exception to occur if this is not the case.*)

fun number_before_reaching_sum (sum : int, il : int list) =
    if hd il >= sum 
    then 0
    else 1 + number_before_reaching_sum(sum - hd il, tl il)

(*9. Write a function what_month that takes a day of year (i.e., an int between 1 and 365) and returns
what month that day is in (1 for January, 2 for February, etc.). Use a list holding 12 integers and your
answer to the previous problem.*)

fun what_month (day : int) =
    let
        val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(day,month_days)+1
    end

(*10. Write a function month_range that takes two days of the year day1 and day2 and returns an int list
[m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month
of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2.*)

fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month day1::month_range(day1 + 1, day2)

(*11. Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It
evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list.*)

fun oldest (ds : (int*int*int) list) =
    if null ds
    then NONE
    else let
        fun oldest_nonempty (ds : (int*int*int) list) =
        if null (tl ds)
        then hd ds
        else 
            let
                val tl_ans = oldest_nonempty(tl ds)
            in
                if is_older(tl_ans, hd ds)
                then tl_ans
                else hd ds
            end
        in
            SOME(oldest_nonempty ds)
        end

(*12. Write functions number_in_months_challenge and dates_in_months_challenge
that are like your solutions to problems 3 and 5 except having a month in the second argument multiple
times has no more effect than having it once. (Hint: Remove duplicates, then use previous work.)*)

fun dedup (xs : int list, prev : int) =
    (*removes duplicates from a sorted list*)
    if null xs
    then []
    else if hd xs <> prev
    then hd xs::dedup(tl xs, hd xs)
    else dedup(tl xs, hd xs)

fun number_in_months_challenge (dts : (int*int*int) list, ms : int list) =
    let
        val sorted = ListMergeSort.sort(fn(x,y) => x > y) ms
    in
        number_in_months(dts, dedup(sorted, ~1))
    end

fun dates_in_months_challenge (dts : (int*int*int) list, ms : int list) =
    let
        val sorted = ListMergeSort.sort(fn(x,y) => x > y) ms
    in
        dates_in_months(dts, dedup(sorted, ~1))
    end