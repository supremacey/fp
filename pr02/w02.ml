(**
* @Author: Maciej Faron
* @Date:   30-Oct-2016
* @Last modified by:   Maciej Faron
* @Last modified time: 30-Oct-2016
*)

(* Wykład 2 - zadania kontrolne *)
(* 1 *)
let rec fib1 n = if n <= 0 then 0 else
  match n with
    1 -> 1
  | _ -> fib1(n-1) + fib1(n-2)
  ;;

let fib2 n =
  let rec fib_acc m acc1 acc2 = if m == 0 then acc1 else
    fib_acc (m-1) (acc2) (acc2+acc1)
  in fib_acc n 0 1
  ;;

(* 2 *)
(* float -> float *)
(* abs_float i ** *)
let root3 num =
  let errfun y tru = abs_float(y**3. -. tru) <= 1e-15 *. abs_float(tru)
  in let rec root3_ x = if errfun x num then x else
    root3_ (x +. (num/.(x**2.) -. x)/.3. )
  in if num >= 1. then root3_ (num/.3.) else root3_ num
  ;;

(* 3 *)
(* funkcja z 'a na 'b*)
let rec f a = f a
  ;;

(* 4 *)
(* Wiązanie za uzyciem wzorca *)
(* let _::_::x::tail = [-2;-1; 0; 1; 2];; *)
(* let _::(x,_)::tail = [(1,2); (0,1)];; *)

(* 5 *)
(* let initsegment list1 list2 = *)
