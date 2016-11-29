(* #use "zad03.ml";; *)
exception Not_found
(* zdefiniuj typ polimorficzny służący jako tablica wartości wywołań dowolnej funkcji; *)
type ('a, 'b) entry = ENone | ESome of 'a * 'b
type ('a, 'b) mem_t = MTEnd | MTCons of ('a, 'b) entry * ('a, 'b) mem_t ref

(* napisz funkcję tworzenia pustej tablicy; *)
let empty_mem = function () -> MTCons(ENone, ref MTEnd)

(* napisz funkcję wyszukiwania w tablicy wartości funkcji dla zadanego argumentu; *)
let mem_out key mt =
  let rec aux t =
    match t with
      MTEnd -> raise Not_found
    | MTCons(ESome(k, v), tl) when k = key -> v
    | MTCons(en, tl) -> aux !tl
  in aux mt

(* napisz funkcję dopisującą do tablicy nową wartość wywołania funkcji. *)
(* TODO: popraw by nie dopisywał wartości już istniejących *)
let mem_in mt key vl =
  let rec aux t =
    match t with
      MTCons(_, last) when !last = MTEnd -> let new_entry =
          MTCons(ESome(key,vl), ref MTEnd) in
          begin last := new_entry; new_entry end
    | MTCons(_, tl) -> aux !tl
    | MTEnd -> raise (Failure "Invariant")
  in aux mt

(* funkcje *)
(* Coś tu jest podejżane *)
let rec fib n = if n < 3 then 1 else fib(n-1) + fib(n-2)
(* wersja maksymalizująca zapamiętuje (czy aby na pewno?) wszystkie rozwiązania pośrednie *)
let fib_memo =
  let mt = empty_mem () in
  let rec fhelp = function n -> if n < 3 then 1 else fm(n-1) + fm(n-2)
  and fm = function arg ->
    try mem_out arg mt with
      Not_found -> let MTCons(ESome(_,v),_) = mem_in mt arg (fhelp arg) in v
  in fm


(* tests *)
let empty = empty_mem ()
