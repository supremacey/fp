# Lista zadań nr 2 na pracownię 19 października 2016

_Uwaga: poniższe zadania należy rozwiązać bez użycia funkcji bibliotecznych z modułu List._

## Zadanie 1 (3p.)

Napisz funkcję znajdującą wszystkie podlisty (rozumiane jako podciągi, niekoniecznie konsekutywnych elementów) listy zadanej jako argument. Zadbaj o to by Twoja funkcja nie generowała nieużytków.

## Zadanie 2 (2p.)

Napisz dwie wersje funkcji (w tym jedną za pomoca rekursji ogonowej), która oblicza n-ty wyraz ciągu zdefiniowanego wzorem:

a0 = 0
an = 2 * an-1 + 1 dla n > 1
a następnie porównaj ich działanie dla dużych n (np. dla n = 1000000).

## Zadanie 3 (3p.)

 Zdefiniuj funkcję cycle : 'a list -> int -> 'a list, która w cykliczny sposób przesuwa listę o zadaną liczbę pozycji n, przy czym zakładamy, że długość listy jest nie mniejsza niż n. Np. cycle [1;2;3;4] 3 = [2;3;4;1].


## Zadanie 4 (6p.)

Napisz funkcję merge, która łączy dwie listy posortowane rosnąco w pewnym porządku ≤ tak, by wynik działania funkcji był także listą posortowaną rosnąco w tym samym porządku. Argumentami funkcji merge powinny być: funkcja cmp typu 'a -> 'a -> bool (zakładamy, że cmp a b = true wtw a ≤ b) i dwie listy elementów typu 'a. Przykład: merge (<=) [1;2;5] [3;4;5] utworzy listę [1;2;3;4;5;5].
Zapisz tę funkcję używając rekursji ogonowej, a następnie porównaj działanie obu funkcji na odpowiednich przykładach.
Wykorzystaj funkcję merge w wersji ogonowej do napisania funkcji sortowania przez scalanie.
Zaproponuj alternatywną implementację algorytmu sortowania przez scalanie, w której funkcja merge jest ogonowa, ale nie wykonuje odwracania list. Nie przejmuj się, jeżeli otrzymasz algorytm sortowania, który nie jest stabilny. Porównaj szybkość działania tej implementacji z tą z punktu 3.

## Zadanie 5 (3p.)

Napisz funkcję zwracającą listę wszystkich permutacji zadanej listy.

## Zadanie 6 (3p.)

Napisz funkcję generującą wszystkie sufiksy danej listy. Na przykład dla listy [1;2;3] Twoja funkcja powinna zwrócić listę [[1; 2; 3]; [2; 3]; [3]]. Następnie, napisz funkcję generującą wszystkie prefiksy danej listy. Na przykład dla listy [1; 2; 3] Twoja funkcja powinna zwrócić listę [[1]; [1; 2]; [1; 2; 3]].
