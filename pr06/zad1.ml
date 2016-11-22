type 'a btree = Leaf of 'a | Node of 'a btree * 'a btree

let ta = Node (Node (Leaf (1), Leaf (2)), Leaf (3))
let tb = Node (Leaf (1), Node (Leaf (2), Leaf (3)))

(*
Kiedy drzewa nie będą miały równych brzegów:
 - wartość liścia a <> wartości liścia b

- weź 2 drzewa
- jeśli node to idz do liścia w głąb (najpierw lewego, potem prawego)
  - dla obu node -> wykonaj to działanie dla obu
  - dla jednego node ->

Pomysł:
 - funkcja pomocnicza, która będzie wywoływana reukrencyjnie i będzie zwracać krotę z aktualną wartością i funckją dla prawego poddrzewa

*)
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

type 'a llist = Nil | Cons 'a * unit -> 'a list

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
        Cons(x,lx'), Cons(y,ly') where x=y -> aux (lx'()) (ly'())
      | Nil, Nil -> true
      | _,_ -> flase
