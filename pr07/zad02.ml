(* #use "zad02.ml";; *)
(* Zadanie 2 - modyfikowalna lista *)
type 'a list_mutable = LMnil | LMcons of 'a * 'a list_mutable ref

let rec concat_copy l1 l2 =
  match l1 with
    LMnil -> l2
  | LMcons(v, tl) -> let ntl = concat_copy !tl l2
    in
      LMcons (v, ref ntl)

(* ulepszona wersja *)
let concat_share l1 l2 =
  match l1 with
    LMnil -> l2
  | LMcons(_,_) -> let rec aux l =
                      match l with
                        LMcons (_, lst) when !lst = LMnil -> lst := l2
                      | LMcons (_, tl) -> aux !tl
                      | LMnil -> raise (Failure "Invariant!")
                   in aux l1; l1
(* wersja beta *)
let concat_share' l1 l2 =
  let l = ref l1 in
  let rec aux li1 =
      match li1 with
        LMnil -> l2
      | LMcons(_, empty) when !empty = LMnil -> begin empty := l2; !l end
      | LMcons(_, tl) -> aux !tl
  in aux l1

(* testy *)
let x2 = LMcons(1, LMcons(2, LMcons (3, LMnil |> ref) |> ref) |> ref)
let y2 = LMcons (4, LMcons (5, LMnil |> ref) |> ref )

let z2 = concat_copy x2 y2
let q2 = concat_share x2 y2

let break = function LMcons(_, tl) -> tl := LMnil | LMnil -> ()
