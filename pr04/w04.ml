(**
* @Author: Maciej Faron
* @Date:   30-Oct-2016
* @Last modified by:   Maciej Faron
* @Last modified time: 04-Nov-2016
*)


let failwith s = raise(Failure s);;
(* Typ parametryzowany *)
type 'param para_int_x = int * 'param
type para_int_float = float para_int_x
let (x:float para_int_x) = (3,3.14);;

(* konstruktor typu i konstruktor wartości *)
(* kolor i karta - bezargumentowe konstruktory typow *)
(* Trefl Karo Kier i Pik to bezagrumentowe konstruktory wartości *)
(* Blotka of int*kolor to 1 arg - tuple konstruktor wartosci*)
type kolor = Trefl|Karo|Kier|Pik
type karta = Blotka of int*kolor|Walet of kolor|Dama of kolor|Krol of kolor|As of kolor
let krol_pik = Krol Pik and trefl_siedem = Blotka (7, Trefl)

let rec przedzial a b = if a>b then [] else b::(przedzial a (b-1));;

(* Drzewa binarne *)
type 'a bt = Empty | Node of 'a * 'a bt * 'a bt
let t = Node(1,
            Node(2,
              Empty,
              Node(3,
                Empty,
                Empty)),
            Empty);;
 let rec nodes = function
    Empty -> 0
  | Node (_, t1, t2) -> 1 + nodes t1 + nodes t2
  ;;

(* Zadania kontrolne *)
(* prep *)
(* Drzewo wielokierunkowe *)
type 'a mtree = MNode of 'a * 'a forest
and 'a forest = EmptyForest | Forest of 'a mtree * 'a forest;;

type 'a mtree_lst = MTree of 'a * ('a mtree_lst) list;;

type 'a binTree = Node of 'a binTree * 'a * 'a binTree | Empty;;
(* 1 *)
let rec inorder = function
    Node(l,v,r) -> (inorder l) @ [v] @ (inorder r)
  | Empty -> [];;
let rec postorder = function
    Node(l,v,r) -> (postorder l) @ (postorder r) @ [v]
  | Empty -> [];;

let inorder' t =
  let rec inord = function
    (Empty, lbls) -> lbls
  | (Node(l,v,r), lbls) -> inord(l, v :: inord(r, lbls))
  in inord (t,[])
  ;;

let postorder' t =
  let rec postord = function
    (Empty, lbls) -> lbls
  | (Node(l,v,r), lbls) -> postord(l, postord(r, v::lbls))
  in postord (t,[])
  ;;
(* let rec preorder = function
    Node(v,l,r) -> v ::(preorder l) @ (preorder r)
  | Empty -> []
  ;;

let preorder' t =
  let rec preord = function
      (Empty, labels) -> labels
    | (Node(v,t1,t2), labels) -> v :: preord (t1, preord (t2, labels))
  in preord (t,[]);;
   *)
(* 2 *)
(* mapBinTree :('a -> 'b) -> 'a binTree -> 'b binTree, *)
let mapBinTree t =
(* 3 *)
(* 4 *)
(* 5 *)
(* 6 *)


(* test variables *)
let test_t = Node(Node(Node(Empty,'A',Empty),'B',Node(Node(Empty,'C',Empty),'D',Node(Empty,'E',Empty))),'F',Node(Empty,'G',Node(Node(Empty,'H',Empty),'I',Empty)))
let my_forest =
MNode(
  0,
  Forest(
    MNode(00, EmptyForest),
    Forest(
      MNode(01, EmptyForest),
      EmptyForest)
  )
)
