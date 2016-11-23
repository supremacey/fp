type 'a btree = Leaf of 'a | Node of 'a btree * 'a btree

let ta = Node (Node (Leaf (1), Leaf (2)), Leaf (3))
let tb = Node (Leaf (1), Node (Leaf (2), Leaf (3)))

(* rozwiązanie nieefektywne *)
let flat t =
  let rec aux tr acc =
  match tr with
    Node(l,r) -> aux l (aux r acc)
  | Leaf(a) -> a::acc
  in aux t []

let fringe a b =
  let rec aux a b = match (a,b) with
      (ha::ta, hb::tb) -> if ha=hb then aux ta tb else false
    | ([],[]) -> true
    | _ -> false
  in aux (flat a) (flat b)

(* Z opóźnionym trawersowanie *)
type 'a llist = Nil | Cons of 'a * (unit -> 'a llist)

let lflat t =
  let rec aux tr c =
    match tr with
      Leaf a -> Cons (a,c)
    | Node(l,r) -> aux l (fun () -> aux r c)
  in aux t (fun () -> Nil)

let samefringe' (a,b) =
  let la = lflat a
  and lb = lflat b
  in let rec aux lx ly =
    match lx, ly with
      Cons(x,lx'), Cons(y,ly') when x=y -> aux (lx'()) (ly'())
    | Nil, Nil -> true
    | _,_ -> false
  in aux la lb
