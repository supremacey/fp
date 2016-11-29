# Lista zadań nr 7
## Zadanie 1 (5p.)

- Zdefiniuj operator stałopunktowy fix typu `(('a->'b)->'a->'b)->'a->'b`, który pozwoli na wyznaczanie punktu stałego funkcji typu ``('a->'b)->'a->'b`, a co za tym idzie na definiowanie rekurencyjnych funkcji bez użycia konstrukcji let rec. Np. silnię można wyrazić przy użyciu fix następująco:

```ocaml
fix (fun f -> fun n -> if n = 0 then 1 else n * (f (n-1)))
```
- Nie używając rekursji (tj. konstrukcji let rec) zdefiniuj funkcję obliczającą silnię (użyj referencji). W podobny sposób zdefiniuj funkcję fix.

## Zadanie 2 (3p.)

Rozważmy modyfikowalne listy zdefiniowane następująco:
```ocaml
type 'a list_mutable = LMnil | LMcons of 'a * 'a list_mutable ref
```
Zaimplementuj konkatenację list typu `'a list_mutable` na dwa sposoby:
- funkcja `concat_copy` buduje listę wynikową kopiując pierwszy argument;
- funkcja `concat_share` buduje listę wynikową bez kopiowania argumentów.

## Zadanie 3 (6p.)

Technika memoizacji pozwala wykorzystać cechy imperatywne języka w celu zwiększenia efektywności działania funkcji, która sama jest czysto funkcyjna, tj. kolejne wywołanie takiej funkcji dla tego samego argumentu zwróci tę samą wartość. Memoizacja polega na zapamiętywaniu wartości wywołań funkcji dla konkretnych argumentów w pewnej strukturze danych, i na wyszukiwaniu potrzebnych wartości przy kolejnych wywołaniach tej funkcji. Aby umożliwić memoizację dowolnej jednoargumentowej funkcji, zaimplementuj następujący schemat:

- zdefiniuj typ polimorficzny służący jako tablica wartości wywołań dowolnej funkcji;
- napisz funkcję tworzenia pustej tablicy;
- napisz funkcję wyszukiwania w tablicy wartości funkcji dla zadanego argumentu;
- napisz funkcję dopisującą do tablicy nową wartość wywołania funkcji.

Wykorzystaj ten schemat do memoizacji funkcji wyznaczającej kolejne liczby Fibonacciego: napisz funkcję `fib : int -> int` według standardowej definicji oraz funkcję `fib_memo : int -> int` wykorzystującą memoizację. Porównaj czasy działania obu funkcji.

Czy funkcja `fib_memo` spełnia Twoje oczekiwania w kwestii efektywności? Zdefiniuj wyspecjalizowaną wersję funkcji `fib_memo`, która maksymalnie memoizację w sposób bardziej efektywny niż ogólna technika.

## Zadanie 4 (3p.)

Napisz funkcję fresh typu string -> string generującą świeże nazwy, której kolejne wywołania mają następujący efekt:
```ocaml
# fresh "x";;
- : string = "x1"
# fresh "x";;
- : string = "x2"
# fresh "x";;
- : string = "x3"
# fresh "y";;
- : string = "y4"
```
itd... oraz funkcję `reset` typu `int -> unit`, która ustawia początkową wartość generowanego indeksu dla następnych wywołań funkcji fresh, np.
```ocaml
# fresh "x";;
- : string = "x1"
# fresh "x";;
- : string = "x2"
# reset 5;;
- : unit = ()
# fresh "x";;
- : string = "x6"
# fresh "x";;
- : string = "x7"
```
__Uwaga!__ Funkcje nie mogą wykorzystywać żadnych zmiennych globalnych.

## Zadanie 5 (3p.)

Rozwiąż problem Józefa, tj. zadanie 4 z listy kontrolnej do wykładu 6.

Problem Józefa definiuje się następująco (Cormen et al. str. 340). Niech n osób stoi w okręgu oraz niech dana będzie liczba m <= n. Rozpoczynając od wskazanej osoby, przebiegamy po okręgu, usuwając co m-tą osobę. Po usunięciu każdej kolejnej osoby odliczanie odbywa się w nowo powstałym okręgu. Proces ten postępuje, aż zostaną usunięte wszystkie osoby. Porządek, w którym osoby stojące początkowo w okręgu są z niego usuwane, definiuje permutację Józefa typu (n,m) liczb 1, 2, ... ,n. Na przykład permutacją Józefa typu (7,3) jest <3,6,2,7,5,1,4>. Napisz funkcję typu int -> int -> int list, która dla danych n oraz m zwraca listę z permutacja Józefa typu (n,m). Należy wykorzystać listę cykliczną.

_Ostatnia modyfikacja: poniedziałek, 21 listopad 2016, 11:10_
