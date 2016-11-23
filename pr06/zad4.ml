(* dyrektywy powinny być funkcjami transformującymi kontynuacje *)
(* operator ++ to zwyczajne złożenie takich funkcji. *)
let (++) f g = function x -> f (g x)

(* lit s - stała napisowa s *)
(*  *)
(* let lit str =  *)

(* eol ma być (string -> a) -> string -> a. *)
(* let eol sc = *)

(* (string -> 'a) -> string -> (int -> 'a) *)
(* argumentem ma być kontynuacja oczekująca napisu, ale o nieokreślonym typie odpowiedzi
   a wynikiem ma być kontynuacja oczekująca napisu, a następnie liczby całkowitej *)
(* let inr sc = *)
