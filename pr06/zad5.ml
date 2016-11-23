(* prolog.ml *)

(* An atom is either a propositional variable or an alternative of two goals. *)
type atom =
  | Atom of string
  | Or of goal * goal
(* A goal is a list of atoms. *)
and goal = atom list
(* A clause consists of a head (a propositional variable) and a body (a goal). *)
type clause = string * goal
(* A Prolog program is a list of clauses. *)
type program = clause list

(* Search a program for a clause with a given head. *)
let rec lookup x pgm =
  match pgm with
    | [] ->
      None
    | (y, g) :: p ->
      if x = y then Some g else lookup x p

(*
A propositional Prolog interpreter written in CPS with two layers of continuations:
a success and a failure continuation.

The failure continuation is parameterless and it specifies what should happen next in case of a failure in the current goal.

The success continuation takes a failure continuation as an argument and it specifies
what should happen next in case the current goal is satisfied.
*)

(*      eval_atom : atom -> program -> ((unit -> 'a) -> 'a) -> (unit -> 'a) -> 'a *)
let rec eval_atom a p sc fc =
  match a with
    | Atom x -> (* lookup zwraca cele dla danego atomu jeśli atom występuje *)
      (match (lookup x p) with
	| None ->
	  fc () (* nie ma takiego atomu == wykonanie funkcji porażki *)
	| Some g ->
	  eval_goal g p sc fc)
    | Or (g1, g2) ->
      eval_goal g1 p sc (fun () -> eval_goal g2 p sc fc)

(*  eval_goal : goal -> program -> ((unit -> 'a) -> 'a) -> (unit -> 'a) -> 'a  *)
and eval_goal g p sc fc =
  match g with
    | [] ->
      sc fc  (* funkcja sukcesu z zaalpikowaną funkcją porażki, np. sprawdzenie kolejnego celu(goal - zapytania) z listy *)
    | a :: g -> (* zajęcie się pierwszym atomem z listy i odroczenie wykonania reszty w funkcji sukcesu która przyjmie funkcję porażki z wcześniejszego wykonania *)
      eval_atom a p (fun fc' -> eval_goal g p sc fc') fc

(*  run : goal ->  program -> bool  *)
let run g p = eval_goal g p (fun _ -> true) (fun () -> false)
(*
Zmień definicję funkcji run (i tylko tej funkcji) tak by interpreter liczył na ile spsobów dany cel może być spełniony przy danym programie zamiast sprawdzać tylko czy może być spełniony. (W interpreterze pojawi się nieogonowe wywołanie -- czy potrafisz zmodyfikować cały interpreter, tak by je wyeliminować?)
*)
(*
Pierwotnie funkcja sukcesu zwraca prawdę dla dowolnie przekazanego argumentu (wiemy że będzie to funkcja porażki). By policzyć ilość możliwych dróg dojścia do prawdy (spełnienia celu) trzeba w tej funkcji wykonać przekazaną funkcję porażki, bo może ona zawierać (i pewnie zawiera skoro doszliśmy do tego momentu) alternatywy wykonania celu, które mogą się spełnić. Mechanizm ten powinien zwiększyć licznik sukcesów.
*)
let run' g p = eval_goal g p (fun fc' -> 1 + fc'() ) (fun () -> 0)
(* teraz pozbądź się wywołania ogonowego *)
let run'' g p = eval_goal g p (fun fc' -> 1 + fc'() ) (fun () -> 0)

(* tests *)

let p1 = [("a", [Atom "b"; Atom "c"]);
	  ("b", [])]

let p2 = [("a", [Atom "b"; Or ([Atom "c"], [Atom "d"]); Atom "e"]);
	  ("b", [Atom "d"]);
	  ("d", []);
	  ("e", [Atom "d"])]

let p3 = [("a", [Atom "b"; Or ([Atom "c"], [Atom "d"]); Atom "e"]);
	  ("b", [Atom "d"]);
	  ("c", []);
	  ("d", []);
	  ("e", [Atom "d"])]

let g1 = [Atom "a"]

let v1_1 = run g1 p1
let v1_2 = run g1 p2
let v1_3 = run g1 p3

(* eof *)
