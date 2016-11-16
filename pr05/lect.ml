let failwith msg = raise (Failure msg)
(* Leniwa lista z wykorzystaniem domknięcia funkcji *)
(* Nil lub Cons(:)  head : tail *)
type 'a llist = LNil | LCons 'a * (unit -> 'a llist)

let lhd = function ->
    LNil -> failwith "lhd"
  | LCons (x,_) -> x
  ;;

let ltl = function ->
    LNil -> failwith "ltl"
  | LCons (_,tl) -> tl()   (* the tail is a function that has to be called to evaluate*)

(* returns list of a value and function that takes unit and calls itslef *)
(* unit is marked as () *)
let rec lfrom k = LCons (k, function () -> lfrom (k+1))
