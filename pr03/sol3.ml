exception NotImplemented
(* Zadanie 01 *)
(* coeff - a list of coefficients with 'biggest power' at the front *)
let rec horner_acc' coeff x acc =
  match coeff with
    [] -> acc
  | head::tail -> horner_acc' tail x (acc*.x +. head)
  ;;

let horner' coeff x =
  match coeff with
    [] -> 0.0
  | head::tail -> horner_acc' tail x head
  ;;

let list_horner' coeff x =
  match coeff with
    [] -> 0.0
  | head::tail -> List.fold_left (fun acc item -> acc*.x +. item) head tail
  ;;

(* Zadanie 02 *)
(* coeff - a list of coefficients with 'biggest power' at the end *)
let rec horner'' coeff x =
  match coeff with
    [] -> 0.0
  | head::tail -> head +. (x *. (horner'' tail x))
  ;;
(* horner' [1.;0.;-1.;2.] 3.;; *)
(* horner'' [2.;-1.;0.;1.] 3.;; *)

let wat_list_horner'' coeff x = list_horner' (List.rev coeff) x
(* wat_list_horner'' [2.;-1.;0.;1.] 3.;; *)

let list_horner'' coeff x = raise NotImplemented
(* list_horner'' [2.;-1.;0.;1.] 3.;; *)

(* Zadanie 3 *)
let rec deriv_acc' coeff iter =
  match coeff with
    [] -> []
  | head::tail -> head *. iter :: (deriv_acc' tail (iter +. 1.))
  ;;

let deriv' coeff =
  match coeff with
    [] -> []
  | head::tail -> deriv_acc' tail 1.
  ;;


(* Zadanie 4 *)
(*    punkt 01 *)

(* USE FOLD FOR THIS *)
let rec mat_check' rows size =
  match rows with
    [[]] -> true
  | head::tail -> if List.length head = size
                  then mat_check' tail size
                  else false
  | _ -> false

let is_matrix' matrix =
  match matrix with
    [[]] -> true
  | head::tail -> if List.length matrix = List.length head
                  then mat_check' tail (List.length head)
                  else false
  | _ -> false
  ;;
