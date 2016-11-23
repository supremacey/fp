type 'a btree = Leaf of 'a | Node of 'a btree * 'a * 'a btree
(* Preorder *)
let enumerate t =
  let rec aux t i =
    match t with
      Leaf _ -> (Leaf i, i+1)
    | Node(lt, _ ,rt) ->
      let (lt', i') = aux lt (i+1) in
      let  (rt', i'') = aux rt i' in
      (Node(lt', i, rt'), i'')
  in fst (aux t 1)

(* let enumerate' t = *)

(*  W szerz *)


let tst2 = Node (Node (Leaf 'a', 'b', Leaf 'c'), 'd', Leaf 'e')
