(* function with 1 arg *)
let incr n = n+1;;
(* with a tuple *)
let add3 (a,b,c) = a + b + c;;
let plus a b = a + b;;
print_int (add3 (1,2,3)); print_newline ();;
print_int (plus 1 2);;

(* returning mult values thanks to tuples *)
let divide a b = (a/b, a mod b);;
print_newline ();;
(* partial function applications like in haskell *)

(* Anonymous functions *)
print_int ((fun x -> x + 1) 42);;

print_newline();;
(* Iterators *)
List.map print_float (List.map (fun x -> x**2.0) [1.0;2.0;3.0;5.0;6.0]);;

(* folds *)
