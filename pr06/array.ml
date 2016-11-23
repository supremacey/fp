type 'a btree = Leaf | Node of 'a btree * 'a * 'a btree
let failwith msg = raise (Failure msg)

(* Zdefiniuj typ danych 'a array *)
(* type 'a array = 'a btree * int *)
type 'a array = Array of 'a btree * int

(* a empty : 'a array, tablica pusta; *)
let empty = Array(Leaf, 0)
(* let empty = Array((Leaf, 0)) *)

(* a sub : 'a array -> int -> 'a, pobranie składowej o zadanym indeksie; *)
let sub (Array(ar,n)) (i : int) =
  if n < i then failwith "Idex out of bound."
  else let rec aux a i =
        match (a,i) with
          (Node(l, v, r), 1) -> v
        | (Node(l, v, r), _) -> let d = i mod 2 in
            if d = 0 then aux l (i/2)
            else aux r (i/2)
        | (Leaf,_) -> failwith "Leaf."
  in aux ar i

(*
a update : 'a array -> int -> 'a -> 'a array
 modyfikacja składowej o zadanym indeksie;
 *)
let update (Array(ar,n)) i nv =
 if n < i then failwith "Idex out of bound."
 else let rec aux a i =
       match (a,i) with
         (Node(l, _, r), 1) -> Node(l, nv, r)
       | (Node(l, ov, r), _) -> let d = i mod 2 in
           if d = 0 then
              let nl = aux l (i/2) in Node(nl,ov,r)
           else
              let nr = aux r (i/2) in Node(l,ov,nr)
       | (Leaf,_) -> failwith "Leaf."
 in Array(aux ar i, n)
(* in Array (aux ar i, n) *)


(*
a hiext : 'a array -> 'a -> 'a array
rozszerzenie tablicy o jedną składową;
*)
let hiext (Array(ar,n)) nv =
  let rec aux a i =
    match (a,i) with
      (Node(l, ov, r), _) -> let d = i mod 2 and i' = i/2 in
        if d = 0 then
          let nl = aux l i' in Node(nl,ov,r)
        else
          let nr = aux r i' in Node(l,ov,nr)
    | (Leaf, 0) | (Leaf, 1) -> Node(Leaf, nv, Leaf) in
  let i' = n+1 in
  Array(aux ar i', i')

(*
a hirem : 'a array -> 'a array
usunięcie składowej o najwyższym indeksie.
*)
let hirem (Array(ar,n)) =
  if n < 1 then failwith "Empty array."
  else let rec aux a i =
    match (a,i) with
      (Node(Leaf, v, Leaf), _) -> Leaf
    | (Node(l, ov, r), _) -> let d = i mod 2 and i' = i/2 in
      if d = 0 then
        let nl = aux l i' in Node(nl, ov, r)
      else
        let nr = aux r i' in Node(l, ov, nr) in
  let n' = n-1 in
  Array((aux ar n), n')

let tst3 = Array(Node(Node(Node(Node(Leaf,"Eight",Leaf),"Four",Leaf),"Two",Node(Leaf, "Six",Leaf)),"One",Node(Node(Leaf, "Five", Leaf),"Three",Node(Leaf,"Seven",Leaf))), 8)
