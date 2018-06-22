(* val x = 50
val y = 3
val z = 10
val f = fn z => z
val a = 
let 
    val x = 3*x
    val z = y*z
in
    z
end
fun f x z = x + y + z

fun baz f a b c d e = (f (a ^ b))::(c + d)::e

val a = baz (fn z => 10) 


signature DIGIT = 
sig
type digit
val increment : digit -> digit
val decrement : digit -> digit
val down_and_up : digit -> digit
val test : digit -> unit
end

structure Digit :> DIGIT =
struct
type digit = int
exception BadDigit
exception FailTest
fun make_digit i = if i < 0 orelse i > 9 then raise BadDigit else i
fun increment d = if d=9 then 0 else d+1
fun decrement d = if d=0 then 9 else d-1
val down_and_up = increment o decrement (* recall o is composition *)
fun test d = if down_and_up d = d then () else raise FailTest
end

fun maybeEven x = 
	if x = 0 
	then true
	else
	if x = 50
	then false
	else maybeOdd (x-1)

and maybeOdd y =
	if y = 0
	then false
	else 
	if y = 99
	then true
	else maybeEven (y-1) *)

val a = [(4,19),(1,20),(74,75)]

val b =
case a of
    (a,b)::(c,d)::(e,f)::g => g


fun mystery f =fn xs=>
    let
        fun g xs =
           case xs of
               [] => NONE
             | x::xs' => if f x then SOME x else g xs'
    in
        case xs of
            [] => NONE
          | x::xs' => if f x then g xs' else mystery f xs'
    end


fun null xs = xs=[]

val t = null []
(* 
fun null xs = case xs of [] => true | _ => false *)

val t = null ["asd"]

signature COUNTER =
sig
    type t
    val newCounter : int -> int
    val increment : t -> t
    val first_larger : t * t -> bool
end
