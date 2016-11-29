(* Zadanie kontrolne 1 *)
let echo ()= let rpt = ref false in
  while not !rpt do
    let line = read_line() in
    if Bytes.contains line '.' then begin
        let idx = Bytes.index line '.' in
        output stdout line 0 idx;
        rpt := true;
      end
    else
      print_string line;
    print_newline ()
  done
