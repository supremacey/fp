type htree = Node of (float * htree * htree) | Leaf of (char * float)

let findLeast2 ls =
  let find_aux lst a b newl =
    let aux item a b newl =
      match (item<a, item<b) with
        (True, True) -> find_aux b item
      | (True, False) ->
      | (False, _) ->
    in
    match lst with
      Leaf(_, prob) :: tl ->
    | Node(prob, _, _) :: tl ->
    | [] ->
