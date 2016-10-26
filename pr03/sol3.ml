(* konsultacje 16:00 - 18:00 poniedziałek *)

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

let list_horner'' coeff x =
  List.fold_right (fun elem acc -> elem +. acc *. x) coeff 0.0
  ;;
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

let list_deriv' coeff =
 let bs = List.mapi (fun iter elem -> elem *. (float_of_int iter)) coeff
 in match bs with
   [] -> []
 | head::tail -> tail
 ;; 

(* Zadanie 4 *)
(* punkt 01 *)
let sqmat' mat = 
  let mat_size = List.length mat in 
  List.fold_left (fun acc row -> acc && (List.length row = mat_size)) true mat
  ;;

(* punkt 2 *)
let mnth' mat n = if sqmat' mat then 
  List.rev (List.fold_left (fun acc row -> List.nth row n :: acc) [] mat)
  else []
  ;;

let m_nth' mat n = if sqmat' mat then 
  List.map (fun row -> List.nth row n) mat
  else []
  ;;

(* punkt 3 *)
let mT' mat =
  List.mapi (fun iter row -> m_nth' mat iter) mat 

(* punkt 4 *)
let zip' = List.map2 (fun a b -> (a,b))

(* punkt 5 *)
let zipf' f lsta lstb = 
  let pairs = zip' lsta lstb in
  List.map (function (x,y) -> f x y) pairs 

(* punkt 6 *)
let mult_vec' vec mat =
  let lists = (zipf' (fun sc vc -> List.map (function a -> a*.sc) vc) vec mat) in
  List.fold_left lists


let matrix_mult matA matB=
  List.map (fun v -> mult_vec' v matB) matA ;;
  
