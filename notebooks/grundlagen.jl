### A Pluto.jl notebook ###
# v0.20.19

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    return quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ 7591351c-557a-43f3-81bc-bf1ebab82c8a
begin
	using PlutoTeachingTools
	using PlutoUI
	using Makie
	TableOfContents()
end

# ╔═╡ f5a35dee-973b-4c2a-bb2c-c5e537a77286
html"""
<h1 style="text-align:center">
	Höhere Mathematik I
</h1>
<div style="text-align:center">
	<p style="font-size: 30px; font-variant: small-caps; margin: 0px">
		Michael Schlottke-Lakemper, Manuel Torrilhon
	</p>
	<p style="font-size: 20px;">
		Universität Augsburg, Wintersemester 2025/2026
	</p>
</div>
"""

# ╔═╡ 6ddda10c-a37b-11f0-30e2-8f65d0703675
md"""
# 1 Grundlagen
"""

# ╔═╡ 957cdb10-9e44-4864-99b3-0dfce2623592
md"""
## 1.1 Mengen, Relationen, Abbildungen

### 1.1.1 Mengen

##### Definition: Menge (Georg Cantor, 1845-1918)
"Eine Zusammenfassung wohlunterschiedener Objekte unserer Anschauung oder unseres Denkens." Die Objekte heißen Elemente der Menge.

Charakterisierung:
+ direkt: $A = \lbrace 6 \text{ Eier}, \text{Brot}, \text{Flasche Wasser}\rbrace$ oder $B = \lbrace a. b, c \rbrace$
+ sprachlich: $A_{A} = \lbrace\text{alle Autos in Augsburg}\rbrace$
+ per Eigenschaft: $A_{10} = \lbrace x \mid x \text{ ist ganze Zahl}, x > 10\rbrace$
Schreibweise: $M = \lbrace x \in Y \mid A(x) \rbrace$.\

D.h. $M$ besteht aus allen Elementen aus $Y$, die Aussage $A$ erfüllen.
"""

# ╔═╡ 76fb8daf-7b6e-465d-9155-09158623cf98
md"""
##### Definition: Leere Menge
 $\lbrace \rbrace$ oder $\emptyset$ Menge ohne Element

Wir schreiben: $x \in A$ ($x$ ist in Menge $A$ enthalten) oder $x \not\in A$ ($x$ ist nicht in Menge $A$ enthalten), z.B. $\text{Milch}\not\in A,\,12 \in A_{10}$
"""

# ╔═╡ 4ff5ab25-1d37-4b65-a35b-e36490f609c9
md"""
##### Definition:
 1.  $A \subset B$ bedeutet $A$ ist Teilmenge von $B$, $\lbrace a, b\rbrace \subset \lbrace a,b,c \rbrace$
 2.  $A \supset B$ bedeutet $A$ ist Obermenge von $B$, $\lbrace\text{alle Autos}\rbrace \supset A_A$
 3.  $A = B$ bedeutet $A \subset B$ und $B \subset A$
"""

# ╔═╡ 5eca419c-414b-426e-9a12-d7cc8cf74393
md"""
##### Bemerkung:
 1. Wir schreiben $12 \in A_{10}$, aber $\lbrace 12 \rbrace \subset A_{10}$
 2. Bei $A \subset B$ darf $A = B$ sein, ansonsten schreiben wir $A \subsetneq B$.$br
    Aber Achtung: das ist eine Konvention hier und kann in anderen Fachgebieten anders sein!
"""

# ╔═╡ aa2a97bb-a168-452c-bf92-e942d2e74982
md"""
#### Mengen-Algebra
Vereinigung $A \cup B := \lbrace x \mid x \in A \text{ oder } x\in B\rbrace$, sprich: $A$ vereinigt $B$

Durchschnitt $A \cap B := \lbrace x \mid x \in A \text{ und } x\in B\rbrace$, sprich: $A$ geschnitten $B$

Differenz $A \setminus B := \lbrace x \mid x \in A \text{ und } x\notin B\rbrace$ sprich: $A$ ohne oder minus $B$
"""

# ╔═╡ d2de929f-f14d-4ef5-a4c9-fbdfd6ddb602
RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/835f994cea656cfd1c374638dd8b6e7984ef4d5e/notebooks/assets/mengen.svg", "./assets/mengen.svg")

# ╔═╡ b4cc522e-9673-4fd3-8b7f-2a47732ba78e
md"""
"Rechenregeln", seien $A, B$ und $C$ Mengen
 1.  Allgemein
     * $A \setminus \emptyset = A$
     * $A\cup\emptyset = A$
     * $A\cap\emptyset = \emptyset$
     * $A \subset A \cup B$
     * $A \cap B \subset A$
 2.  Kommutativgesetz
     * $A \cup B = B \cup A$
     * $A \cap B = B \cap A$ 
 3.  Assoziativgesetz
     * $(A \cup B) \cup C = A \cup (B \cup C)$
     * $(A \cap B) \cap C = A \cap (B \cap C)$
 4.  Distributivgesetz
     * $A \cup(B \cap C) = (A\cup B) \cap (A \cup C)$
     * $A \cap(B \cup C) = (A\cap B) \cup (A \cap C)$
 5.  de Morgansche Regeln
     * $A \setminus (B \cup C) = (A\setminus B) \cap (A\setminus C)$
     * $A \setminus (B \cap C) = (A\setminus B) \cup (A\setminus C)$
"""

# ╔═╡ 2cd4661a-00a5-4b19-9227-8eda8bdfeb0c
md"""
##### Definition:
 1.  $A$ und $B$ heißen disjunkt, falls $A \cap B = \emptyset$ (kein gemeinsames Element)
 2. Für $A \subset B$ ist das Komplement $A^C$ definiert als $A^C := \lbrace x\in B \mid x\not\in A\rbrace (= B \setminus A)$, das Komplement wird tlw. auch mit $\overline A$ bezeichnet
"""

# ╔═╡ 7c67f3a0-a2f2-4026-86da-e059875d3758
md"""
##### Definition: Aussagen- und Prädikatenlogik
 1. Eine _Aussage_ ist stets entweder wahr oder falsch.
 2. Aussagen $A$ und $B$ können mit den folgenden Junktoren zu einer Aussage verknüpft werden
    +  $\neg A\qquad\quad\;$ $A$ gilt nicht
    +  $A \land B\qquad$ $A$ und $B$ gelten
    +  $A \lor B\qquad$ $A$ oder $B$ (auch beide) gelten
    +  $A \Rightarrow B\quad\;\;$ aus $A$ folgt $B$, bzw. $A$ impliziert $B$
    +  $A \Leftrightarrow B\quad\;\;$ $A$ und $B$ sind äquivalent, bzw. $A$ genau dann, wenn $B$
 3. Variablen in Aussagen können nur mit in Kombination mit Quantoren vorkommen
    +  $\forall x\in M\quad\;$ für alle $x$ in $M$ gilt ...
    +  $\exists x\in M\quad\;$ es gibt (mind. ein) $x$ in $M$, so dass ...
 4. Eine Aussage, die nicht weiter in Teilaussagen zerlegt werden kann, nennen wir _atomare Aussage_.
"""

# ╔═╡ 2db6ffd9-f146-4c9a-86c1-aefc917fbd42
md"""
##### Definition: Wahrheitstabelle
Eine Wahrheitstabelle gibt für eine Aussage die Wahrheitswerte an, die diese für alle möglichen Wahrheitswerte der ihr zugrundeliegenden atomaren Aussagen an.

##### Beipiel:
Für die obigen vorgestellten Junktoren fassen wir die Wahrheitstabellen zu der Folgenden zusammen. ($0$ bedeutet, dass die Aussage falsch ist, $1$, dass die Aussage wahr ist.)

|$A$|$B$|$\neg A$|$\neg B$|$A \land B$|$A \lor B$|$A \Rightarrow B$|$A \Leftrightarrow B$|
|:-:|:-:|:------:|:------:|:---------:|:--------:|:---------------:|:-------------------:|
|$0$|$0$|  $1$   |  $1$   |    $0$    |    $0$   |      $1$        |      $1$            |
|$0$|$1$|  $1$   |  $0$   |    $0$    |    $1$   |      $1$        |      $0$            |
|$1$|$0$|  $0$   |  $1$   |    $0$    |    $1$   |      $0$        |      $0$            |
|$1$|$1$|  $0$   |  $0$   |    $1$    |    $1$   |      $1$        |      $1$            |

##### Definition: Tautologie
Eine Aussage, die stets wahr ist, ungeachtet welche Wahrheitswerte ihre atomaren Aussagen haben, heißt _Tautologie_.

##### Bemerkung:
Sind zwei Aussagen $A$ und $B$ äquivalent, so ist $A \Leftrightarrow B$ eine Tautologie. Das heißt auch, dass die entsprechenden Zeilen der Wahrheitstabellen der Aussagen $A$ und $B$ in ihren Wahrheitswerten gleich sind.
"""

# ╔═╡ 1e9ab1ed-d7a9-4bfe-a9d6-743cf54a583a
md"""
### 1.1.2 Relationen
"""

# ╔═╡ 729ddb69-3eda-4885-bd99-7129b6256bba
md"""
##### Definition:
Für zwei Mengen $A$ und $B$ heißt die Menge
$A \times B := \lbrace (a,b) \mid a \in A, b\in B \rbrace$
das kartesische Produkt. (René Descartes latinisiert "Cartesius")

##### Bemerkung:
 1. Reihenfolge ist wichtig: $(a,b) \neq (b,a)$!
 2. Analog $A \times B \times C = \lbrace (a,b,c) \mid a\in A, b\in B, c\in C\rbrace$ etc.
 3.  $(a,b)$ heißt Paar, $(a,b,c)$ Tripel, allg. $n$-Tupel

##### Beispiel:
 $A = \lbrace 1,2,3 \rbrace, B = \lbrace a, b, c, d \rbrace$, die Einträge in der Tabelle sind alle Elemente von $A \times B$

| $A\times B$ |  $a$  |  $b$  |  $c$  |  $d$  |
|:-----------:|:-----:|:-----:|:-----:|:-----:|
|      1      |$(1,a)$|$(1,b)$|$(1,c)$|$(1,d)$|
|      2      |$(2,a)$|$(2,b)$|$(2,c)$|$(2,d)$|
|      3      |$(3,a)$|$(3,b)$|$(3,c)$|$(3,d)$|

##### Definition:
Eine (beliebige) Teilmenge $R$ des Produkts $A\times B$ heißt _Relation_ zwischen $A$ und $B$. Für $R\subset A\times B$ schreiben wir $x\,R\,y$, d.h. $x$ steht in Relation $R$ zu $y$. Ist $A=B$, wird $R$ eine Relation in $A$ genannt.
"""

# ╔═╡ 275fb5d9-bc63-415b-98e4-644ebe7da628
md"""
##### Beispiel:
 
1. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c6214b008ebfecce9f3350b6609d3fcdfbf70778/notebooks/assets/bsp-mengen.svg","./assets/bsp-mengen.svg", :width=>200)) durch obigen Graphen lässt sich die folgende Relation beschreiben
|   |$a$|$b$|$c$|
|:-:|:-:|:-:|:-:|
|$a$| × | × |   |
|$b$|   | × | × |
|$c$| × |   |   |

2. Eltern-Kind-Beziehung, $A = \lbrace M, V, K_1, K_2 \rbrace$
|     |$M$|$V$|$K_1$|$K_2$|
|:---:|:-:|:-:|:---:|:---:|
| $M$ |   |   |     |     |
| $V$ |   |   |     |     |
|$K_1$| × | × |     |     |
|$K_2$| × | × |     |     |
3.  $\leq$, $R = \lbrace (x,y)\in A\times A \mid x \leq y \rbrace$, $A = \lbrace 1,2,3\rbrace$
|   |$1$|$2$|$3$|
|:-:|:-:|:-:|:-:|
|$1$| × | × | × |
|$2$|   | × | × |
|$3$|   |   | × |
"""

# ╔═╡ bd65fc51-d6e3-4d42-bfbb-a7ea0cff251a
md"""
##### Definition:
Eine Relation $R$ auf der Menge $A$ heißt (Total-)Ordnungsrelation, falls gilt (für $x,y,z\in A$)
 1.  $x\,R\,x$ für alle $x \in A$ (Reflexivität)
 2. aus $x\,R\,y$ und $y\,R\,z$ folgt $x\,R\,z$ für $x,y,z\in A$ (Transitivität)
 3. entweder gilt $x\,R\,y$ oder $y\,R\,x$ für $x\neq y$ (Antisymmetrie)
 4. für alle $x,y\in A$ gilt entweder $x\,R\,y$ oder $y\,R\,x$ (Totalität)
"""

# ╔═╡ 523a6731-5542-4131-88ff-3a9887c29751
@bind values PlutoUI.combine() do Child
	md"""
	mit den folgenden Auswahlschaltflächen lassen sich Eigenschaften der folgenden Relation fordern: Reflexivität:
	$(Child(CheckBox())) Symmetrie: $(Child(CheckBox())) Transitivität: $(Child(CheckBox()))
	"""
end

# ╔═╡ 120a5b13-6413-471a-a01a-41c4a35dfce5
let
	using LinearAlgebra
	mark(x) = x == 1 ? "×" : "";
    A = zeros(8,8)
	A[3,1] = 1
	A[3,5] = 1
	A[7,4] = 1
	A[4,2] = 1
	A[5,8] = 1

	if values[1]
		A .= clamp.(A .+ diagm(ones(8)), 0, 1)
	end
	if values[2]
		A .= clamp.(A + A', 0, 1)
	end
	if values[3]
		AA = clamp.(A + A * A, 0, 1)
		A4 = clamp.(A + AA * AA, 0, 1)
		A .= clamp.(A + A4 * A4, 0, 1)
	end
	t = [mark(A[i,j]) for i=1:8, j=1:8]
	
	md"""
	|   |$1$|$2$|$3$|$4$|$5$|$6$|$7$|$8$|
	|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
	|$1$|$(t[1,1])|$(t[1,2])|$(t[1,3])|$(t[1,4])|$(t[1,5])|$(t[1,6])|$(t[1,7])|$(t[1,8])|
	|$2$|$(t[2,1])|$(t[2,2])|$(t[2,3])|$(t[2,4])|$(t[2,5])|$(t[2,6])|$(t[2,7])|$(t[2,8])|
	|$3$|$(t[3,1])|$(t[3,2])|$(t[3,3])|$(t[3,4])|$(t[3,5])|$(t[3,6])|$(t[3,7])|$(t[3,8])|
	|$4$|$(t[4,1])|$(t[4,2])|$(t[4,3])|$(t[4,4])|$(t[4,5])|$(t[4,6])|$(t[4,7])|$(t[4,8])|
	|$5$|$(t[5,1])|$(t[5,2])|$(t[5,3])|$(t[5,4])|$(t[5,5])|$(t[5,6])|$(t[5,7])|$(t[5,8])|
	|$6$|$(t[6,1])|$(t[6,2])|$(t[6,3])|$(t[6,4])|$(t[6,5])|$(t[6,6])|$(t[6,7])|$(t[6,8])|
	|$7$|$(t[7,1])|$(t[7,2])|$(t[7,3])|$(t[7,4])|$(t[7,5])|$(t[7,6])|$(t[7,7])|$(t[7,8])|
	|$8$|$(t[8,1])|$(t[8,2])|$(t[8,3])|$(t[8,4])|$(t[8,5])|$(t[8,6])|$(t[8,7])|$(t[8,8])|
	"""
end

# ╔═╡ 349ac35e-10c9-4586-8517-f5b2739da6de
md"""
##### Beispiel:
 $A = \lbrace a, b, c \rbrace$

|$R_1$| a | b | c |$\qquad$|$R_2$| a | b | c |
|:---:|:-:|:-:|:-:|--------|:---:|:-:|:-:|:-:|
|  a  | × | × | × |        |  a  | × | × | × |
|  b  |   | × | × |        |  b  |   | × |   |
|  c  |   |   | × |        |  c  |   | × | × |

Welche "Ordnung/Reihenfolge" für $A$ erzeugt $R_1$ bzw. $R_2$?

 $R_1$: $\quad a\,R_1\,b,\quad a\,R_1\,c,\quad b\,R_1\,c\quad\Rightarrow a,b,c$

 $R_2$: $\quad a\,R_2\,b,\quad a\,R_2\,c,\quad c\,R_2\,b\quad\Rightarrow a,c,b$
"""

# ╔═╡ 84c3c863-3cf0-4903-af85-240485fac0a8
md"""
##### Definition:
Eine Relation $R$ auf der Menge $A$ heißt Äquivalenzrelation, falls gilt ($x,y\in A$)
 1.  $R$ ist reflexiv
 2.  $R$ ist transitiv
 3.  $R$ ist symmetrisch, d.h. aus $x\,R\,y$ folgt $y\,R\,x$
##### Bemerkung:
 1.  $R$ beschreibt ähnliche Elemente in $A$.
 2. Wir schreiben $x\,R\,y$ als $x\sim y$
"""

# ╔═╡ d2c4c84f-2591-466e-9aa5-ac5c70ce48e7
md"""
##### Beispiel 1:
 $A = \lbrace \Delta, \square, \nabla, \lozenge\rbrace$, Relation ist "Ähnlichkeit", d.h. gleiche Anzahl Ecken

|          |$\Delta$|$\square$|$\nabla$|$\lozenge$|
|:--------:|:------:|:-------:|:------:|:--------:|
| $\Delta$ |  ×     |         |   ×    |          |
|$\square$ |        |   ×     |        |    ×     |
| $\nabla$ |  ×     |         |    ×   |          |
|$\lozenge$|        |    ×    |        |    ×     |
##### Beispiel 2:
 $A = \lbrace 1,2,3,4,5,6 \rbrace$

|   |$1$|$2$|$3$|$4$|$5$|$6$|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|$1$| × |   |   | × |   |   |
|$2$|   | × |   |   | × |   |
|$3$|   |   | × |   |   | × |
|$4$| × |   |   | × |   |   |
|$5$|   | × |   |   | × |   |
|$6$|   |   | × |   |   | × |

##### Beispiel 3:
"Gleichheit" ist die triviale Äquivalenzrelation.

Eine Äquivalenzrelation erzeugt spezielle Teilmengen von ähnlichen Elementen.

##### Definition:
Für eine Äquivalenzrelation $\sim$ auf $A$ heißt $[x]_\sim := \lbrace y\in A \mid y\sim x\rbrace$ die Äquivalenzklassen zum Element $x$ und $x$ ist ein Repräsentant.

umsortieren von Bsp. 2 liefert:

|   |$1$|$4$|$2$|$5$|$3$|$6$|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|$1$| × | × |   |   |   |   |
|$4$| × | × |   |   |   |   |
|$2$|   |   | × | × |   |   |
|$5$|   |   | × | × |   |   |
|$3$|   |   |   |   | × | × |
|$6$|   |   |   |   | × | × |

$[1] = \lbrace 1, 4\rbrace,\quad [2] = \lbrace 2, 5\rbrace,\quad [3] = \lbrace 3, 6\rbrace$
##### Bemerkung:
Die Menge der Äquivalenzklassen heißt Faktormenge. Sie ist fundamental für Klassifizierungen jeder Art. Zum Beispiel "im kognitiven Prozess der Identifizierungsabstraktion."
"""

# ╔═╡ 51a86009-c8c0-4ad4-a4a9-e0e3a0b1c40d
md"""
### 1.1.3 Abbildungen
"""

# ╔═╡ 56383383-af81-43cc-8b21-d1ca822fa379
md"""
##### Definition:
Für zwei Mengen $A$, $B$ heißt die Relation $f\subset A\times B$ Abbildung oder Funktion von $A$ nach $B$, falls gilt: jedem $x\in A$ wird genau ein $y\in B$ zugeordnet. $A$ heißt Definitionsbreich und $B$ heißt Zielmenge.

##### Bemerkung:
 1. Im kartesischen Produkt ist in jeder Zeile nur genau ein Paar "markiert".
 2. Wir schreiben die Funktion typischerweise als $f$ mit $f:A\to B, x\mapsto f(x).$
 3. Im Gegensatz zur Zielmenge ist der Wertebereich $W_f\subset B$ gegeben durch $W_f = \lbrace f \in B \mid \exists x\in A \text{ mit } f(x) = y\rbrace = \mathrm{Im}(f)$
 4. Die Paare $\lbrace(x, f(x))\in A\times B \mid x\in A\rbrace$ (also die Relation) heißen Graph von $f$, $\mathrm{gr}(f)$.
 5.  $f$ bezeichnet die Operation oder den Vorgang der Abbildung, nicht den Wert oder das Resultat, $f(x) = x^2$, aber $f = (\cdot)^2$

##### Beispiel:
 1. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/e6e200f5162e4c52f553aaa2d8cbe70c805ffde9/notebooks/assets/bsp-abb.svg","./assets/bsp-abb.svg"))
 2. Die konstante Funktion ($c\in B$), $f:A\to B\quad x\mapsto y=f(x)=c$
 3. Die Identität $f:A\to A\quad x\mapsto y=f(x)=x.$ Wir schreiben $f = \mathrm{id}$, $A$ z.B. $\lbrace\text{alle Autos}\rbrace$, $\lbrace\text{alle Polynome}\rbrace$, etc.
 4. *  $f = \mathrm{Mikrowelle}$: 
    *  $A = \lbrace\text{essbares}\rbrace\cap\lbrace\text{kein  Metall}\rbrace\cap\lbrace\text{enthält Wasser}\rbrace$,
    *  $B = \lbrace\text{heißes}\rbrace$,
    *  $\mathrm{Im}(f)=B\cap A$.

##### Definition:
 1. Für $f:A\to B$ und $M\subset A$ heißt die Menge $f(M) := \lbrace y\in B\mid \exists x\in M\text{ mit }f(x) = y\rbrace\subset B$ das Bild von $M$.
 2. Für $f:A\to B$ und $N\subset B$ heißt die Menge $f^{-1}(N) := \lbrace x\in A\mid f(x) \in N\rbrace\subset A$ das Urbild von $N$.

##### Bemerkung:
Die Umkehrfunktion $f^{-1}$ wird später behandelt!
"""

# ╔═╡ c90137b8-4c17-4742-a67a-ddebee962a9b
md"""
##### Beispiel:
1. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/bbbd2f9e2d2fe86332b5503998fd3cca904fa2d6/notebooks/assets/preimage.svg","./assets/preimage.svg"))

2. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/image.svg","./assets/image.svg"))

3. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/urbild.svg","./assets/urbild.svg"))
"""

# ╔═╡ 16adae15-bcf7-4c5e-9d37-2181fe64a164
@bind bilder PlutoUI.combine() do Child
	md"""
	 Zur Veranschaulichung der obigen Grafiken betrachten wir die Normalparabel und ihre Umkehrfunktion, die Wurzelfunktion. An den Slidern können Sie das Intervall $[a,b]$ für $f(x)$ und die Umkehrfunktion $g(x) = f^{-1}(x)$ bestimmen.
	
	a = $(
		Child(PlutoUI.Slider(0.1:0.2:5.0, show_value=true))
	) 
	
	b = $(
		Child(PlutoUI.Slider(0.1:0.2:5.0, show_value=true))
	)
	"""
	
end

# ╔═╡ 85a2c951-9117-4318-8ed1-9950483aa1b2
let
	using GLMakie
	f(x) = x^2
	g(x) = x^(1/2)
	fig = Figure()

	# Normalparabel
	ax1 = Axis(fig[1,1], title = "f(x) = x²")
	xs = 0:0.01:5.0
	ys = f.(xs)
	zs = g.(xs)
	lines!(ax1, xs, ys)

	# Roter Punkt
	scatter!(ax1,
    	lift(x -> [x], bilder[1]),
    	lift(x -> [f(x)], bilder[1]),
    	color = :red,
    	markersize = 12
	)
	
	# Grüner Punkt
	scatter!(ax1,
			lift(x-> [x], bilder[2]),
			lift(x-> [f(x)], bilder[2]),
			color = :green,
			markersize = 12
			)
	#
	#Version 1 mit durchgehenden Linien
	hlines!(ax1,
    	lift(x -> f(x), bilder[1]),
    	color = :gray,
    	linestyle = :dash,
    	linewidth = 2
	)
	
	hlines!(ax1,
		   lift(x-> f(x), bilder[2]),
		   color = :gray,
		   linestyle = :dash,
		   linewidth=2
		   )
	
	vlines!(ax1,
    	lift(x -> x, bilder[1]),
    	color = :gray,
    	linestyle = :dash,
    	linewidth = 2
	)
	
	vlines!(ax1,
		   lift(x-> x, bilder[2]),
		   color = :gray,
		   linestyle = :dash,
		   linewidth=2
		   )
	
	# Wurzelfunktion
	ax2 = Axis(fig[1,2], title = "g(x) = √x")
	lines!(ax2, xs, zs)

	# Roter Punkt
	scatter!(ax2,
    	lift(x -> [x], bilder[1]),
    	lift(x -> [g(x)], bilder[1]),
    	color = :red,
    	markersize = 12
	)

	# Grüner Punkt
	scatter!(ax2,
			lift(x-> [x], bilder[2]),
			lift(x-> [g(x)], bilder[2]),
			color = :green,
			markersize = 12
			)
	
	hlines!(ax2,
    	lift(x -> g(x), bilder[1]),
    	color = :gray,
    	linestyle = :dash,
    	linewidth = 2
	)
	
	hlines!(ax2,
		   lift(x-> g(x), bilder[2]),
		   color = :gray,
		   linestyle = :dash,
		   linewidth=2
		   )
	
	vlines!(ax2,
    	lift(x -> x, bilder[1]),
    	color = :gray,
    	linestyle = :dash,
    	linewidth = 2
	)
	
	vlines!(ax2,
		   lift(x-> x, bilder[2]),
		   color = :gray,
		   linestyle = :dash,
		   linewidth=2
		   )
	fig
	#Makie.current_backend()
end

# ╔═╡ ebdd05b6-9dc4-4097-9489-792889d8485d
md"""
##### Definition: 
Sei $f:A\to B$ eine Abbildung. Dann heißt $f$ 
* *surjektiv*, falls $\forall y\in B, f^{-1}(\{y\}) \subset A$ mindestens ein Element hat.
* *injektiv*, falls $\forall y\in B, f^{-1}(\{y\}) \subset A$ höchstens ein Element hat.
* *bijektiv*. falls $\forall y\in B, f^{-1}(\{y\}) \subset A$ genau ein Element hat.

##### Bemerkung:
* Ist $f$ surjektiv, so gilt $Im(f) = B$.
* Ist $f$ injektiv, so gilt $x_1 \neq x_2 \Rightarrow f(x_1) \neq f(x_2)$.
* Ist $f$ bijektiv, so auch injektiv und surjektiv.
"""

# ╔═╡ 10dff55b-2393-495e-883f-4da451f0318b
md"""
##### Beispiel:

1. Injektiv, aber nicht surjektiv.

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/injektiv.svg","./assets/injektiv.svg"))

2. Surjektiv, aber nicht injektiv.

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/surjektiv.svg","./assets/surjektiv.svg"))

"""

# ╔═╡ c2631f4c-c454-4761-9db7-07d717ae83a3
md"""
##### Definition:
Für $f:X\to Y$ und $g:Y\to Z$ heißt die Abbildung

$h:= g\circ f: X\to Z,\quad x\mapsto h(x)=g(f(x)),$
gesprochen "$g$ Kuller $f$", "$g$ nach $f$" oder "$g$ verknüpft mit $f$", die _Komposition_ oder _Hintereinanderausführung_ oder _Verknüpfung_ von $f$ und $g$.

##### Bemerkung: 
Die Verknüpfung von Funktionen ist assoziativ, also $f\circ(g\circ h) = (f\circ g)\circ h$, aber nicht kommutativ. Es ist also $f\circ g \neq g\circ f$.
"""

# ╔═╡ b50cbab7-83b8-49ec-a3f0-7797be2c536b
md"""
##### Beispiel:
 1. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/3d9496a878c2ecfc8cf2b2301a65098510098c21/notebooks/assets/composition.svg","./assets/composition.svg"))
 2.  $f \circ \mathrm{id} = f$ und $\mathrm{id} \circ f = f$.
 3.  $f(x) = x^2$, $\quad g(y) = 2y$, $\quad g\circ f = 2x^2$, $\quad f\circ g = (2x)^2=4x^2$.
"""

# ╔═╡ e63c1515-e998-436e-9cfb-45c08f9611d7
md"""
##### Definition:
Eine bijektive Funktion $f:X\to Y$ lässt sich umkehren, d.h. es existiert eine Funktion $f^{-1}: Y\to X$ (diese ist auch bijektiv),so dass gilt 
$f\circ f^{-1} = \mathrm{id}_Y$ bzw. $f^{-1} \circ f = \mathrm{id}_X$.

 $f^{-1}$ heißt Umkehrfunktion von $f$.
"""

# ╔═╡ a479be15-4eed-4336-80db-4a90ad81d30f
md"""
##### Beispiel:
$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/bbbd2f9e2d2fe86332b5503998fd3cca904fa2d6/notebooks/assets/pre.svg","./assets/pre.svg"))

Wir werden auf Funktionen zurückkommen, nachdem wir Zahlen eingeführt haben.
"""

# ╔═╡ dd2c5e3d-6717-4397-917a-87b392392090
md"""
## 1.2 Beweistechniken

### 1.2.1 Die natürlichen Zahlen

Die wichtigste Menge der Mathematik ist die Menge der natürlichen Zahlen $\mathbb{N} := \{1, 2, 3, 4, \dots \}$.

##### Bemerkung:
1. Für $\mathbb{N} \cup \{0\}$ schreiben wir $\mathbb{N}_0$.
2. Die natürlichen Zahlen $\mathbb{N}$ lassen sich axiomatisch definieren oder aus den reellen Zahlen herleiten.
3. Für die Mächtigkeit einer Menge A ("Anzahl") schreiben wir $|A|$. Beispielsweise ist $|\emptyset|=0, \; |\{a,b,c\}| = 3$ und $|\mathbb{N}| = \infty$.
4. Das Symbol $\infty$ ist _keine_ natürliche Zahl, sondern eine Mächtigkeit.

Die natürlichen Zahlen erlauben "Beweise durch Induktion".
"""

# ╔═╡ a8e1ce9e-1c93-4177-8471-b5fc88e2d375
md"""
### 1.2.2 Beweis durch Induktion

##### Satz:

Betrachte die Summe $1+2+3+\dots+n = \sum_{k=1}^n k$. Für alle $n\in \mathbb{N}$ gilt $\sum_{k=1}^n = \frac{n(n+1)}{2}.$

##### Beweis (durch Induktion):
_Induktionsverankerung_ (hier $n=1$): 


$\sum_{k=1}^1 k = 1 = \frac{1(1+1)}{2}.$

_Induktionsschritt_ ($n-1$ gegeben, zeige für $n$):

Wir wissen, dass
$\sum_{k=1}^{n-1} k = \frac{(n-1)(n-1+1)}{2} = \frac{(n-1)n}{2}$ gilt.
Dann folgt

$\sum_{k=1}^n k = \sum_{k=1}^{n-1}k+n = \frac{(n-1)n}{2}+n = \frac{n^2-n}{2}+\frac{2n}{2} = \frac{n^2+n}{2} = \frac{n(n+1)}{2}.\quad\square$

Oft ist die Herausforderung die Aufteilung im Induktionsschritt.

Allgemeines Vorgehen bei Beweisen durch Induktion: Zu beweisen ist die Aussage $A(n)$, $\forall n\in \mathbb{N}$ (oder $\forall n \in \mathbb{N}_0$)
1. Induktionsverankerung: Zeige, dass $A(n)$ für ein festes $n$ gilt (oft $n=0$ oder $n=1$).
2. Induktionsvoraussetzung: Es gilt $A(n-1)$ (oder $A(n)$).
3. Induktionsschritt: von $n-1$ zu $n$ bzw. $n$ zu $n+1$, also zeige, dass $A(n-1) \Rightarrow A(n)$ bzw. $A(n) \Rightarrow A(n+1).$
"""

# ╔═╡ 23899e12-4387-41e3-93d7-5ac910ee9174
md"""
### 1.2.3 Direkter Beweis

Beim direkten Beweis wird aus einer Voraussetzung A direkt die Behauptung B "abgeleitet", d.h. $A\Rightarrow B.$

##### Satz:
$\forall n\in \mathbb{N}: \sum_{k=1}^n k = \frac{n(n+1)}{2}.$

##### Beweis (direkt):

Sei $\sum_{k=1}^nk = S_n.$

$\phantom{\Rightarrow} S_n = 1+2+3+\dots+(n-1)+n$
$\Rightarrow S_n = n+(n-1)+(n-2)+\dots+2+1$
$\Rightarrow 2S_n = \underbrace{(n+1)+(n+1)+\dots+(n+1)}_\text{n-mal} = n(n+1)$
$\Rightarrow S_n = \frac{n(n+1)}{2}$

##### Satz:

Die Funktion $f(x) = 2x-1$ hat eine Nullstelle $x_0$ mit $0\leq x_0 \leq 1$.

##### Beweis (direkt):

$f(x_0) = 0 \Leftrightarrow 2x_0-1=0 \Leftrightarrow x_0 = \frac{1}{2}.$

##### Bemerkung:

Die Beweise unterscheiden sich zwischen konstruktiv und nicht konstruktiv.
"""

# ╔═╡ f4034ee5-da52-4b4a-9146-8b45ae6ad0b0
md"""
### 1.2.4 Indirekter Beweis

Manche mathematische Sätze haben die Form $A \Rightarrow B$ (z.B. $x \geq 1 \Rightarrow x^2 \geq 1$). Im indirekten Beweis zeigt man stattdessen $\neg B \Rightarrow \neg A$, also die Umkehrung. (Überprüfen Sie, dass diese Aussagen äquivalent sind!) Etwa beim Beweis durch Widerspruch, d.h. wir nehmen das Gegenteil an und leiten etwas Falsches ab, dann muss auch die Annahme falsch gewesen sein.

##### Satz:

Es gibt unendlich viele Primzahlen

##### Beweis (durch Widerspruch):

Annahme: Es gibt _endlich_ viele Primzahlen (Aussage A), also

*  $A \Rightarrow (p_n$ ist die größte Primzahl$)$ sortiere also $p_1, p_2, \ldots, p_n.$
*  $\Rightarrow q = p_1 \cdot p_2 \dots \cdot p_n + 1$ ist auch eine Primzahl, da Division durch $p_i$ jeweils Rest $1$ ergibt.
*  $\Rightarrow$ es gibt mehr als $n$ Primzahlen $\Rightarrow$ Widerspruch! $\Rightarrow \neg A$ ist wahr$\quad\square$

"""

# ╔═╡ 3dc8fb82-99e0-4402-b549-996c93e46660
md"""
### 1.2.5 Andere Techniken

##### Satz:

Alle Primzahlen $p>2$ haben die Form $p = 4k+1$ oder $p = 4k-1$ mit $k\in \mathbb{N}$.

##### Beweis (durch Fallunterscheidung):

Es gibt vier Fälle für $p \in \mathbb{N}$

 $p=4k \Rightarrow$ teilbar durch $4 \Rightarrow$ keine Primzahl.\
 $p = 4k+1$\
 $p = 4k + 2  = 2(2k+1) \Rightarrow$ teilbar durch $2 \Rightarrow$ keine Primzahl.\
 $p = 4k+3$\
 $\Rightarrow$ entweder $p=4k+1$ oder $p=4k+3=4\tilde{k}-1$ mit $\tilde{k}=k+1$ für eine Primzahl.

##### Satz:

Im rechtwinkligen Dreieck gilt $a^2+b^2=c^2$.

##### Beweis:

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/3d9496a878c2ecfc8cf2b2301a65098510098c21/notebooks/assets/pythagoras.svg","./assets/pythagoras.svg"))

"""

# ╔═╡ bb7fe85a-32d4-485e-8c1b-6000f3e6f8d4
md"""
## 1.3 Algebraische Strukturen
### 1.3.1 Gruppen

##### Definition:

Auf einer Menge $A$ sei eine Verknüpfung "$\circ$", sprich "Kuller" oder "Kringel", definiert, d.h.

$\circ: A\times A \to A,\quad (a,b) \mapsto c = a\circ b \in A$
für die gilt:
1.  $(a\circ b) \circ c = a\circ (b\circ c)\quad$ (Assoziativität) 
2. Es existiert ein neutrales Element $e$ mit $e\circ a = a \circ e = a$
3.  $\forall a \in A$ mit $a\neq e$ gibt es ein $a^{-1}$ mit $a^{-1}\circ a = a \circ a^{-1} = e\quad$ (inverses Element)

Dann heißt $A$ oder $(A, \circ, e)$ eine _Gruppe_.

##### Beispiel:
1.  $A= \{$alle bijektiven Funktionen$\}$, "$\circ$" = Komposition, $e = \mathrm{id}$, $a^{-1} =$ Umkehrfunktion
2.  $\circ = +$, $\quad A = \mathbb{Z}$, $\quad e=0$, $\quad a^{-1}=-a$, "$\quad a-b := a + (-b) = a\circ b^{-1}$
3.  $\circ = \cdot$, $\quad A = \mathbb{Q}:=\{\frac{p}{q}|\,p\in \mathbb{Z},q\in\mathbb{N}\}$, $\quad e=1$, $\quad a^{-1}=\frac{1}{a}$\
    $\mathbb{Q}$ ist Gruppe bzgl. Multiplikation (und auch bezüglich Addition)
"""

# ╔═╡ 5f787cae-c8f7-487a-8a39-e0d81b5c5b42
md"""
##### Bemerkung:
1.  $e$ heißt Nullelement oder Einselement, je nach Kontext.

2. Es gilt im Allgemeinen $(a\circ b)^{-1} = b^{-1}\circ a^{-1}$, denn
   $e = (a\circ b) \circ (a\circ b)^{-1} = (a\circ b)\circ (b^{-1}\circ a^{-1})$
   $= a \circ (b\circ b^{-1})\circ a^{-1} = (a\circ e)\circ a^{-1} = a\circ a^{-1} = e$

3. Gilt außerdem $a\circ b = b\circ a$ heißt die Gruppe "kommutativ"
"""

# ╔═╡ 5355cedb-e4b8-4c31-bb34-7498edcf1b34
md"""
##### Beispiel:
Die symmetrische Gruppe $S_n$. Betrachte alle bijektiven Abbildungen von $M=\{1,2,\dots,n\}$ auf sich selbst, also $\pi: M\to M$. Es gibt $n\,(n-1)\,(n-2)\cdot\ldots,\cdot2\cdot1=n!$ viele solcher Abbildungen. Diese heißen Permutationen der Menge $M$.$S_n$ ist die Gruppe bezüglich der Komposition bzw. Hintereinanderausführung von Permutationen. Wir schreiben $\pi$ als z.B. $(a_2, a_3, a_7, a_5, a_4, a_6,a_1)$.
1. permutieren ist assoziativ
2. neutrales Element ist $(a_1, \dots, a_n) = \mathrm{id}$
3. zu jeder Permutation gibt es die "Rückpermutation"
Im Allgemeinen ist $S_n$ nicht kommutativ!
"""

# ╔═╡ 38c309ca-7b92-4398-abc4-635b3b889c97
md"""
### 1.3.2 Körper
##### Definition:

Auf einer Menge $\mathbb{K}$ seien zwei Verknüpfungen definiert, $+:\mathbb{K}\times\mathbb{K} \to \mathbb{K}$, genannt "Addition" und $\cdot:\mathbb{K}\times\mathbb{K} \to \mathbb{K}$, genannt "Multiplikation", für die gelten:
1.  $\mathbb{K}$ bezüglich $+$ ist eine kommutative Gruppe mit einem Nullelement $0$ und Inversen $x^{-1}=-x\quad(\forall x\in\mathbb{K})$
2.  $\mathbb{K}$ bezüglich $\cdot$ ist eine kommutative Gruppe mit einem Einselement $1\neq 0$ und Inversen $x^{-1}=\frac{1}{x} \quad (\forall x\in \mathbb{K}\setminus\{0\})$
3. Es gilt für $x,y,z \in \mathbb{K}: x\cdot (y+z) = x\cdot y + x\cdot z\quad$ (Distributivgesetz)
Dann heißt $\mathbb{K}$ ein _Körper_.
"""

# ╔═╡ 3aa6c78d-d010-44c3-a5fe-b764b09e16d8
md"""
##### Bemerkung:
1. Es gibt eine ganze Reihe an algebraischen Strukturen mit aufsteigender Komplexität. _Gruppe_, Ring, _Körper_, Modul, _Vektorraum_, Algebren.
2. Aus den sogenannten Gruppenaxiomen lassen sich bekannte Rechenregeln beweisen, z. B:
$x+y=x+z \Rightarrow y = z,$
$x+y=x \Rightarrow y=0,$
$x\,y = x\,z \Rightarrow y=z \quad (x\neq 0),$
$x\,y=x \Rightarrow y=1.$
3. Aus den Körperaxiomen lassen sich weitere Rechenregeln formal und allgemein beweisen, z.B. $0\cdot x = 0,\; (-x)\cdot(-y)=x\cdot y.$

##### Beweis:
Betrachte $0\cdot x + 0\cdot x = (0+0)\cdot x = 0 \cdot x \Rightarrow 0\cdot x = 0$.
"""

# ╔═╡ 3607525d-f005-4977-834f-57ba86e2cd18
md"""
##### Beispiel:
1. Mit gewöhnlichen + und $\cdot$ ist $\mathbb{Q}$ ein Körper.
2. Der "kleinste Körper" $\,\mathbb{F}_2 = \{0,1\}:$

|$+$|$0$|$1$|$\qquad$|$\cdot$|$0$|$1$|
|:-:|:-:|:-:|--------|:----:|:-:|:-:|
|$0$|$0$|$1$|        |  $0$ |$0$|$0$|
|$1$|$1$|$0$|        |  $1$ |$0$|$1$|


3. Betrachte $\mathbb{Z}$ mit Äquivalenzrelation $a\sim b \Leftrightarrow$ gleicher Rest bei Division durch $3$. Äquivalenzklassen:
$\{\dots, -6, -3, 0, 3, 6, \dots\} =: [0]$
$\{\dots, -5, -2, 1, 4, 7, \dots\} =: [1]$
$\{\dots, -4, -1, 2, 5, 8, \dots\} =: [2]$
Die Faktormenge $\{[0],[1],[2]\}$ heißt $\mathbb{Z}/3\mathbb{Z}$, gesprochen  "$\mathbb{Z}$ nach $3\mathbb{Z}$". Betrachte + und $\cdot$ auf $\mathbb{Z}$ bezüglich der Äquivalenzklassen. Dies ist ein Körper mit 3 Elementen, genannt $\mathbb{F}_3$.

| $+$ |$[0]$|$[1]$|$[2]$|$\qquad$|$\cdot$|$[0]$|$[1]$|$[2]$|
|:---:|:---:|:---:|:---:|--------|:-----:|:---:|:---:|:---:|
|$[0]$|$[0]$|$[1]$|$[2]$|        | $[0]$ |$[0]$|$[0]$|$[0]$|
|$[1]$|$[1]$|$[2]$|$[0]$|        | $[1]$ |$[0]$|$[1]$|$[2]$|
|$[2]$|$[2]$|$[0]$|$[1]$|        | $[2]$ |$[0]$|$[2]$|$[1]$|


##### Bemerkung:
Es gibt "endliche" Körper $\mathbb{F}_n$ mit $n=p^q$, wobei $p$ eine Primzahl und $q\in \mathbb{N}$ ist. Diese sind _eindeutig_.
"""

# ╔═╡ 7983d72f-95c4-431e-ba39-6242cd19694e
md"""
## 1.4 Die reellen Zahlen
### 1.4.1 Der Körper $\mathbb{R}$

##### Definition:

Für eine Menge $\mathbb{R}$ seien folgende Bedingungen erfüllt
1. Es gibt zwei Verknüpfungen ($+$ und $\cdot$) und $(\mathbb{R}, +, \cdot, 0, 1)$ ist ein Körper.
2. Es gibt eine Ordnungsrelation $\leq$ auf $\mathbb{R}$ verträglich mit $+$ und $\cdot$, d.h. für $x,y,z\in \mathbb{R}.$
   $x\leq y \Rightarrow x+z\leq y+z.$\
   Für $0\leq x$ und $0 \leq y$ folgt $0 \leq x\cdot y$.
3. Jede nicht leere, nach oben beschränkte Teilmenge $A\subset \mathbb{R}$ besitzt eine kleinste obere Schranke $s\in \mathbb{R}.$
Dann heißt $\mathbb{R}$ _reeller Zahlenkörper_ und die Elemente sind _reelle Zahlen_. Wir schreiben $x\in \mathbb{R}.$
"""

# ╔═╡ 5f2088e9-5bf4-41fc-be01-a822e67dc7d5
md"""
##### Bemerkung:
+ in der Definition heißen 2. Anordnungsaxiome und 3. das Vollständigkeitsaxiom. Später mehr dazu.
+ Durch diese Axiome ist $\mathbb{R}$ in gewisser Hinsicht eindeutig definiert.
+ Wegen der Anordnung können wir uns $\mathbb{R}$ als orientierte Zahlengerade vorstellen.
+ Aus "$\leq$" leiten wir die Relationen "$<$", "$>$", "$\geq$" ab.
+ Wir definieren offene und abgeschlossene Intervalle mit\
  $[a,b] := \{x\in\mathbb{R}|\; a\leq x\leq b\}\qquad (a,b) := \{x\in\mathbb{R}|\; a<x<b\}.$

##### Definition:
Für $x\in\mathbb{R}$ sei der (Absolut-)Betrag definiert durch
$|x| := \begin{cases}x&x\geq0\\ -x&x<0\end{cases}$
"""

# ╔═╡ abbe0e9b-d62e-4912-89c3-e5dace1e8d66
md"""
##### Lemma:
Für $x,y\in \mathbb{R}$ gilt
1.  $|x+y| \leq |x| + |y| \quad$ "Dreiecksungleichung",
2.  $\big|\,|x|-|y|\,\big|\leq |x-y|\quad$ "Umgekehrte Dreiecksungleichung".

##### Beweis:
Zu 1: Da beide Seiten positiv sind, ist quadrieren erlaubt. Es folgt also 

$\begin{align*} |x+y|\leq |x|+|y| &\Leftrightarrow |x+y|^2 \leq (|x|+|y|)^2 \\[2pt]
&\Leftrightarrow x^2+2xy+y^2 \leq x^2+2|x||y|+y^2 \\[2pt]
&\Leftrightarrow xy\leq |xy|. \end{align*}$
Es gilt $a\leq |a|, \forall a\in \mathbb{R}$.
"""

# ╔═╡ c9a90542-e1e3-4788-9185-a61f6c0e6941
md"""
### 1.4.2 Das Vollständigkeitsaxiom

Diese Bedingung löst ein Problem der rationalen Zahlen, nämlich:

#### Satz:
Es existiert keine Zahl $a\in \mathbb{Q}$ mit $a^2=2$.

##### Beweis:

Annahme $a=\frac{p}{q}$ mit $p,q$ teilerfremd, d.h. $p$ oder $q$ ungerade$\qquad(\ast)$

$\ast\Rightarrow \frac{p^2}{q^2}=2 \Rightarrow p^2 = 2q^2 \Rightarrow p \text{ gerade.}$
Sei dann $r=\frac{p}{2}$

$\Rightarrow (2r)^2 = 2q^2 \Rightarrow 2r^2=q^2 \Rightarrow q \text{ gerade},$
was im Widerspruch zur Annahme ist.
"""

# ╔═╡ 24e9b80e-0bc5-488d-bbb6-9b46bcfb5d4c
md"""
##### Definition:

Eine Teilmenge $A\subset\mathbb{R}$ heißt von oben _beschränkt_, falls ein $b\in\mathbb{R}$ existiert mit $a\leq b \quad \forall a\in A$. 

Dabei heißt $b$ obere Schranke.

Desweiteren heißt $s$ "kleinste obere Schranke" oder _Supremum_ für $A$, falls $s$ eine obere Schranke ist und für jede obere Schranke $b$ von $A$ gilt $s\leq b$.

##### Bemerkung:
1. Eine analoge Definition gibt es für nach unten beschränkt und (größte) untere Schranke, welche wir _Infimum_ nennen.
2. $\sup A := \min\{b\in\mathbb{R}\mid a\leq b\quad \forall a\in A\}$
   $\inf A := \max\{b\in\mathbb{R}\mid a\geq b\quad \forall a \in A\}.$
3. Falls $\sup A\in A$, dann ist das Supremum das _Maximum_ von $A$. Analog gilt, falls $\inf A\in A$, dass das Infimum das _Minimum_ ist.
4. Für $A=\{a\in \mathbb{R}|\, a^2<2\}$ existiert ein Supremum und es ist $\sup A = \sqrt{2}.$
"""

# ╔═╡ 000cfdf7-7b24-41fc-82cc-d2fe5b47457c
md"""
##### Hilfssatz (Archimedische Eigenschaft):
1. $\forall x\in \mathbb{R}\quad\exists n \in \mathbb{N}:\quad n>x$
2. $\forall y\in \mathbb{R} y>0\quad\exists n\in \mathbb{N}:\quad \frac{1}{n}<y.$

##### Beweis:
Aussage 2. ist die Aussage 1. mit $y=\frac{1}{x}: \, n>\frac{1}{y} \Leftrightarrow \frac{1}{n}<y.$

Zu 1. (durch Widerspruch): 

Anname: Sei $\mathbb{N}\subseteq \mathbb{R}$ beschränkt und $\alpha\in\mathbb{R}$ das Supremum, das heißt $\forall n \in \mathbb{N}: n\leq \alpha$

$\begin{align*}&\Rightarrow \alpha-1 \text{ ist kein Supremum von } \mathbb{N}\\[2pt]
&\Rightarrow \exists n \in \mathbb{N}:\quad \alpha-1 < n\\[2pt]
&\Rightarrow \alpha < n+1 =: n'\in \mathbb{N},\end{align*}$
was im Widerspruch zur Annahme ist.
"""

# ╔═╡ 4e4649cb-1ba5-4cda-833e-8451b00e7cc1
md"""
##### Beweis der Dichtheit:

Zur Einfachheit gelte $0\leq a < b$. Wir benutzen den Hilfssatz, zu zeigen ist: $\forall a,b\in\mathbb{R}\quad a<\frac{m}{n} < b$ mit $m,n\in\mathbb{N}$

1.  $0 < b-a\in\mathbb{R}$. Wähle $n\in \mathbb{N}$ mit $\frac{1}{n}< b-a \qquad(a < b-\frac1n).$
2. Es ist $n\, a\in\mathbb{R}$. Wähle $m\in\mathbb{N}$ mit $m>n\,a$ und $m$ klein genug, so dass $m-1\leq n\,a$.
Damit folgt $a<\frac{m}{n}$ und $m\leq n\,a+1<n(b-\frac{1}{n})+1 = n\,b$, also $\frac{m}{n}<b.$

##### Bemerkung:

1. Die "Dichtheit" bedeutet, wir können reelle Zahlen beliebig gut durch rationale Zahlen approximieren, also $\forall \varepsilon > 0 \, \exists r\in \mathbb{Q}:\, x<r<x+\varepsilon\quad$ für $x\in\mathbb{R}.$
2. Man kann ähnlich beweisen, dass $\sup\{a\in\mathbb{R}|\,a^2<2\}=\sqrt{2}$ gilt.
3. Das Vollständigkeitsaxiom wird später (durch sogenannte "Folgen") mehr Sinn bekommen.
"""

# ╔═╡ de9e344c-d86c-4934-83bf-eef48c3b0f55
md"""
### 1.4.3 Abzählbarkeit

Wie viele Elemente entählt die Menge $\mathbb{R}$? Erinnere: Für eine Menge $A$ war $|A|$ die _Mächtigkeit_ (z.B. $|\{a,b,c\}| = 3), \,|\mathbb{N}|=\infty.$

##### Definition:
1. Zwei Mengen $A,B$ heißen _gleichmächtig_, falls es eine bijektive Abbildung $f:A\to B$ gibt.
2. Eine Menge $A$ heißt _abzählbar unendlich_, falls sie zu $\mathbb{N}$ gleichmächtig ist, also eine bijektive Funktion $f:A\to\mathbb{N}$ existiert.
"""

# ╔═╡ d318c5e9-75c9-434f-be6d-fefa9336a895
md"""
##### Satz:
Sowohl $\mathbb{Z}$ als auch $\mathbb{Q}$ sind abzählbar unendlich.

Zu $\mathbb{Z}$:

$\begin{align*}\mathbb{N} &= \{1,2,\phantom{-}3,4,\phantom{-}5,6,\phantom{-}7,\dots\} \\[2pt]
&\phantom{- \{\;}\updownarrow\;\,\updownarrow\phantom{-}\!\updownarrow\;\,\updownarrow\phantom{-}\updownarrow\;\,\updownarrow\phantom{-}\!\updownarrow\\[2pt]
\mathbb{Z} &= \{0,1,-1,2,-2,3,-3,\dots\}\end{align*}$

Zu $\mathbb{Q}$: Betrachte $a\in\mathbb{Q}:\, a=\frac{p}{q}>0\quad p,q\in\mathbb{N}$

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/diagonal.svg","./assets/diagonal.svg"))
"""

# ╔═╡ ef121ae4-fa18-4938-8596-be29164ece6c
md"""
##### Satz:
 $\mathbb{R}$ ist nicht abzählbar unendlich.

##### Beweis (Diagonalverfahren nach Cantor):
Wir zeigen das offene Intervall $(0,1)$ ist nicht abzählbar unendlich per Widerspruch. Annahme: Es gibt eine Liste $\mathbb{N}\to(0,1)$, z.B. (in Dezimaldarstellung)

$\begin{align*} 1&\to 0,a_{11}a_{12}a_{13}\ldots\\[2pt]
2&\to 0,a_{21}a_{22}a_{23}\ldots\\[2pt]
3&\to 0,a_{31}a_{32}a_{33}\ldots\\[2pt]
&\;\;\vdots \\[2pt]
a_{ij}&\in\{0,1,2,3,4,5,6,7,8,9\}\end{align*}$

Wir konstruieren daraus eine neue Zahl $z\in (0,1)$, nämlich $z=0,c_1c_2c_3\cdots$ mit $c_j=(a_{jj}+1)$ mod 10. Offenbar ist $z$ nicht in der Liste.

##### Bemerkung:
1.  $\mathbb{R}$ heißt _überabzählbar_. Es enthält also "mehr" Elemente als $\mathbb{N}$ (und $\mathbb{Q}$).
2.  $|\mathbb{N}|= \aleph_0 = \infty\quad$ ("aleph-$0$")$\qquad$"Kardinalzahlen": $\infty$, $\aleph_1$, $\aleph_2$, $\ldots$
3. Die Mengen $\mathbb{R}, \mathbb{R}^2, \mathbb{R}^n (n\in\mathbb{N})$ sind alle gleichmächtig.
4. Die Menge $A=\{f\mid\, f:[0,1]\to[0,1]\}$ hat eine gößere Mächtigkeit als $\mathbb{R}$ (nämlich $\aleph_2$).

"""

# ╔═╡ 436b09f8-aaa7-4b4a-8989-1b2da9ddf6d9
md"""
## 1.5 Komplexe Zahlen
### 1.5.1 Der Körper $\mathbb{C}$
Problem von $\mathbb{R}$: Die Gleichung $x^2=-1$ hat keine Lösung!

##### Satz und Definition:

Für die Menge $\mathbb{R}^2=\mathbb{R}\times\mathbb{R}$ definieren wir die Verknüpfungen:

$\begin{align*}
+:\mathbb{R}^2\times\mathbb{R}^2 \to \mathbb{R}^2,& \quad (a,b) + (c,d) := (a+c, b+d) 
\\[2pt]
\cdot:\mathbb{R}^2\times\mathbb{R}^2\to\mathbb{R}^2,& \quad (a,b)\cdot(c,d) := (ac-bd, ad+bc)
\end{align*}$

Damit wird $\mathbb{R}^2$ zum Körper mit Nullelement $(0,0)$, Einselement $(1,0)$ und additivem Inversen $(-a,-b)$, sowie multiplikativem Inversen $(\frac{a}{a^2+b^2},\frac{-b}{a^2+b^2})$ für $(a,b)\neq(0,0)$.

##### Beweis:

Lässt sich leicht durch Nachrechnen zeigen.
"""

# ╔═╡ 6341adcf-fd11-4d3c-8aad-0be897a85b1c
md"""
##### Bemerkung:
1. Dieser Körper heißt $\mathbb{C}$, die _komplexen Zahlen_.
2. Die reellen Zahlen werden "eingebettet", d.h. $a\in\mathbb{R}\to \tilde{a} \,\mathrel{\widehat{=}}\, (a,0) \in \mathbb{C}.$
3. Betrachte $x^2 = -1$ in $\mathbb{C}$, d.h.
$\begin{align*} (a,b)\cdot(a,b) &= (-1,0) \\[2pt] \Leftrightarrow (a^2-b^2,ab+ba) &=(-1,0)\\[2pt]
\Leftrightarrow a^2-b^2 &= -1 \;\mathrel{\land}\; 2\,a\,b = 0 \\[2pt]
\Leftrightarrow (a,b) &= (0,1). \end{align*}$
4. Die Lösung $(0,1) =: i$ heißt imaginare Einheit und es gilt $i^2 = -1$. Die imaginäre Einheit wird in der Elektrotechnik und Physik auch gerne als "$j$" geschrieben. 

##### Definition:
Wir schreiben $z\in\mathbb{C}$ als Summe von Realteil und Imaginärteil $z = a+bi$, sowie $\mathrm{Re}(z) = a$ und $\mathrm{Im}(z)=b$.
"""

# ╔═╡ 108153fe-ffcf-4506-854c-a0da70b3f93a
md"""
##### Bemerkung:

1. Die Summation von $a+b\,i$ ist _formal_.
2. Wir können "normal" rechnen, wobei $i^2 = -1$ bzw. $\sqrt{-1} = \pm i$ gilt

$\begin{align*}
(a+b\,i) + (c+d\,i) &= (a+b) + (c+d)\,i\\[2pt]
(a+b\,i)\cdot(c+d\,i) &= a\,c + a\,d\,i + b\,c\,i + b\,d\,i^2\\[2pt] 
&= (a\,c-b\,d) + (a\,d+b\,c)\,i.
\end{align*}$

##### Beispiel:
1.  $z_1 = 1+2\,i, \quad z_2 = -2-i$

   $\begin{align*} z_1+z_2 &= -1+i \\[2pt] z_1\cdot z_2 &= (1+2\,i)\,(-2-i) \\[2pt] &= (-2 -i - 4\,i + 2)\\[2pt] &= -5\,i.\end{align*}$
2. Bestimmen der Nullstellen von $x^2 - 2\,x + 5$:

   $\begin{align*}  x_{1,2} &= -\frac p2 \pm \sqrt{\frac{p^2}4 - q} \\[2pt] & -1 \pm \sqrt{1 - 5} \\[2pt] &= -1 \pm \sqrt{-4} \\[2pt] &= -1 \pm 2\,i. \end{align*}$
3.  $\begin{align*} \frac1i = \frac1i\frac ii = \frac i{-1} = -i\end{align*}$
"""

# ╔═╡ 351810ad-b87f-4e4f-a8e7-fb68a4541e95
md"""
##### Definition:
1. Für $z\in \mathbb{C}$ mit $z=a+b\,i$ ist durch $\overline{z}=a-b\,i$ die _komplex-konjugierte Zahl_ definiert. Es gilt $z\cdot \overline{z} = a^2+b^2.$
2. Für $z\in\mathbb{C}$ ist der Betrag definiert durch $|z|:= \sqrt{z\overline{z}} = \sqrt{a^2+b^2}$

##### Bemerkung:
1. Es gilt die Dreieckungsleichung $|z+w| \leq |z|+|w|.$
2.  $\mathrm{Re}(z) = \frac{1}{2}(z+\overline{z}),\quad \mathrm{Im}(z)=\frac{1}{2i}(z-\overline{z}).$
3.  $\overline{z}$ ist fast die Inverse von $z$. Es gilt für $z=a+bi$, dass $z^{-1}=\frac{1}{|z|^2}\overline{z}$ ist.

##### Beispiel:
$z = 1+2\,i \Rightarrow \overline{z} = 1-2\,i\Rightarrow z\cdot \overline{z}=5,\quad |z| = \sqrt{5}$
und

$z^{-1} = \frac{1}{1+2\,i} = \frac{1}{1+2\,i}\frac{1-2\,i}{1-2\,i}=\frac{1-2\,i}{5}=\frac{\overline{z}}{|z|^2}.$
"""

# ╔═╡ 0a2e8988-9669-48c3-8825-5ae8f7969ca0
md"""
### 1.5.2 Gaußsche Zahlenebene

##### Definition:
Jede komplexe Zahl $z=a+bi\in\mathbb{C}$ lässt sich als Punkt in der _komplexen_ oder _Gaußschen Zahlebene_ darstellen. 


$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/complex_axis.svg","./assets/complex_axis.svg"))



"""

# ╔═╡ 90c103a6-2ad1-485e-9b48-4da1435ee4a4
md"""

Dies erlaubt eine geometrische Interpretation von $\overline{z},|z|, z+w, z\cdot w$, etc.

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/complex_norm.svg","./assets/complex_norm.svg"))

"""

# ╔═╡ e72ee126-9933-4655-9587-9f60d2efad96
md"""

Für die Multiplikation benötigen wir Polarkooridnaten:

 $z=a+bi = r\cos(\varphi) + r\sin(\varphi)i\,$ 

mit $r = |z| = a^2+b^2$ und $\tan(\varphi) = \frac{\sin(\varphi)}{\cos(\varphi)}=\frac{b}{a}.$

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/complex_multiplication.svg","./assets/complex_multiplication.svg"))


"""

# ╔═╡ 08a817ac-1c50-4a70-aca5-c89e343670f0
md"""
##### Beispiel:
1. $\varphi = \frac{\pi}{3} (60^\circ),\quad r=2$
$\begin{align*}
\Rightarrow  z &= r\cos(\varphi)+r\sin(\varphi)i\\
&= 2\cos\left(\frac{\pi}{3}\right) + 2\sin\left(\frac{\pi}{3}\right)i \\
&= 1 + \sqrt{3}i. \end{align*}$
2. Betrachte $\,\,z_1 = r_1(cos(\varphi_1)+\sin(\varphi_1)i),\quad z_2 = r_2(\cos(\varphi_2)+\sin(\varphi_2)i)$
   $\begin{align*}
    z_1\cdot z_2 &= r_1r_2(\cos(\varphi_1)+\sin(\varphi_1)i)(\cos(\varphi_2)+\sin(\varphi_2)i)\\[2pt]
   &=r_1r_2\big[\cos(\varphi_1)\cos(\varphi_2)-\sin(\varphi_1)\sin(\varphi_2)+\\[1pt]
   &\phantom{=r_1r_2\big[} \bigl(\cos(\varphi_1)\sin(\varphi_2)+\sin(\varphi_1)\cos(\varphi_2)\bigr)i\big]\\[2pt]
   &=r_1r_2\big[\cos(\varphi_1+\varphi_2)+\sin(\varphi_1+\varphi_2)i\big].\end{align*}$

Die Winkel addieren sich also bei Multiplikation. Die Radien werden multiplizeiert.

Insbesondere gilt $\bigl(\cos(\varphi)+\sin(\varphi)i\bigr)^2 = \cos(2\varphi) + \sin(2\varphi)i.$

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/multiplication_examples.svg","./assets/multiplication_examples.svg"))
"""

# ╔═╡ a697d9c3-f7b7-4d0c-b18e-697f1cabcb87
md"""
##### Satz:

Für $z\in\mathbb{C}$ mit $z=r(\cos(\varphi)+\sin(\varphi)i)$ gilt für $n\in\mathbb{N}$\
$z^n = r^n(\cos(n\varphi)+\sin(n\varphi)i).\quad$ (Formel von Moivre)

##### Beweis:
Geht durch eine einfache Induktion.
"""

# ╔═╡ 6fa14111-4b1c-44e1-a6f9-d4f6ce842340
md"""
## 1.6 Polynome

##### Definition: 

Für $n\in\mathbb{N}_0$ und $a_0,a_1,\dots,a_n\in\mathbb{R}$ ist 
$p:\mathbb{C}\to\mathbb{C}, x\mapsto p(x) = \sum_{i=0}^n a_ixî = a_0+a_1x+a_2x^2+\cdots + a_nx^n$
ein _Polynom_,  wobei $n$, für $a_n \neq 0$, Grad des Polynoms heißt. Ein $x_0 \in \mathbb{C}$ mit $p(x_0)=0$ heißt Nullstelle..

##### Bemerkung:
1. Falls $a_0,\dots,a_n\in\mathbb{C}$ ist es ein _komplexes_ Polynom.
2. Für $n=1,\, p(x) = a_0+a_1x$ gibt es ($a_1\neq 0)$ eine Nullstelle. Für $n=2, p(x) = a_0+a_1x+a_2x^2$ gibt es _immer_ (mit $\sqrt{-1}=1$) zwei Nullstellen mit Lösungsformel aus der Schule.
3. Für $n=3,4$ gibt es kompliziertere Nullstellen-Formeln, für $n\geq5$ nicht mehr.


"""

# ╔═╡ dd272752-4512-4d59-a65c-4d2fbe976823
md"""
##### Satz:
Sei $p$ ein Polynom von Grad $n$ und $k$ Nullstellen $x_1,\dots, x_k,\, k\leq n)$ seien bekannt. Dann kann $p$ als Produkt mit "Linearfaktoren"

$p(x) = (x-x_1)\cdot(x-x_2)\cdot\dots\cdot(x-x_k)q(x)$

geschrieben werden, wobei $q$ ein Polynom mit Grad $n-k$ ist.

##### Beweis:
Der Beweis ist als Übungsaufgabe vorgesehen.
"""

# ╔═╡ d6bb0cba-7fa3-4f2b-917b-1d59b922df94
md"""
##### Beispiel:

1. \
   $\begin{align*} p(x) &= 2x^2-x-6\quad\quad \Bigl[\text{ NST } x_1=2,\,x_2=-\frac{3}{2}\Bigr]\\&= 2(x-2)\left(x+\frac{3}{2}\right)\end{align*}$
2. \
   $\begin{align*} p(x) &= x^2+2x+1\quad\quad \Bigl[\text{ NST (doppelt) } x_1 = -1\Bigr]\\ &= (x+1)(x+1) \end{align*}$
3. \
   $\begin{align*} p(x) &= x^2+2 \quad\quad \Bigl[\text{ NST } x_{1,2}=\pm i\sqrt{2}\Bigr]\\&= (x-i\sqrt{2})(x+i\sqrt{2})\end{align*}$
4. \
   $\begin{align*}p(x) &= 2x^3-5x^2+12x-5\quad\quad\Bigl[\text{ NST } x_1=\frac{1}{2}\Bigr]\\&= 2(\underbrace{x^2-2x+5}_{\text{ NST } x_{2,3} = 1\pm 2i})\left(x-\frac{1}{2}\right)\\&=2(x-(1+2i))(x-1-2i))\left(x-\frac{1}{2}\right).\end{align*}$

##### Satz (Fundamentallemma der Algebra, Gauss 1799)
Jedes Polynom $n$-ten Grades mit $n\geq1$ hat genau $n$ (eventuell mehrfache) Nullstellen in $\mathbb{C}$.

##### Beweis:
Nicht so schwierig, aber benötigt Werkzeug, das wir nicht haben.

##### Bemerkung:
Sind alle Koeffizienten eines Polynoms reell, tritt mit jeder echt komplexen Nullstelle $z$ auch $\overline{z}$ auf.
"""

# ╔═╡ 10a9e7eb-5e63-4ddc-921f-8805eb6c1039
md"""
##### Satz:
Stimmen zwei Polynome $p(x) = \sum_{i=0}^na_ix^i$ und $q(x)=\sum_{i=0}^nb_ix^i$ an $n+1$ Stellen überein, dann sind sie gleich.

##### Beweis:
Das Polynom $p(x)-q(x) = \sum_{i=0}^n(a_i-b_i)x^i$ hat $n+1$ Nullstellen.

 $\Rightarrow p-q=0$, d.h. verschwindende Koeffizienten 
 
 $\Rightarrow a_i=b_i\quad i=0,1,\dots,n.$
"""

# ╔═╡ 68fa1853-dfeb-4516-8807-c1508575cd4e
md"""
##### Satz und Definition:

Das Polynom $p(z) = z^n-1$ für $n\geq 1$ hat genau $n$ Nullstellen $z_k,\, k=0,\dots, n-1$ mit $|z_k|=1$ und $z_k = \cos(k\frac{2\pi}{n})+\sin(k\frac{2\pi}{n})i$, d.h. die $z_k$ liegen auf dem Einheitskreis als regelmäßiges n-Eck mit einer Ecke auf $(1,0)$. Die $z_k$ heißen _n-te Einheitswurzeln_.

##### Beweis: 

Ansatz $z=r(\cos(\varphi)+\sin(\varphi)i)$

$z^n = \underbrace{r^n\cos(n\varphi)}_{\overset{!}{=}1}+\underbrace{r^n\sin(n\varphi)}_{\overset{!}{=}0}i \overset{!}{=} 1+0i.$

Mit $r\neq 0$ folgt $n\varphi=0,\pi,2\pi,3\pi,\dots\Rightarrow \varphi = 0,\frac{\pi}{n},2\frac{\pi}{n},3\frac{\pi}{n},\dots$

Mit $r^n\cos(n\varphi)=1$ folgt $r=1$ und $\varphi = 0,\frac{2\pi}{n},2\frac{2\pi}{n},\dots,(n-1)\frac{2\pi}{n}$.

Für jedes dieser $z_k$ gilt $z_k^7=1$.

$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/b2d207966fe5442b7c03359efb051c548514271d/notebooks/assets/einheitswurzeln.svg","./assets/einheitswurzeln.svg"))
"""

# ╔═╡ baad704c-5109-4743-b253-cf2d5efb6263
md"""
##### Bemerkung:
Für den allgemeinen Fall $z^n = w = r(\cos(\alpha)+\sin(\alpha)i)$ gilt

$z_k = \sqrt[n]{r}\Bigl(\cos\left(\frac{\alpha}{n}+k\frac{2\pi}{n}\right)+\sin\left(\frac{\alpha}{n}+k\frac{2\pi}{n}\right)i\Bigr).$

##### Beispiel:

Sei $z^2 = i.\,$ Ansatz: Vermute $r=1$ und $z=\cos(\varphi)+\sin(\varphi)i \Rightarrow i = \cos\left(\frac{\pi}{2}\right)+\sin\left(\frac{\pi}{2}\right)i.$

$\begin{align*}z_0 &= \cos\left(\frac{1}{2}\frac{\pi}{2}\right)+\sin\left(\frac{\pi}{4}\right)i\\ &= \frac{1}{\sqrt{2}}+\frac{1}{\sqrt{2}}i, \\z_1&=\cos\left(\frac{\pi}{4}+\pi\right)+\sin\left(\frac{\pi}{2}+\pi\right)i\\&=-\frac{1}{\sqrt{2}}-\frac{1}{\sqrt{2}}i.\end{align*}$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
GLMakie = "e9467ef8-e4e7-5192-8a1a-b1aee30e663a"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Makie = "ee78f7c6-11fb-53f2-987a-cfe4a2b5a57a"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
GLMakie = "~0.13.6"
Makie = "~0.24.6"
PlutoTeachingTools = "~0.4.6"
PlutoUI = "~0.7.71"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.7"
manifest_format = "2.0"
project_hash = "17aa3a166cf5591b0610497f3964757c5f17560c"

[[deps.AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "d92ad398961a3ed262d8bf04a1a2b8340f915fef"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.5.0"
weakdeps = ["ChainRulesCore", "Test"]

    [deps.AbstractFFTs.extensions]
    AbstractFFTsChainRulesCoreExt = "ChainRulesCore"
    AbstractFFTsTestExt = "Test"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.AbstractTrees]]
git-tree-sha1 = "2d9c9a55f9c93e8887ad391fbae72f8ef55e1177"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.4.5"

[[deps.Adapt]]
deps = ["LinearAlgebra", "Requires"]
git-tree-sha1 = "7e35fca2bdfba44d797c53dfe63a51fabf39bfc0"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "4.4.0"
weakdeps = ["SparseArrays", "StaticArrays"]

    [deps.Adapt.extensions]
    AdaptSparseArraysExt = "SparseArrays"
    AdaptStaticArraysExt = "StaticArrays"

[[deps.AdaptivePredicates]]
git-tree-sha1 = "7e651ea8d262d2d74ce75fdf47c4d63c07dba7a6"
uuid = "35492f91-a3bd-45ad-95db-fcad7dcfedb7"
version = "1.2.0"

[[deps.AliasTables]]
deps = ["PtrArrays", "Random"]
git-tree-sha1 = "9876e1e164b144ca45e9e3198d0b689cadfed9ff"
uuid = "66dad0bd-aa9a-41b7-9441-69ab47430ed8"
version = "1.1.3"

[[deps.Animations]]
deps = ["Colors"]
git-tree-sha1 = "e092fa223bf66a3c41f9c022bd074d916dc303e7"
uuid = "27a7e980-b3e6-11e9-2bcd-0b925532e340"
version = "0.4.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Automa]]
deps = ["PrecompileTools", "SIMD", "TranscodingStreams"]
git-tree-sha1 = "a8f503e8e1a5f583fbef15a8440c8c7e32185df2"
uuid = "67c07d97-cdcb-5c2c-af73-a7f9c32a568b"
version = "1.1.0"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "01b8ccb13d68535d73d2b0c23e39bd23155fb712"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.1.0"

[[deps.AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "4126b08903b777c88edf1754288144a0492c05ad"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.8"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.BaseDirs]]
git-tree-sha1 = "bca794632b8a9bbe159d56bf9e31c422671b35e0"
uuid = "18cc8868-cbac-4acf-b575-c8ff214dc66f"
version = "1.3.2"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1b96ea4a01afe0ea4090c5c8039690672dd13f2e"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.9+0"

[[deps.CEnum]]
git-tree-sha1 = "389ad5c84de1ae7cf0e28e381131c98ea87d54fc"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.5.0"

[[deps.CRC32c]]
uuid = "8bf52ea8-c179-5cab-976a-9e18b702a9bc"
version = "1.11.0"

[[deps.CRlibm]]
deps = ["CRlibm_jll"]
git-tree-sha1 = "66188d9d103b92b6cd705214242e27f5737a1e5e"
uuid = "96374032-68de-5a5b-8d9e-752f78720389"
version = "1.0.2"

[[deps.CRlibm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e329286945d0cfc04456972ea732551869af1cfc"
uuid = "4e9b3aee-d8a1-5a3d-ad8b-7d824db253f0"
version = "1.0.1+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "fde3bf89aead2e723284a8ff9cdf5b551ed700e8"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.18.5+0"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra"]
git-tree-sha1 = "e4c6a16e77171a5f5e25e9646617ab1c276c5607"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.26.0"
weakdeps = ["SparseArrays"]

    [deps.ChainRulesCore.extensions]
    ChainRulesCoreSparseArraysExt = "SparseArrays"

[[deps.ColorBrewer]]
deps = ["Colors", "JSON"]
git-tree-sha1 = "e771a63cc8b539eca78c85b0cabd9233d6c8f06f"
uuid = "a2cac450-b92f-5266-8821-25eda20663c8"
version = "0.4.1"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "PrecompileTools", "Random"]
git-tree-sha1 = "b0fd3f56fa442f81e0a47815c92245acfaaa4e34"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.31.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "67e11ee83a43eb71ddc950302c53bf33f0690dfe"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.1"
weakdeps = ["StyledStrings"]

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "Requires", "Statistics", "TensorCore"]
git-tree-sha1 = "8b3b6f87ce8f65a2b4f857528fd8d70086cd72b1"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.11.0"
weakdeps = ["SpecialFunctions"]

    [deps.ColorVectorSpace.extensions]
    SpecialFunctionsExt = "SpecialFunctions"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "37ea44092930b1811e666c3bc38065d7d87fcc74"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.13.1"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "9d8a54ce4b17aa5bdce0ea5c34bc5e7c340d16ad"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.18.1"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.ComputePipeline]]
deps = ["Observables", "Preferences"]
git-tree-sha1 = "cb1299fee09da21e65ec88c1ff3a259f8d0b5802"
uuid = "95dc2771-c249-4cd0-9c9f-1f3b4330693c"
version = "0.1.4"

[[deps.ConstructionBase]]
git-tree-sha1 = "b4b092499347b18a015186eae3042f72267106cb"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.6.0"
weakdeps = ["IntervalSets", "LinearAlgebra", "StaticArrays"]

    [deps.ConstructionBase.extensions]
    ConstructionBaseIntervalSetsExt = "IntervalSets"
    ConstructionBaseLinearAlgebraExt = "LinearAlgebra"
    ConstructionBaseStaticArraysExt = "StaticArrays"

[[deps.Contour]]
git-tree-sha1 = "439e35b0b36e2e5881738abc8857bd92ad6ff9a8"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.3"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataStructures]]
deps = ["OrderedCollections"]
git-tree-sha1 = "6c72198e6a101cccdd4c9731d3985e904ba26037"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.19.1"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Dbus_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "473e9afc9cf30814eb67ffa5f2db7df82c3ad9fd"
uuid = "ee1fde0b-3d02-5ea6-8484-8dfef6360eab"
version = "1.16.2+0"

[[deps.DelaunayTriangulation]]
deps = ["AdaptivePredicates", "EnumX", "ExactPredicates", "Random"]
git-tree-sha1 = "5620ff4ee0084a6ab7097a27ba0c19290200b037"
uuid = "927a84f5-c5f4-47a5-9785-b46e178433df"
version = "1.6.4"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"
version = "1.11.0"

[[deps.Distributions]]
deps = ["AliasTables", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SpecialFunctions", "Statistics", "StatsAPI", "StatsBase", "StatsFuns"]
git-tree-sha1 = "3bc002af51045ca3b47d2e1787d6ce02e68b943a"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.122"

    [deps.Distributions.extensions]
    DistributionsChainRulesCoreExt = "ChainRulesCore"
    DistributionsDensityInterfaceExt = "DensityInterface"
    DistributionsTestExt = "Test"

    [deps.Distributions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    DensityInterface = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
    Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.DocStringExtensions]]
git-tree-sha1 = "7442a5dfe1ebb773c29cc2962a8980f47221d76c"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.5"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e3290f2d49e661fbd94046d7e3726ffcb2d41053"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.4+0"

[[deps.EnumX]]
git-tree-sha1 = "bddad79635af6aec424f53ed8aad5d7555dc6f00"
uuid = "4e289a0a-7415-4d19-859d-a7e5c4648b56"
version = "1.0.5"

[[deps.EpollShim_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a4be429317c42cfae6a7fc03c31bad1970c310d"
uuid = "2702e6a9-849d-5ed8-8c21-79e8b8f9ee43"
version = "0.0.20230411+1"

[[deps.ExactPredicates]]
deps = ["IntervalArithmetic", "Random", "StaticArrays"]
git-tree-sha1 = "83231673ea4d3d6008ac74dc5079e77ab2209d8f"
uuid = "429591f6-91af-11e9-00e2-59fbe8cec110"
version = "2.2.9"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7bb1361afdb33c7f2b085aa49ea8fe1b0fb14e58"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.7.1+0"

[[deps.Extents]]
git-tree-sha1 = "b309b36a9e02fe7be71270dd8c0fd873625332b4"
uuid = "411431e0-e8b7-467b-b5e0-f676ba4f2910"
version = "0.1.6"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "eaa040768ea663ca695d442be1bc97edfe6824f2"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "6.1.3+0"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "Libdl", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "97f08406df914023af55ade2f843c39e99c5d969"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.10.0"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6d6219a004b8cf1e0b4dbe27a2860b8e04eba0be"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.11+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "d60eb76f37d7e5a40cc2e7c36974d864b82dc802"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.17.1"

    [deps.FileIO.extensions]
    HTTPExt = "HTTP"

    [deps.FileIO.weakdeps]
    HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"

[[deps.FilePaths]]
deps = ["FilePathsBase", "MacroTools", "Reexport", "Requires"]
git-tree-sha1 = "919d9412dbf53a2e6fe74af62a73ceed0bce0629"
uuid = "8fc22ac5-c921-52a6-82fd-178b2807b824"
version = "0.8.3"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates"]
git-tree-sha1 = "3bab2c5aa25e7840a4b065805c0cdfc01f3068d2"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.24"
weakdeps = ["Mmap", "Test"]

    [deps.FilePathsBase.extensions]
    FilePathsBaseMmapExt = "Mmap"
    FilePathsBaseTestExt = "Test"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FillArrays]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "173e4d8f14230a7523ae11b9a3fa9edb3e0efd78"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "1.14.0"
weakdeps = ["PDMats", "SparseArrays", "Statistics"]

    [deps.FillArrays.extensions]
    FillArraysPDMatsExt = "PDMats"
    FillArraysSparseArraysExt = "SparseArrays"
    FillArraysStatisticsExt = "Statistics"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Zlib_jll"]
git-tree-sha1 = "f85dac9a96a01087df6e3a749840015a0ca3817d"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.17.1+0"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.FreeType]]
deps = ["CEnum", "FreeType2_jll"]
git-tree-sha1 = "907369da0f8e80728ab49c1c7e09327bf0d6d999"
uuid = "b38be410-82b0-50bf-ab77-7b57e271db43"
version = "4.1.1"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "2c5512e11c791d1baed2049c5652441b28fc6a31"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.4+0"

[[deps.FreeTypeAbstraction]]
deps = ["BaseDirs", "ColorVectorSpace", "Colors", "FreeType", "GeometryBasics", "Mmap"]
git-tree-sha1 = "4ebb930ef4a43817991ba35db6317a05e59abd11"
uuid = "663a7486-cb36-511b-a19d-713bb74d65c9"
version = "0.10.8"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7a214fdac5ed5f59a22c2d9a885a16da1c74bbc7"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.17+0"

[[deps.GLFW]]
deps = ["GLFW_jll"]
git-tree-sha1 = "40412e58ec374029de3d4ad7c13e1a52aa1e149f"
uuid = "f7f18e0c-5ee9-5ccd-a5bf-e8befd85ed98"
version = "3.4.5"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll", "libdecor_jll", "xkbcommon_jll"]
git-tree-sha1 = "fcb0584ff34e25155876418979d4c8971243bb89"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.4.0+2"

[[deps.GLMakie]]
deps = ["ColorTypes", "Colors", "FileIO", "FixedPointNumbers", "FreeTypeAbstraction", "GLFW", "GeometryBasics", "LinearAlgebra", "Makie", "Markdown", "MeshIO", "ModernGL", "Observables", "PrecompileTools", "Printf", "ShaderAbstractions", "StaticArrays"]
git-tree-sha1 = "0d27753bf95dc7c5e3952189a1bec78b5ac7b784"
uuid = "e9467ef8-e4e7-5192-8a1a-b1aee30e663a"
version = "0.13.6"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "Extents", "IterTools", "LinearAlgebra", "PrecompileTools", "Random", "StaticArrays"]
git-tree-sha1 = "1f5a80f4ed9f5a4aada88fc2db456e637676414b"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.5.10"

    [deps.GeometryBasics.extensions]
    GeometryBasicsGeoInterfaceExt = "GeoInterface"

    [deps.GeometryBasics.weakdeps]
    GeoInterface = "cf35fbd7-0cd7-5166-be24-54bfbe79505f"

[[deps.GettextRuntime_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll"]
git-tree-sha1 = "45288942190db7c5f760f59c04495064eedf9340"
uuid = "b0724c58-0f36-5564-988d-3bb0596ebc4a"
version = "0.22.4+0"

[[deps.Ghostscript_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Zlib_jll"]
git-tree-sha1 = "38044a04637976140074d0b0621c1edf0eb531fd"
uuid = "61579ee1-b43e-5ca0-a5da-69d92c66a64b"
version = "9.55.1+0"

[[deps.Giflib_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6570366d757b50fabae9f4315ad74d2e40c0560a"
uuid = "59f7168a-df46-5410-90c8-f2779963d0ec"
version = "5.2.3+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "GettextRuntime_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "50c11ffab2a3d50192a228c313f05b5b5dc5acb2"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.86.0+0"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a6dbda1fd736d60cc477d99f2e7a042acfa46e8"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.15+0"

[[deps.GridLayoutBase]]
deps = ["GeometryBasics", "InteractiveUtils", "Observables"]
git-tree-sha1 = "93d5c27c8de51687a2c70ec0716e6e76f298416f"
uuid = "3955a311-db13-416c-9275-1d80ed98e5e9"
version = "0.11.2"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "f923f9a774fcf3f5cb761bfa43aeadd689714813"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "8.5.1+0"

[[deps.HypergeometricFunctions]]
deps = ["LinearAlgebra", "OpenLibm_jll", "SpecialFunctions"]
git-tree-sha1 = "68c173f4f449de5b438ee67ed0c9c748dc31a2ec"
uuid = "34004b35-14d8-5ef3-9330-4cdb6864b03a"
version = "0.3.28"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.ImageAxes]]
deps = ["AxisArrays", "ImageBase", "ImageCore", "Reexport", "SimpleTraits"]
git-tree-sha1 = "e12629406c6c4442539436581041d372d69c55ba"
uuid = "2803e5a7-5153-5ecf-9a86-9b4c37f5f5ac"
version = "0.6.12"

[[deps.ImageBase]]
deps = ["ImageCore", "Reexport"]
git-tree-sha1 = "eb49b82c172811fd2c86759fa0553a2221feb909"
uuid = "c817782e-172a-44cc-b673-b171935fbb9e"
version = "0.1.7"

[[deps.ImageCore]]
deps = ["ColorVectorSpace", "Colors", "FixedPointNumbers", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "PrecompileTools", "Reexport"]
git-tree-sha1 = "8c193230235bbcee22c8066b0374f63b5683c2d3"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.10.5"

[[deps.ImageIO]]
deps = ["FileIO", "IndirectArrays", "JpegTurbo", "LazyModules", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs", "WebP"]
git-tree-sha1 = "696144904b76e1ca433b886b4e7edd067d76cbf7"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.9"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "2a81c3897be6fbcde0802a0ebe6796d0562f63ec"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.10"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "0936ba688c6d201805a83da835b55c61a180db52"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.11+0"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "d1b1b796e47d94588b3757fe84fbf65a5ec4a80d"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.5"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "LazyArtifacts", "Libdl"]
git-tree-sha1 = "ec1debd61c300961f98064cfb21287613ad7f303"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2025.2.0+0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.Interpolations]]
deps = ["Adapt", "AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "65d505fa4c0d7072990d659ef3fc086eb6da8208"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.16.2"

    [deps.Interpolations.extensions]
    InterpolationsForwardDiffExt = "ForwardDiff"
    InterpolationsUnitfulExt = "Unitful"

    [deps.Interpolations.weakdeps]
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[[deps.IntervalArithmetic]]
deps = ["CRlibm", "MacroTools", "OpenBLASConsistentFPCSR_jll", "Printf", "Random", "RoundingEmulator"]
git-tree-sha1 = "815e74f416953c348c9da1d1bc977bbc97c84e18"
uuid = "d1acc4aa-44c8-5952-acd4-ba5d80a2a253"
version = "1.0.0"

    [deps.IntervalArithmetic.extensions]
    IntervalArithmeticArblibExt = "Arblib"
    IntervalArithmeticDiffRulesExt = "DiffRules"
    IntervalArithmeticForwardDiffExt = "ForwardDiff"
    IntervalArithmeticIntervalSetsExt = "IntervalSets"
    IntervalArithmeticLinearAlgebraExt = "LinearAlgebra"
    IntervalArithmeticRecipesBaseExt = "RecipesBase"
    IntervalArithmeticSparseArraysExt = "SparseArrays"

    [deps.IntervalArithmetic.weakdeps]
    Arblib = "fb37089c-8514-4489-9461-98f9c8763369"
    DiffRules = "b552c78f-8df3-52c6-915a-8e097449b14b"
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    IntervalSets = "8197267c-284f-5f27-9208-e0e47529a953"
    LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
    RecipesBase = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.IntervalSets]]
git-tree-sha1 = "5fbb102dcb8b1a858111ae81d56682376130517d"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.11"

    [deps.IntervalSets.extensions]
    IntervalSetsRandomExt = "Random"
    IntervalSetsRecipesBaseExt = "RecipesBase"
    IntervalSetsStatisticsExt = "Statistics"

    [deps.IntervalSets.weakdeps]
    Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
    RecipesBase = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
    Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.InverseFunctions]]
git-tree-sha1 = "a779299d77cd080bf77b97535acecd73e1c5e5cb"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.17"
weakdeps = ["Dates", "Test"]

    [deps.InverseFunctions.extensions]
    InverseFunctionsDatesExt = "Dates"
    InverseFunctionsTestExt = "Test"

[[deps.IrrationalConstants]]
git-tree-sha1 = "e2222959fbc6c19554dc15174c81bf7bf3aa691c"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.4"

[[deps.Isoband]]
deps = ["isoband_jll"]
git-tree-sha1 = "f9b6d97355599074dc867318950adaa6f9946137"
uuid = "f1662d9f-8043-43de-a69a-05efc1cc6ff4"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "42d5f897009e7ff2cf88db414a389e5ed1bdd023"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.10.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "0533e564aae234aff59ab625543145446d8b6ec2"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.7.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "9496de8fb52c224a2e3f9ff403947674517317d9"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.6"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "4255f0032eafd6451d707a51d5f0248b8a165e4d"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.1.3+0"

[[deps.KernelDensity]]
deps = ["Distributions", "DocStringExtensions", "FFTW", "Interpolations", "StatsBase"]
git-tree-sha1 = "ba51324b894edaf1df3ab16e2cc6bc3280a2f1a7"
uuid = "5ab0869b-81aa-558d-bb23-cbf5423bbe9b"
version = "0.6.10"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "059aabebaa7c82ccb853dd4a0ee9d17796f7e1bc"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.3+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "aaafe88dccbd957a8d82f7d05be9b69172e0cee3"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "4.0.1+0"

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "eb62a3deb62fc6d8822c0c4bef73e4412419c5d8"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "18.1.8+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1c602b1127f4751facb671441ca72715cc95938a"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.3+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "dda21b8cbd6a6c40d9d02a73230f9d70fed6918c"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.4.0"

[[deps.Latexify]]
deps = ["Format", "Ghostscript_jll", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "44f93c47f9cd6c7e431f2f2091fcba8f01cd7e8f"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.10"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"
    TectonicExt = "tectonic_jll"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"
    tectonic_jll = "d7dd28d6-a5e6-559c-9131-7eb760cdacc5"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"
version = "1.11.0"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c8da7e6a91781c41a863611c7e966098d783c57a"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.4.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "d36c21b9e7c172a44a10484125024495e2625ac0"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.7.1+1"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "be484f5c92fad0bd8acfef35fe017900b0b73809"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.18.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "3acf07f130a76f87c041cfb2ff7d7284ca67b072"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.41.2+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "f04133fe05eff1667d2054c53d59f9122383fe05"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.7.2+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "2a7a12fc0a4e7fb773450d17975322aa77142106"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.41.2+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "13ca9e2586b89836fd20cccf56e57e2b9ae7f38f"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.29"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "oneTBB_jll"]
git-tree-sha1 = "282cadc186e7b2ae0eeadbd7a4dffed4196ae2aa"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2025.2.0+0"

[[deps.MacroTools]]
git-tree-sha1 = "1e0228a030642014fe5cfe68c2c0a818f9e3f522"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.16"

[[deps.Makie]]
deps = ["Animations", "Base64", "CRC32c", "ColorBrewer", "ColorSchemes", "ColorTypes", "Colors", "ComputePipeline", "Contour", "Dates", "DelaunayTriangulation", "Distributions", "DocStringExtensions", "Downloads", "FFMPEG_jll", "FileIO", "FilePaths", "FixedPointNumbers", "Format", "FreeType", "FreeTypeAbstraction", "GeometryBasics", "GridLayoutBase", "ImageBase", "ImageIO", "InteractiveUtils", "Interpolations", "IntervalSets", "InverseFunctions", "Isoband", "KernelDensity", "LaTeXStrings", "LinearAlgebra", "MacroTools", "Markdown", "MathTeXEngine", "Observables", "OffsetArrays", "PNGFiles", "Packing", "Pkg", "PlotUtils", "PolygonOps", "PrecompileTools", "Printf", "REPL", "Random", "RelocatableFolders", "Scratch", "ShaderAbstractions", "Showoff", "SignedDistanceFields", "SparseArrays", "Statistics", "StatsBase", "StatsFuns", "StructArrays", "TriplotBase", "UnicodeFun", "Unitful"]
git-tree-sha1 = "368542cde25d381e44d84c3c4209764f05f4ef19"
uuid = "ee78f7c6-11fb-53f2-987a-cfe4a2b5a57a"
version = "0.24.6"

[[deps.MappedArrays]]
git-tree-sha1 = "2dab0221fe2b0f2cb6754eaa743cc266339f527e"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.2"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MathTeXEngine]]
deps = ["AbstractTrees", "Automa", "DataStructures", "FreeTypeAbstraction", "GeometryBasics", "LaTeXStrings", "REPL", "RelocatableFolders", "UnicodeFun"]
git-tree-sha1 = "a370fef694c109e1950836176ed0d5eabbb65479"
uuid = "0a4f8689-d25c-4efe-a92b-7142dfc1aa53"
version = "0.6.6"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.MeshIO]]
deps = ["ColorTypes", "FileIO", "GeometryBasics", "Printf"]
git-tree-sha1 = "c009236e222df68e554c7ce5c720e4a33cc0c23f"
uuid = "7269a6da-0436-5bbc-96c2-40638cbb6118"
version = "0.5.3"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.ModernGL]]
deps = ["Libdl"]
git-tree-sha1 = "ac6cb1d8807a05cf1acc9680e09d2294f9d33956"
uuid = "66fc600b-dfda-50eb-8b99-91cfa97b1301"
version = "1.1.8"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "d92b107dbb887293622df7697a2223f9f8176fcd"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.Observables]]
git-tree-sha1 = "7438a59546cf62428fc9d1bc94729146d37a7225"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.5.5"

[[deps.OffsetArrays]]
git-tree-sha1 = "117432e406b5c023f665fa73dc26e79ec3630151"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.17.0"
weakdeps = ["Adapt"]

    [deps.OffsetArrays.extensions]
    OffsetArraysAdaptExt = "Adapt"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "b6aa4566bb7ae78498a5e68943863fa8b5231b59"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.6+0"

[[deps.OpenBLASConsistentFPCSR_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "567515ca155d0020a45b05175449b499c63e7015"
uuid = "6cdc7f73-28fd-5e50-80fb-958a8875b1af"
version = "0.3.29+0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "97db9e07fe2091882c765380ef58ec553074e9c7"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.3"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "8292dd5c8a38257111ada2174000a33745b06d4e"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.2.4+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.5+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f19301ae653233bc88b1810ae908194f07f8db9d"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.4+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1346c9208249809840c91b26703912dff463d335"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.6+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c392fc5dd032381919e3b22dd32d6443760ce7ea"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.5.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.42.0+1"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "f07c06228a1c670ae4c87d1276b92c7c597fdda0"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.35"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "cf181f0b1e6a18dfeb0ee8acc4a9d1672499626c"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.4.4"

[[deps.Packing]]
deps = ["GeometryBasics"]
git-tree-sha1 = "bc5bf2ea3d5351edf285a06b0016788a121ce92c"
uuid = "19eb6ba3-879d-56ad-ad62-d5c202156566"
version = "0.5.1"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "0fac6313486baae819364c52b4f483450a9d793f"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.12"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1f7f9bbd5f7a2e5a9f7d96e51c9754454ea7f60b"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.56.4+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "7d2f8f21da5db6a806faf7b9b292296da42b2810"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.3"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "db76b1ecd5e9715f3d043cec13b2ec93ce015d53"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.44.2+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"
weakdeps = ["REPL"]

    [deps.Pkg.extensions]
    REPLExt = "REPL"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "f9501cc0430a26bc3d156ae1b5b0c1b47af4d6da"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.3.3"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "StableRNGs", "Statistics"]
git-tree-sha1 = "3ca9a356cd2e113c420f2c13bea19f8d3fb1cb18"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.4.3"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "Latexify", "Markdown", "PlutoUI"]
git-tree-sha1 = "dacc8be63916b078b592806acd13bb5e5137d7e9"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.4.6"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "8329a3a4f75e178c11c1ce2342778bcbbbfa7e3c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.71"

[[deps.PolygonOps]]
git-tree-sha1 = "77b3d3605fc1cd0b42d95eba87dfcd2bf67d5ff6"
uuid = "647866c9-e3ac-4575-94e7-e3d426903924"
version = "0.1.2"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "0f27480397253da18fe2c12a4ba4eb9eb208bf3d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.5.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "fbb92c6c56b34e1a2c4c36058f68f332bec840e7"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.11.0"

[[deps.PtrArrays]]
git-tree-sha1 = "1d36ef11a9aaf1e8b74dacc6a731dd1de8fd493d"
uuid = "43287f4e-b6f4-7ad1-bb20-aadabca52c3d"
version = "1.3.0"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "8b3fc30bc0390abdce15f8822c889f669baed73d"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.1"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "9da16da70037ba9d701192e27befedefb91ec284"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.11.2"

    [deps.QuadGK.extensions]
    QuadGKEnzymeExt = "Enzyme"

    [deps.QuadGK.weakdeps]
    Enzyme = "7da242da-08ed-463a-9acd-ee780be4f1d9"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "StyledStrings", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "1342a47bf3260ee108163042310d26f2be5ec90b"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.5"
weakdeps = ["FixedPointNumbers"]

    [deps.Ratios.extensions]
    RatiosFixedPointNumbersExt = "FixedPointNumbers"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "ffdaf70d81cf6ff22c2b6e733c900c3321cab864"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.1"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "852bd0f55565a9e973fcfee83a84413270224dc4"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.8.0"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "58cdd8fb2201a6267e1db87ff148dd6c1dbd8ad8"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.5.1+0"

[[deps.RoundingEmulator]]
git-tree-sha1 = "40b9edad2e5287e05bd413a38f61a8ff55b9557b"
uuid = "5eaf0fd0-dfba-4ccb-bf02-d820a40db705"
version = "0.2.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMD]]
deps = ["PrecompileTools"]
git-tree-sha1 = "e24dc23107d426a096d3eae6c165b921e74c18e4"
uuid = "fdea26ae-647d-5447-a871-4b548cad5224"
version = "3.7.2"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "9b81b8393e50b7d4e6d0a9f14e192294d3b7c109"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.3.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.ShaderAbstractions]]
deps = ["ColorTypes", "FixedPointNumbers", "GeometryBasics", "LinearAlgebra", "Observables", "StaticArrays"]
git-tree-sha1 = "818554664a2e01fc3784becb2eb3a82326a604b6"
uuid = "65257c39-d410-5151-9873-9b3e5be5013e"
version = "0.5.0"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"
version = "1.11.0"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SignedDistanceFields]]
deps = ["Random", "Statistics", "Test"]
git-tree-sha1 = "d263a08ec505853a5ff1c1ebde2070419e3f28e9"
uuid = "73760f76-fbc4-59ce-8f25-708e95d2df96"
version = "0.4.0"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "be8eeac05ec97d379347584fa9fe2f5f76795bcb"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.5"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "0494aed9501e7fb65daba895fb7fd57cc38bc743"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.5"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "64d974c2e6fdf07f8155b5b2ca2ffa9069b608d9"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.2"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.11.0"

[[deps.SpecialFunctions]]
deps = ["IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "f2685b435df2613e25fc10ad8c26dddb8640f547"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.6.1"
weakdeps = ["ChainRulesCore"]

    [deps.SpecialFunctions.extensions]
    SpecialFunctionsChainRulesCoreExt = "ChainRulesCore"

[[deps.StableRNGs]]
deps = ["Random"]
git-tree-sha1 = "95af145932c2ed859b63329952ce8d633719f091"
uuid = "860ef19b-820b-49d6-a774-d7a799459cd3"
version = "1.0.3"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "be1cf4eb0ac528d96f5115b4ed80c26a8d8ae621"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.2"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "PrecompileTools", "Random", "StaticArraysCore"]
git-tree-sha1 = "b8693004b385c842357406e3af647701fe783f98"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.9.15"
weakdeps = ["ChainRulesCore", "Statistics"]

    [deps.StaticArrays.extensions]
    StaticArraysChainRulesCoreExt = "ChainRulesCore"
    StaticArraysStatisticsExt = "Statistics"

[[deps.StaticArraysCore]]
git-tree-sha1 = "192954ef1208c7019899fbf8049e717f92959682"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.3"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"
weakdeps = ["SparseArrays"]

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "9d72a13a3f4dd3795a195ac5a44d7d6ff5f552ff"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.7.1"

[[deps.StatsBase]]
deps = ["AliasTables", "DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "2c962245732371acd51700dbb268af311bddd719"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.34.6"

[[deps.StatsFuns]]
deps = ["HypergeometricFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "8e45cecc66f3b42633b8ce14d431e8e57a3e242e"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "1.5.0"
weakdeps = ["ChainRulesCore", "InverseFunctions"]

    [deps.StatsFuns.extensions]
    StatsFunsChainRulesCoreExt = "ChainRulesCore"
    StatsFunsInverseFunctionsExt = "InverseFunctions"

[[deps.StructArrays]]
deps = ["ConstructionBase", "DataAPI", "Tables"]
git-tree-sha1 = "8ad2e38cbb812e29348719cc63580ec1dfeb9de4"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.7.1"

    [deps.StructArrays.extensions]
    StructArraysAdaptExt = "Adapt"
    StructArraysGPUArraysCoreExt = ["GPUArraysCore", "KernelAbstractions"]
    StructArraysLinearAlgebraExt = "LinearAlgebra"
    StructArraysSparseArraysExt = "SparseArrays"
    StructArraysStaticArraysExt = "StaticArrays"

    [deps.StructArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
    GPUArraysCore = "46192b85-c4d5-4398-a991-12ede77f4527"
    KernelAbstractions = "63c18a36-062a-441e-b654-da1e3ab1ce7c"
    LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.7.0+0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "f2c1efbc8f3a609aadf318094f8fc5204bdaf344"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.12.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "PrecompileTools", "ProgressMeter", "SIMD", "UUIDs"]
git-tree-sha1 = "98b9352a24cb6a2066f9ababcc6802de9aed8ad8"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.11.6"

[[deps.TranscodingStreams]]
git-tree-sha1 = "0c45878dcfdcfa8480052b6ab162cdd138781742"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.11.3"

[[deps.Tricks]]
git-tree-sha1 = "372b90fe551c019541fafc6ff034199dc19c8436"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.12"

[[deps.TriplotBase]]
git-tree-sha1 = "4d4ed7f294cda19382ff7de4c137d24d16adc89b"
uuid = "981d1d27-644d-49a2-9326-4793e63143c3"
version = "0.1.0"

[[deps.URIs]]
git-tree-sha1 = "bef26fb046d031353ef97a82e3fdb6afe7f21b1a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.6.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "cec2df8cf14e0844a8c4d770d12347fda5931d72"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.25.0"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    ForwardDiffExt = "ForwardDiff"
    InverseFunctionsUnitfulExt = "InverseFunctions"
    LatexifyExt = ["Latexify", "LaTeXStrings"]
    PrintfExt = "Printf"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"
    LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
    Latexify = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
    Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Wayland_jll]]
deps = ["Artifacts", "EpollShim_jll", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "96478df35bbc2f3e1e791bc7a3d0eeee559e60e9"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.24.0+0"

[[deps.WebP]]
deps = ["CEnum", "ColorTypes", "FileIO", "FixedPointNumbers", "ImageCore", "libwebp_jll"]
git-tree-sha1 = "aa1ca3c47f119fbdae8770c29820e5e6119b83f2"
uuid = "e3aaa7dc-3e4b-44e0-be63-ffb868ccd7c1"
version = "0.1.3"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c1a7aa6219628fcd757dede0ca95e245c5cd9511"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "1.0.0"

[[deps.XZ_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "fee71455b0aaa3440dfdd54a9a36ccef829be7d4"
uuid = "ffd25f8a-64ca-5728-b0f7-c24cf3aae800"
version = "5.8.1+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "b5899b25d17bf1889d25906fb9deed5da0c15b3b"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.12+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "aa1261ebbac3ccc8d16558ae6799524c450ed16b"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.13+0"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "6c74ca84bbabc18c4547014765d194ff0b4dc9da"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.4+0"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "52858d64353db33a56e13c341d7bf44cd0d7b309"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.6+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "a4c0ee07ad36bf8bbce1c3bb52d21fb1e0b987fb"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.7+0"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "75e00946e43621e09d431d9b95818ee751e6b2ef"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "6.0.2+0"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "a376af5c7ae60d29825164db40787f15c80c7c54"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.8.3+0"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll"]
git-tree-sha1 = "a5bc75478d323358a90dc36766f3c99ba7feb024"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.6+0"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "aff463c82a773cb86061bce8d53a0d976854923e"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.5+0"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "7ed9347888fac59a618302ee38216dd0379c480d"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.12+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXau_jll", "Xorg_libXdmcp_jll"]
git-tree-sha1 = "bfcaf7ec088eaba362093393fe11aa141fa15422"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.17.1+0"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "e3150c7400c41e207012b41659591f083f3ef795"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.3+0"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "801a858fc9fb90c11ffddee1801bb06a738bda9b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.7+0"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "00af7ebdc563c9217ecc67776d1bbf037dbcebf4"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.44.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "a63799ff68005991f9d9491b6e95bd3478d783cb"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.6.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "446b23e73536f84e8037f5dce465e92275f6a308"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.7+1"

[[deps.isoband_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51b5eeb3f98367157a7a12a1fb0aa5328946c03c"
uuid = "9a68df92-36a6-505f-a73e-abb412b6bfb4"
version = "0.2.3+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "371cc681c00a3ccc3fbc5c0fb91f58ba9bec1ecf"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.13.1+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "125eedcb0a4a0bba65b657251ce1d27c8714e9d6"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.17.4+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.libdecor_jll]]
deps = ["Artifacts", "Dbus_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pango_jll", "Wayland_jll", "xkbcommon_jll"]
git-tree-sha1 = "9bf7903af251d2050b467f76bdbe57ce541f7f4f"
uuid = "1183f4f0-6f2a-5f1a-908b-139f9cdfea6f"
version = "0.2.2+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "646634dd19587a56ee2f1199563ec056c5f228df"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.4+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "07b6a107d926093898e82b3b1db657ebe33134ec"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.50+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "libpng_jll"]
git-tree-sha1 = "c1733e347283df07689d71d61e14be986e49e47a"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.5+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll"]
git-tree-sha1 = "11e1772e7f3cc987e9d3de991dd4f6b2602663a5"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.8+0"

[[deps.libwebp_jll]]
deps = ["Artifacts", "Giflib_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libglvnd_jll", "Libtiff_jll", "libpng_jll"]
git-tree-sha1 = "4e4282c4d846e11dce56d74fa8040130b7a95cb3"
uuid = "c5f90fcd-3b7e-5836-afba-fc50a0988cb2"
version = "1.6.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.oneTBB_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "d5a767a3bb77135a99e433afe0eb14cd7f6914c3"
uuid = "1317d2d5-d96f-522e-a858-c73665f53c3e"
version = "2022.0.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "14cc7083fc6dff3cc44f2bc435ee96d06ed79aa7"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "10164.0.1+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e7b67590c14d487e734dcb925924c5dc43ec85f3"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "4.1.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "fbf139bce07a534df0e699dbb5f5cc9346f95cc1"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.9.2+0"
"""

# ╔═╡ Cell order:
# ╟─f5a35dee-973b-4c2a-bb2c-c5e537a77286
# ╟─7591351c-557a-43f3-81bc-bf1ebab82c8a
# ╟─6ddda10c-a37b-11f0-30e2-8f65d0703675
# ╟─957cdb10-9e44-4864-99b3-0dfce2623592
# ╟─76fb8daf-7b6e-465d-9155-09158623cf98
# ╟─4ff5ab25-1d37-4b65-a35b-e36490f609c9
# ╟─5eca419c-414b-426e-9a12-d7cc8cf74393
# ╟─aa2a97bb-a168-452c-bf92-e942d2e74982
# ╟─d2de929f-f14d-4ef5-a4c9-fbdfd6ddb602
# ╟─b4cc522e-9673-4fd3-8b7f-2a47732ba78e
# ╟─2cd4661a-00a5-4b19-9227-8eda8bdfeb0c
# ╟─7c67f3a0-a2f2-4026-86da-e059875d3758
# ╟─2db6ffd9-f146-4c9a-86c1-aefc917fbd42
# ╟─1e9ab1ed-d7a9-4bfe-a9d6-743cf54a583a
# ╟─729ddb69-3eda-4885-bd99-7129b6256bba
# ╟─275fb5d9-bc63-415b-98e4-644ebe7da628
# ╟─bd65fc51-d6e3-4d42-bfbb-a7ea0cff251a
# ╟─523a6731-5542-4131-88ff-3a9887c29751
# ╟─120a5b13-6413-471a-a01a-41c4a35dfce5
# ╟─349ac35e-10c9-4586-8517-f5b2739da6de
# ╟─84c3c863-3cf0-4903-af85-240485fac0a8
# ╟─d2c4c84f-2591-466e-9aa5-ac5c70ce48e7
# ╟─51a86009-c8c0-4ad4-a4a9-e0e3a0b1c40d
# ╟─56383383-af81-43cc-8b21-d1ca822fa379
# ╟─c90137b8-4c17-4742-a67a-ddebee962a9b
# ╟─16adae15-bcf7-4c5e-9d37-2181fe64a164
# ╟─85a2c951-9117-4318-8ed1-9950483aa1b2
# ╟─ebdd05b6-9dc4-4097-9489-792889d8485d
# ╟─10dff55b-2393-495e-883f-4da451f0318b
# ╟─c2631f4c-c454-4761-9db7-07d717ae83a3
# ╟─b50cbab7-83b8-49ec-a3f0-7797be2c536b
# ╟─e63c1515-e998-436e-9cfb-45c08f9611d7
# ╟─a479be15-4eed-4336-80db-4a90ad81d30f
# ╟─dd2c5e3d-6717-4397-917a-87b392392090
# ╟─a8e1ce9e-1c93-4177-8471-b5fc88e2d375
# ╟─23899e12-4387-41e3-93d7-5ac910ee9174
# ╟─f4034ee5-da52-4b4a-9146-8b45ae6ad0b0
# ╟─3dc8fb82-99e0-4402-b549-996c93e46660
# ╟─bb7fe85a-32d4-485e-8c1b-6000f3e6f8d4
# ╟─5f787cae-c8f7-487a-8a39-e0d81b5c5b42
# ╟─5355cedb-e4b8-4c31-bb34-7498edcf1b34
# ╟─38c309ca-7b92-4398-abc4-635b3b889c97
# ╟─3aa6c78d-d010-44c3-a5fe-b764b09e16d8
# ╟─3607525d-f005-4977-834f-57ba86e2cd18
# ╟─7983d72f-95c4-431e-ba39-6242cd19694e
# ╟─5f2088e9-5bf4-41fc-be01-a822e67dc7d5
# ╟─abbe0e9b-d62e-4912-89c3-e5dace1e8d66
# ╟─c9a90542-e1e3-4788-9185-a61f6c0e6941
# ╟─24e9b80e-0bc5-488d-bbb6-9b46bcfb5d4c
# ╟─000cfdf7-7b24-41fc-82cc-d2fe5b47457c
# ╟─4e4649cb-1ba5-4cda-833e-8451b00e7cc1
# ╟─de9e344c-d86c-4934-83bf-eef48c3b0f55
# ╟─d318c5e9-75c9-434f-be6d-fefa9336a895
# ╟─ef121ae4-fa18-4938-8596-be29164ece6c
# ╟─436b09f8-aaa7-4b4a-8989-1b2da9ddf6d9
# ╟─6341adcf-fd11-4d3c-8aad-0be897a85b1c
# ╟─108153fe-ffcf-4506-854c-a0da70b3f93a
# ╟─351810ad-b87f-4e4f-a8e7-fb68a4541e95
# ╟─0a2e8988-9669-48c3-8825-5ae8f7969ca0
# ╟─90c103a6-2ad1-485e-9b48-4da1435ee4a4
# ╟─e72ee126-9933-4655-9587-9f60d2efad96
# ╟─08a817ac-1c50-4a70-aca5-c89e343670f0
# ╟─a697d9c3-f7b7-4d0c-b18e-697f1cabcb87
# ╟─6fa14111-4b1c-44e1-a6f9-d4f6ce842340
# ╟─dd272752-4512-4d59-a65c-4d2fbe976823
# ╟─d6bb0cba-7fa3-4f2b-917b-1d59b922df94
# ╟─10a9e7eb-5e63-4ddc-921f-8805eb6c1039
# ╟─68fa1853-dfeb-4516-8807-c1508575cd4e
# ╟─baad704c-5109-4743-b253-cf2d5efb6263
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
