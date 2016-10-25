let my_string = "hello World" ^ "\n";;
print_string my_string;;

let xl = ref [];;
for i = 1 to 10 do
  xl := i :: !xl
done;;

let len_list = List.length !xl;;


(* <>  and = *)

(* more assignmnet in one line  *)
let a = 1 and b = 2;;
Printf.printf "min(%d,%d) = %d\n" a b (if  a < b then a else b);;  (* rememebr about else statement*)

(* with branches *)
let z = if a < 100 then begin
  print_string "Return at least 100";
  print_newline ();
  100  (* no ; due end ?*)
end else a;;

let x = ref 100;;
while !x > 20 do
  print_int !x; print_newline ();
  x := !x - 2
done;;
