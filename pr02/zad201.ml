(* Zadanie 1 - 3p. *)

(* Zadanie 2 - 2p *)
(*
  a0 = 0
  an = 2 * an-1 + 1 dla n > 1
*)
let rec zadanie2 n =
  if n>1 then 2. *. zadanie2 (n-1) +. 1. else 0.;;

let zadanie2' n =
  let rec acc_tail n acc =
    if n>1 then acc_tail (n-1) (2. *. acc +. 1.) else acc
  in acc_tail n 0.0;;

(* let jeden = zadanie2' 1000000;; *)
(* print_float jeden;; *)

(* Zadanie 3 - 3p *)
(* let rec cycle ls n =
  match (ls,n) with
    ([],_) -> []
  | (h::tl, i) -> (cycle ) :: h *)

let rec take' n ls =
  match (n,ls) with
    (_,[]) -> []
  | (0, _) -> []
  | (_, h::tl) -> h::(take' (n-1) tl)
;;

let rec drop' n ls =
  match (n,ls) with
    (0,_) -> ls
  | (_, []) -> []
  | (_, h::tl) -> drop' (n-1) tl
;;

let cycle' ls n = (drop' n ls)@(take' n ls);;

(* Zadanie 4 *)
(* let rec sort lst =
  match lst with
    [] -> []
  | head :: tail -> insert head (sort tail)
and insert elt lst =
  match lst with
    [] -> [elt]
    | head :: tail -> if elt <= head then elt :: lst else head :: insert elt tail
;; *)

let rec merge cmp l1 l2=
  match (l1,l2) with
    ([],[]) -> []
  | (l1,[]) -> l1
  | ([],l2) -> l2
  | (h1::tl1, h2::tl2) -> if cmp h1 h2 then h1::h2::(merge cmp tl1 tl2) else h2::h1::(merge cmp tl1 tl2)
