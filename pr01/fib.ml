(* File fib.ml *)
let rec fib n =
  if n < 2 then 1 else fib (n-1) + fib (n-2);;
let main () =
  let arg = int_of_string Sys.argv.(1) in
  print_int (fib arg);
  print_newline ();

  exit 0;;
main ();;


(* time ocaml fib.ml 37
39088169

real	0m1.070s
user	0m1.054s
sys	  0m0.009s
10:09 maciejfaron *)

(* ocamlc
time ./fib 37
39088169

real	0m1.067s
user	0m1.053s
sys 	0m0.007s
10:10 maciejfaron  *)

(* ocamlopt
time ./a.out 37
39088169

real	0m0.132s
user	0m0.125s
sys 	0m0.004s *)
