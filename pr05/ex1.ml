type 'a lstream = LNil | LCons of 'a * (unit -> 'a lstream)

(*
1.
π/4 = 1 - 1/3 + 1/5 - 1/7 + ...;
*)
(* strumień ma zwracać SUMY n elemetów na n pozycji -> 1, 2/3, 11/15 ...*)
let rec pi_leibniz' k = LCons (1. /. k, function () -> pi_leibniz' (k +. 2.));;

let rec taken = function
    (0,_) -> []
  | (_, LNil) -> []
  | (n, LCons(x,xf)) -> x:: taken (n-1, xf())
;;

let get_pi' n =
  let rec aux = function
     (_,0,_) -> []
  |  (_,_, LNil) -> []
  |  (s,n, LCons(x,xf)) -> s*.x :: aux (-1. *. s, n-1 , xf())
  in aux (1.,n, pi_leibniz' 1.)
  ;;

let pi' n =
  let rec aux = function
     (_,0,_) -> 0.
  |  (_,_, LNil) -> 0.
  |  (s,n, LCons(x,xf)) -> s*.x +. aux (-1. *. s, n-1 , xf())
  in 4. *. aux (1.,n, pi_leibniz' 1.)
  ;;

let rec fs' n = LCons ()


(*
2.
napisz funkcję przekształcającą dowolny strumień

x1,x2,x3,...

w strumień postaci

f x1 x2 x3, f x2 x3 x4, f x3 x4 x5,...,

*)

(* let fto3' f strm = function
      (f, ) *)
