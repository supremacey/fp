(* #use "zad04.ml";; *)
(* fresh: string -> string = <fun> *)
(* reset: int -> unit = <fun> *)

let (fresh, reset) =
  let v = ref 1
  in let f str = let msg = str ^ (string_of_int !v)
                 in begin v:= 1 + !v; msg end
  in let r nv = v := nv
  in f, r
