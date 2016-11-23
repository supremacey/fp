(* #use "test/w.ml" *)
(* Can it be done with better O(n) *)
let rec flatten = function
    [] -> []
  | hd::tl -> hd @ flatten tl
  ;;

let rec mid l1 l2 =
  match (l1,l2) with
    (t::ts, _::[]) -> t
  | (t::ts, []) -> t
  | (_::tortoise, _::_::hare) -> mid tortoise hare

let rec duplicate = function
    (_, 0) -> []
  | (el, n) -> el :: duplicate (el, n-1)

let rec a2b = function x -> a2b x

(* functions together recursive *)
let rec flip n = if n == 0 then "Flip!" else flop (n-1)
and     flop n = if n == 0 then "Flop!" else flip (n-1)
;;

(* type narrownig *)
let pack_some a = a::[]
let pack_int (a:int) = [a]

(* Patterns are build with VALUE CONSTRUCTORS! *)
(* Guarder patterns *)
let rec zip l1 l2 =
  match (l1,l2) with
    (h1::tl1, h2::tl2) -> (h1,h2) :: zip tl1 tl2
  |  _ -> []

(* val unzip : 'a * 'b list -> 'a list * 'b list = <fun> *)
let rec unzip zips =
  match zips with
    (h1, h2)::tl -> let (tl1, tl2) = unzip tl in (h1::tl1 , h2::tl2)
  | [] -> ([], [])

(* Value constructor always creates new value!!! *)

(* <pattern> as <indentifikator> *)

let initsegment (l1, l2) =
  let rec tst (il1, il2) =
    match (il1, il2) with
      (l1, l2) when l1=l2 -> true
    | ([], _) -> true
    | (h1::t1, h2::t2) -> if h1=h2 then tst (t1, t2) else false
    | (_ , []) -> false
  in tst (l1, l2)

let init' l1 l2 =
  let rec tst (il1, il2) =
    match (il1, il2) with
      ([], _) -> true
    | (h1::t1, h2::t2) when h1=h2 -> tst (t1, t2)
    | _ -> false
  in tst (l1, l2)

let repn' lst index vl =
  let rec aux (l,i,v) =
    match (l,i) with
      (h::tl, 0) -> v :: tl
    | (h::tl, _) -> h :: aux (tl, i-1, v)
    | ([], _) -> [v]
  in aux (lst, index, vl)

let split l =
  let rec aux l1 l2 =
    match l1 with
      [] -> (l1,l2)::[]
    | h::tl -> (l1,l2) :: aux tl 
  in aux l []
