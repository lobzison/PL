(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(*Write a function all_except_option, which takes a string and a string list. Return NONE if the
string is not in the list, else return SOME lst where lst is identical to the argument list except the string
is not in it. You may assume the string is in the list at most once. Use same_string, provided to you,
to compare strings. Sample solution is around 8 lines.*)

fun all_except_option (x,ss) = 
    case ss of
      [] => NONE
    | s::ss' => case same_string(x, s) of
                true => SOME ss'
              | false => case all_except_option(x, ss') of
                         NONE => NONE
                       | SOME y => SOME (s::y)

(*Write a function get_substitutions1, which takes a string list list (a list of list of strings, the
substitutions) and a string s and returns a string list. The result has all the strings that are in
some list in substitutions that also has s, but s itself should not be in the result. Example:
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred")
(* answer: ["Fredrick","Freddie","F"] *)
Assume each list in substitutions has no repeats. The result will have repeats if s and another string are
both in more than one list in substitutions. Example:
get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff")
(* answer: ["Jeffrey","Geoff","Jeffrey"] *)
Use part (a) and ML’s list-append (@) but no other helper functions. Sample solution is around 6 lines.
*)

fun get_substitutions1 (subs, s) = 
    case subs of
     [] => []
    |x::xs' => case all_except_option(s, x) of
                NONE => get_substitutions1(xs', s)
               |SOME l => l@get_substitutions1(xs', s)
     
(*Write a function get_substitutions2, which is like get_substitutions1 except it uses a tail-recursive
local helper function.*)

fun get_substitutions2 (subs, s) = 
    let
      fun get_sub_help(subs, acc) =
        case subs of
        [] => acc
        |x::xs' => case all_except_option(s, x) of
                   NONE => get_sub_help(xs', acc)
                   | SOME l => get_sub_help(xs', acc@l)
    in
      get_sub_help(subs, [])
    end

(*Write a function similar_names, which takes a string list list of substitutions (as in parts (b) and
(c)) and a full name of type {first:string,middle:string,last:string} and returns a list of full
names (type {first:string,middle:string,last:string} list). The result is all the full names you
can produce by substituting for the first name (and only the first name) using substitutions and parts (b)
or (c). The answer should begin with the original name (then have 0 or more other names). Example:
similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Fred", middle="W", last="Smith"})
(* answer: [{first="Fred", last="Smith", middle="W"},
{first="Fredrick", last="Smith", middle="W"},
{first="Freddie", last="Smith", middle="W"},
{first="F", last="Smith", middle="W"}] *)
Do not eliminate duplicates from the answer. Hint: Use a local helper function. Sample solution is
around 10 lines.*)

fun similar_names (subs, name) = 
    let
        fun change_first_name (f) = case name of {first = _, last = l, middle = m} => {first = f, middle = m, last = l}
        fun helper_similar_names2 (subs) = 
            case subs of
              [] => []
            | x::xs => change_first_name x :: helper_similar_names2 xs
    in
        case name of
           {first = f, last = _, middle = _} => name::helper_similar_names2(get_substitutions2 (subs,f))
    end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(*Write a function card_color, which takes a card and returns its color (spades and clubs are black,
diamonds and hearts are red). Note: One case-expression is enough.*)

fun card_color (Clubs, _) = Black
   |card_color(Spades, _) = Black
   |card_color _ = Red

(*Write a function card_value, which takes a card and returns its value (numbered cards have their
number as the value, aces are 11, everything else is 10). Note: One case-expression is enough*)

fun card_value (_, Num x) = x
   |card_value (_, Ace) = 11
   |card_value (_,_) = 10

(*Write a function remove_card, which takes a list of cards cs, a card c, and an exception e. It returns a
list that has all the elements of cs except c. If c is in the list more than once, remove only the first one.
If c is not in the list, raise the exception e. You can compare cards with =.*)

fun remove_card (cs, c, e) = 
    case cs of
      [] => raise e
    | x::xs => case x=c of
                 true => xs
                |false => x::remove_card(xs, c, e) 


(*case remove_card(xs) of
                         [] => []
                        | v => v::xs   *)

(*    case cs of
      [] => raise e
    | x::xs => case c=x of
                true => xs
               |false => case remove_card(xs) of
                         [] => []
                        | v => x::v*)