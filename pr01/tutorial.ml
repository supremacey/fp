let my_int = 1 + 2
(* let my_bool = True || False *)
let my_string = "Hello" ^ " " ^ "World"

(* Lists and Arrays *)
let my_list = ["I"; "am"; "a"; "list"]
let my_arr = [|"I"; "am"; "an"; "array"|]

(* List.rev my_list *)
(* List.hd my_list *)

(* Array.append [|1;2;3|] [|4;5;6|] *)
(* Array.get [|1;2;3|] 2 *)
(* [|1;2;3|].(2) *)

(* String.make 10 'x' *)
(* "Me" ^ " and You" *)
(* String.lenght "abcdefghijklno" *)
(* String.lowercase "MARRY" *)
(* String.concat "/" ["usr";"bin";"something"] *)
(* int_of_string "234" *)

("My", 1 , "touple")
fst (1,2)
snd (3,4)

(* Mutable - Modifid a variable - acociated value *)
let x = ref 42
(* Chainging the value *)
x := 100/4
(* Accessgin the mutable *)
let y = !x + 1

print_string "x = ";
print_int !x;
print_newline ()
Printf.printf "x = %d. Bye %s\n" !x "John"

(* Lists - xs is a reference to list *)
let xs = ref []
xs := 1::2::3::!xs
(* let xl = ref []

for i = 1 to 10 do
  xl := i :: !xl
done *)
