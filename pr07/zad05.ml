(* #use "zad05.ml";; *)
(* Zadanie 5 *)
(* Listy cykliczne *)
type 'a lnode = {item:'a; mutable next:'a lnode}

let insert_tail e l =
  let last = {item= e; next= l.next}
  in l.next <- last; last;;

let mcl a =
  let rec it = {item=a; next = it} in
  it

let mk n =
  let l = ref (mcl 1) in
  for i=2 to n do
    l := insert_tail i !l done; !l;;

(* Aplikacja funkcji jest silniejsza niż :: !!! *)
(* when entry = entry.next !!! zapletlenie w nieskonczonosc - uzywaj == *)
(* joseph: int -> int -> int list = <fun> *)
let joseph n m =
  let ppl = mk n in
  let rec forth_back mi cl rl =
    match (mi, cl) with
      (_, entry) when entry == entry.next -> (entry.item::rl)
    | (1, entry) -> let v = entry.next.item in begin
                          entry.next <- entry.next.next;
                          forth_back m entry (v::rl) end
    |   _   -> forth_back (mi-1) cl.next rl
  in forth_back m ppl [] |> List.rev

(* -------------------------------------------------------------------- *)
(* inne funkcje do listy cyklicznej *)
let insert_head e l =
  let head = {item= e; next= l.next}
  in l.next <- head; l;;

let hd l = l.next.item
let tl l = l.item

let remove_head l =
  let at_new_head = l.next.next in
  let rec h = {item = l.next.item; next = h} in
  l.next <- at_new_head; h;;

let take_head l =
  let h = l.next.item in
  l.next <- l.next.next; h;;

let elim_head l = l.next <- (l.next).next; l;;

let rec take n cl =
  match n with
    0 -> let v = cl.next.item in begin cl.next <- cl.next.next; v end
  | _ -> take (n-1) cl.next

let ih = insert_head
let it = insert_tail
let rh = remove_head
let eh = elim_head
let th = take_head
let ppl = List.fold_right it [7;6;5;4;3;2] (mcl 1);;
