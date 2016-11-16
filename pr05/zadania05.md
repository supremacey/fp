# Lista zadań nr 5
## Zadanie 1 (4p.)

Zdefiniuj typ do reprezentacji leniwych nieskończonych ciągów elementów dowolnego typu (strumieni) tak, jak na wykładzie. Następnie:

zdefiniuj strumień przybliżający wartość liczby π z rosnącą dokładnością, korzystając ze wzoru Leibniza:
```ocaml
π/4 = 1 - 1/3 + 1/5 - 1/7 + ...;
```
napisz funkcję przekształcającą dowolny strumień
```ocaml
x1,x2,x3,...
```
w strumień postaci
```
f x1 x2 x3, f x2 x3 x4, f x3 x4 x5,...,
```
dla dowolnej funkcji _f_;
korzystając z powyższych definicji i transformacji Eulera:
```ocaml
F x y z = z - (y-z)2/(x-2y+z)
```
utwórz nowy strumień, szybciej zdążający do liczby π.
Napisz te same definicje używając konstrukcji lazy i force z modułu Lazy. Dlaczego lazy jest specjalną konstrukcją języka, a nie funkcją?

## Zadanie 2 (8p.)

Mamy ciąg szklanek o znanych pojemnościach, a także kran i zlew. W każdym ruchu możemy wykonać jedną z trzech czynności:

napełnić jedną ze szklanek wodą z kranu (FILL),
opróżnić jedną ze szklanek do zlewu (DRAIN),
przelać wodę z jednej ze szklanek do innej (TRANSFER).
Stan takiego układu szklanek możemy zapisać przy użyciu dwóch list reprezentujących odpowiednio pojemności szklanek i ilość wody znajdującą się w każdej z nich. Przykładowo, para ([4; 9], [4; 6]) oznacza że dysponujemy dwiema szklankami, oraz że pierwsza z nich jest pełna, zaś w drugiej znajduje się 6 jednostek wody. W takim przypadku efekty poniższych ruchów następująco zmieniają zawartość szklanek (czyli drugą z powyższych list; zwróć uwagę że można napełnić pełną szklankę):
```
FILL 1 → [4; 9]
FILL 0 → [4; 6]
DRAIN 0 → [0; 6]
TRANSFER (0, 1) → [1; 9].
```
Dla danego zestawu szklanek i danej objętości wody, rozwiązaniem nazywamy ciąg ruchów, który prowadzi do uzyskania w dowolnej ze szklanek zadanej objętości wody. Przykładowo, dla szklanek [4, 9] i objętości 5, rozwiązaniem jest ciąg [FILL 1, TRANSFER (1, 0)] (a także wiele innych, redundantnych ciągów).

Użyj leniwych list aby zdefiniować funkcję `nsols : (int list * int) -> int -> move list list`, taką że `nsols (glasses, volume) n` zwróci listę n najkrótszych rozwiązań problemu zadanego przez glasses i volume (typ danych move powinien reprezentować pojedynczy ruch). W przypadku gdy rozwiązanie nie istnieje, program może się zapętlić.

Wskazówka: Ponieważ dopuszczamy redundantne ciągi (np. przelewanie z pustego w próżne), a także możemy się zapętlić gdy rozwiązanie nie istnieje, nie potrzeba sprawdzać czy daną konfigurację można osiągnąć w inny (potencjalnie lepszy) sposób.

Uwaga: Dzięki użyciu leniwych list, możliwa jest implementacja w której w programie let f = nsols (g, v) in (f n; f n) drugie wywołanie f n działa w czasie O(n).

## Zadanie 3 (8p.)

Kodowanie Huffmana jest prostą metodą bezstratnej kompresji. Załóżmy, że dana jest lista asocjacyjna złożona z par (symbol, częstość występowania). Zaimplementuj statyczny algorytm kodowania i dekodowania napisów (czyli ciągów symboli z listy) według następujących zasad:

Drzewo kodowe jest drzewem binarnym, w którego liściach znajdują się symbole wraz z ich częstościami, a w każdym węźle znajduje się suma częstości poddrzew lewego i prawego. __Zdefiniuj typ takich drzew htree.__

__Algorytm budowy drzewa Huffmana jest następujący:__

- Mając daną listę drzew, wybieramy z niej dwa drzewa o najmniejszych częstościach (ten wybór nie musi być jednoznaczny).

- Usuwamy te drzewa z listy, łączymy je w jedno drzewo i wstawiamy do listy.
- Kontynuujemy aż do otrzymania listy jednoelementowej (czyli drzewa kodowego).
- Początkowa lista składa się z liści otrzymanych z listy częstości.

- Łączenie dwóch poddrzew polega na utworzeniu nowego drzewa o częstości będącej sumą częstości obu poddrzew.

Zaimplementuj funkcję `mkHTree : (char * int) list -> htree` implementującą ten algorytm.

Kodem symbolu jest zapis ścieżki od korzenia drzewa kodowego do liścia zawierającego ten symbol, gdzie ścieżka jest reprezentowana jako ciąg zer i jedynek, w którym 0 oznacza zejście do lewego poddrzewa, a 1 zejście do prawego poddrzewa (lub na odwrót, ale jednakowo dla wszystkich symboli). Kod napisu to ciąg kodów wszystkich symboli tego napisu. Dla wybranego typu strumieni α stream zdefiniuj funkcję encode : htree -> char stream -> char stream, gdzie znaki w strumieniu wyjściowym oznaczają bajty upakowane bitami zakodowanego strumienia (biblioteka OCamla nie dostarcza domyślnie typów danych odpowiadających słowom; do stworzenia "znaków" użyj funkcji Char.chr).

Dekodowanie jest procesem odwrotnym: dla danego ciągu zer i jedynek kodującego pewien napis, wędrujemy po drzewie według kierunków zapisanych w kodzie, zaczynając od korzenia. Gdy dotrzemy do liścia, odczytujemy umieszczony w nim symbol i odrzucamy wykorzystany dotąd fragment kodu. Następnie dla pozostałego fragmentu kodu wracamy do korzenia i odszukujemy kolejne symbole, aż do wyczerpania kodu. Zdefiniuj funkcję decode : htree -> char stream -> char stream odwrotną do funkcji encode. Wartości liczbowe znaków odzyskaj używając Char.code.

Na bazie swojej implementacji zaprogramuj funkcję kompresującą oraz funkcję dekompresującą pliki tekstowe. Funkcja kompresująca powinna na podstawie zawartości zadanego pliku wejściowego wyliczyć częstości występowania symboli, utworzyć drzewo Huffmana, a następnie zakodować plik wejściowy do pliku wyjściowego używając funkcji encode. Funkcja powinna też zwrócić skonstruowane drzewo Huffmana. Funkcja dekompresująca powinna na podstawie zawartości zadanego pliku wejściowego, zawierającego skompresowany tekst (i być może dodatkowe informacje) oraz drzewa Huffmana przeprowadzić dekodowanie tekstu, zapisując odkodowany tekst do pliku wyjściowego.

Ostatnia modyfikacja: środa, 9 listopad 2016, 13:59
