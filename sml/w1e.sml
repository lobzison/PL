(* cooments
 multiline?
yes *)

val x = 34; (*int, integer*)

val y = 17;

val z = (x + y) + (y + 2);

val q = z + 1;

val abs_of_z = if z < 0 then 0 - z else z;

val abs_of_z_simpler = abs z;

(* less then
Syntax:
    e1 < e2

Type checking:
    get the type of e1 from static env,
    get the type of e2 from static env,
    if they are the same and less than is
    applicable to thouse types it will 
    evalueate to bool type

Evaluation rules:
    Check if e1 is less than e2
    if yes - return true
    else return false

*)

val ogo = ~ 1

fun pow(x : int, y : int) = 
    if y = 0
    then 1
    else x * pow(x, y-1)

val xxx = 1

fun swap (pr : int*bool) = 
    (#2 pr, #1 pr)

fun sum_two_pairs (pr1: int*int, pr2 : int*int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

fun div_mod (x : int, y : int) =
    (x div y, x mod y)