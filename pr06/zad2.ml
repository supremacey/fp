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

let enumerate' t =
  let rec aux f i =
    match f with
      Leaf _ :: ftl-> Leaf i :: aux ftl (i+1)
    | Node(lt, _ ,rt)::ftl ->
      let lt'::rt'::rst = aux lt::rt::ftl (i+1) in
      (Node(lt', i, rt'), i'')
  in let [enum] = aux [t] 1 in
  enum

(*  W szerz *)

(* let enum *)

let tst2 = Node (Node (Leaf 'a', 'b', Leaf 'c'), 'd', Leaf 'e')
