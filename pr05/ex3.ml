(* 1 *)
type htree = Node of (float * htree * htree) | Leaf of (char * float)


(* 2 *)
let p = function
    Leaf(_,prob) -> prob
  | Node(prob,_,_) -> prob
  ;; 
  
let find2 lst = function
    [] -> lst
  | [last] -> 
  | a::b::tl -> find2 

let rec find_l lst le nlst = 
   match lst with
     h::tl -> if p h < p le then find_l tl h (le::nlst) else find_l tl le (h::nlst)
   | [] -> (le, nlst)

let find3 (h::tl) = find_l tl h []

let rec mkHTree lst = 
  match lst with
   [elem] -> elem
 | _ -> let (smls1, rest) = find3 lst
        in let (smls2, rest2) = find3 rest
        in mkHTree (Node (p smls1 +. p smls2, smls1, smls2) :: rest2)
