(* Zadanie 1 *)
let my_int = 1+1;;
let my_float = 3.0 ** 2.0;;
let my_char = 'a';;
let my_string = "Hello " ^ "World.";;
let my_unit = ();;

(* Zadanie 2 *)
(*OK int*)
if true then 4 else 5;;
(* ERR int i float *)
(* if false then 1 else 3.5;;/ *)
(* - funkcja x jest dla int - +. dla float *)
(* 4.75 + 2.34;; *)
(* OK bool *)
false || "ab">"cd";;
(* OK unit *)
if true then ();;
(* unit i int *)
(* if false then () else 4;; *)
(* int i string *)
(* let x = 2 in x^"aa";; *)
(* OK string *)
let y = "abc" in y^y;;
(* OK string i char *)
(fun x -> x.[1]) "abcdef";;
(* OK bool *)
(fun x -> x) true;;
(* OK int list *)
let x = [1;2] in x@x;;
(* OK int *)
let rec f f = f+f in f 42;;

(* Zadanie 3 *)
(* zmienne wolne  - zmienne ktore musza byc zwiazane poza wyrazeniem by wyrazenie musialo sie okreslic co do wartosci
zmienne zwiazane - zwiazane przez funk *)
(* wolna: x *)
(* let x = x in x^x;; *)
(* y i x wiazana *)
(* let x = 10. in let y = x**2. in y*.x;; *)
(* wiazana *)
(* let x = 1 and y = x in x + y;; *)
(* x wiazana y z wolne ? wiazace *)
(* let x = 1 in fun y z -> x*y*z;; *)

(* Zadanie 4 *)
let m = 10;;
let f x = m + x;;
let m = 100;;
print_int (f 1); print_newline();;
(* 11. ponieważ w trakcie wykonania wyrażenia let f ... program przypisal znana mu wartosc zmiennej m - czyli 10. Nazwa jest wiazana z wartoscia wiec fx = 10 + x i tak jest ustalana i nie podlega to zmianie. Closure *)

(* Zadanie 5 *)
(* ocaml *)
let x = (true, 10);;
let (false, y) = x;; (* gorliwa ewaluacja spowoduje rzucenie wyjatku w tym miejscu *)
(* Haskell *)
let x = (True, 10)
let (Flase, y) = x (*z powodu leniwej ewaluacji nie dojdzie do bledu do czasu, az y nie zostanie gdzies urzyty co zmusi do okreslenia jego wartosci*)
show y (* Exception! *)

(* Zadanie 6 *)
(* let plus_a = fun x y -> x + y;;
print_int (plus_a 1 1); print_newline ();;
let (^-^) = fun x y -> x + y;;
print_int (1 ^-^ 1); print_newline ();; *)
(* function - dla funkcji jednoargumentowych *)
(* fun - funkcje potencjalnie wieloargumentowe *)
let plus_a = fun x y -> x + y;;
print_int (plus_a 1 1 ); print_newline ();;
let plus_b x = function y -> x + y;;
print_int (plus_b 1 1 ); print_newline ();;
let plus_c = function x -> function y -> x + y;;
print_int (plus_c 1 1 ); print_newline ();;

(* Zadanie 7 *)
let id' = function (x: int) -> x;;
(* ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b *)
let fun_comp fun_ab fun_ca = function x -> fun_ab (fun_ca x);;
print_int (fun_comp id' id' 1); print_newline ();;
(* 'a -> 'b. *)
let undefined = fun -> failwith "undefined!"
let a2b = function a -> undefined + a;;


(* Zadanie 8 *)
(* zlozenie zdefiniowane w 7 *)
(* sproboj z akumulatorem lub funkcja pomocnicza *)
(* iterowania - powtarzania = wywolanie zlozenia funkcji samej ze soba*)
(* iterowanie  *)
let iter' times f = function x -> if times < 1
  then f
  else f


(* Zadanie 9 *)
