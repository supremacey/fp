(**
* @Author: Maciej Faron
* @Date:   30-Oct-2016
* @Last modified by:   Maciej Faron
* @Last modified time: 07-Nov-2016
*)

(* Pracownia 04 *)
(* Zadanie 1 *)
let rec palindrome' xs =
  match xs with
    [] -> true
  | [elem] -> true
  | head::tail -> let last::init = List.rev tail in
    if head = last then palindrome' init else false
  ;;

let palindrome xs = xs = List.rev xs
  ;;

(* Zadanie 2 *)
type 'a btree = Leaf | Node of 'a btree * 'a * 'a btree
(* 1 *)
(* Suma wezlow w drzewie *)
let rec nodes' bt =
  match bt with
    Leaf -> 0
  | Node (tl, _ ,tr) -> 1 + nodes' tl + nodes' tr
  ;;

let is_balanced' bt =
  match bt with
    Leaf -> true
  | Node (l_bt, _, r_bt) -> abs(nodes' l_bt - nodes' r_bt) < 2
  ;;
(* 2 *)
(* Dokończ *)
(* let rec btree_of_list xs =
  match xs with
    root::left::right -> let left = Node() and right = Node()
      in Node(left, root, right)
  | root::elem::[] -> Node ()
  | [root] -> Node (Leaf, root, Leaf)
  | [] -> Leaf
  ;; *)
(* let rec grow_bt bs =
  let rec g_bt xs depth acc =
    let num_elem = int_of_float (2.**depth) in
    match xs with
      [] -> Leaf
    | head::tail -> if num_elem > acc
                    then Node(Leaf, head, Leaf)
                    else Node(g_bt tail (depth +. 1.) (acc-num_elem) , head, Leaf)
  in g_bt bs 0. (List.length bs) *)
(* grow_bt ['a';'b';'d';'h';'e';'c';'f';'g'] *)
(* 3 *)
(* Drzewo wielokierunkowe *)
type 'a mtree = MNode of 'a * 'a forest
and 'a forest = EmptyForest | Forest of 'a mtree * 'a forest;;

type 'a mtree_lst = MTree of 'a * ('a mtree_lst) list;;


let l_hand = MNode("l_hand", Forest(MNode("l_thumb", EmptyForest), Forest(MNode("l_index", EmptyForest), Forest(MNode("l_pinky", EmptyForest), EmptyForest))))
let r_arm = MNode("r_arm", Forest(MNode("r_forearm", Forest(MNode("r_wrist", EmptyForest), EmptyForest)), EmptyForest))
let waist = MNode("waist", Forest(MNode("l_leg", EmptyForest), Forest(MNode("r_leg", EmptyForest), EmptyForest)))
let joints = MNode("body", Forest(l_hand, Forest(r_arm, Forest(waist, EmptyForest))))

(* Preorder *)
let preorder1 t =
  let rec pre_supp = function
    (Forest(MNode(value, child), sibling), lbls) -> value ::  pre_supp (child, pre_supp (sibling, lbls))
  | (EmptyForest, lbls) -> lbls
  and pre1 = function
    (MNode(value, EmptyForest), lbls) -> value :: lbls
  | (MNode(value, child), lbls) -> value :: pre_supp (child, lbls)
  in pre1 (t,[])
  ;;
(* Wszerz | breadth-first | level-order*)
(* fix this *)
let levelorder t =
  let rec lvl_supp = function
    (EmptyForest, lbls) -> lbls
  | (Forest(MNode(value,child), sibling), lbls) -> value :: lvl_supp (sibling, lvl_supp(child, lbls))
  and lvlord = function
    (MNode(value, EmptyForest), lbls) -> value :: lbls
  | (MNode(value, child), lbls) -> value :: lvl_supp (child, lbls)
  in lvlord (t,[])
  ;;
(* drzewa testowe *)
let tree1 = Node(
  Node(
    Node(
      Leaf,
      4,
      Leaf),
    2,
    Leaf),
  1,
  Node(
    Node(
      Node(
        Leaf,
        6,
        Leaf),
      5,
      Leaf),
    3,
    Leaf)
  )
let tree2 = Leaf
let tree3 = Node(Node(Node(Leaf, 2, Leaf),0,Leaf), 1, Leaf)

(* Zadanie 3 *)
