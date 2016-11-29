let rozniczka f x dx = (f(x+.dx) -. f(x))/.dx
let epsilon = 1e-10
let pochodna f x = rozniczka f x epsilon


let rec iteruj poczatek popraw czy_dobre wynik =
  if czy_dobre poczatek then
    wynik poczatek
  else
    iteruj (popraw poczatek) popraw czy_dobre wynik

let id x = x
let newton f x=
  let f' = pochodna f
  in
    let czy_dobre x = abs_float (f x) < epsilon
    and popraw x = x -. (f x) /. (f' x)
    in
      iteruj x popraw czy_dobre id

 (* newton (function x -> x *. x -. 4.) 0. *)

 let sqrt' a =
  let f x = a -. x *. x
  in
    newton f 1.

  (* Punkty stałe funkcji *)
  let punkt_staly f x =
    let blisko x = abs_float (x -. f x) < epsilon
    in
      iteruj x f blisko f

  let usrednienie f = function x -> (x +. f x) /. 2.
  let sqrt'' x =
    let f = usrednienie (function y -> x /. y)
    in
      punkt_staly f 1.0
