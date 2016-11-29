(* #use "zad01.ml";; *)
(* podpunkt 1. - operator stałopunktowy *)
(* fix: (('a->'b)->'a->'b)->'a->'b = <fun> *)
(* let fact = function n -> if n = 0 then 1 else *)

(* ('a -> 'a) -> 'a = <fun> - zły przykład *)
let rec bfix f = f (bfix f)

(* argument v powoduje powstanie funkcji 'częściowej' czekającej na wartosć v *)
let rec fix f v = f (fix f) v

(* funkcja silni z użyciem operatora fix *)
let ff = fix (fun f -> fun n -> if n = 0 then 1 else n * f (n-1))

(* podpunkt 2. - bez konstrukcji let rec *)
(* silnia *)
(* fix *)
