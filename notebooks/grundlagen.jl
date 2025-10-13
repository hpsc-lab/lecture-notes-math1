### A Pluto.jl notebook ###
# v0.20.19

using Markdown
using InteractiveUtils

# ╔═╡ 7591351c-557a-43f3-81bc-bf1ebab82c8a
begin
	using PlutoTeachingTools
	using PlutoUI
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
RobustLocalResource("https://raw.githubusercontent.com/hpsc-lab/lecture-notes-math1/5adcedfe62e071fdc1f229f820503475b6235da3/assets/mengen.svg", "../assets/mengen.svg")

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
    +  $A \Rightarrow B\quad\;\;$ aus $A$ folgt $B$
    +  $A \Leftrightarrow B\quad\;\;$ $A$ und $B$ sind äquivalent
 3. Variablen in Aussagen können nur mit in Kombination mit Quantoren vorkommen
    +  $\forall x\in M\quad\;$ für alle $x$ in $M$ gilt ...
    +  $\exists x\in M\quad\;$ es gibt (mind. ein) $x$ in $M$, so dass ...
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
##### Beispiele:
 
1. $(RobustLocalResource("https://raw.githubusercontent.com/hpsc-lab/lecture-notes-math1/5adcedfe62e071fdc1f229f820503475b6235da3/assets/bsp-mengen.svg","../assets/bsp-mengen.svg", :width=>200)) durch obigen Graphen lässt sich die folgende Relation beschreiben
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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoTeachingTools = "~0.4.6"
PlutoUI = "~0.7.71"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.7"
manifest_format = "2.0"
project_hash = "30f4a38dfcda7a14871c6ceb44e827f4b01e87ec"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "67e11ee83a43eb71ddc950302c53bf33f0690dfe"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.1"

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

    [deps.ColorTypes.weakdeps]
    StyledStrings = "f489334b-da3d-4c2e-b8f0-e476e12c162b"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.Ghostscript_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Zlib_jll"]
git-tree-sha1 = "38044a04637976140074d0b0621c1edf0eb531fd"
uuid = "61579ee1-b43e-5ca0-a5da-69d92c66a64b"
version = "9.55.1+0"

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

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

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

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "4255f0032eafd6451d707a51d5f0248b8a165e4d"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.1.3+0"

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

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.MacroTools]]
git-tree-sha1 = "1e0228a030642014fe5cfe68c2c0a818f9e3f522"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.16"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "7d2f8f21da5db6a806faf7b9b292296da42b2810"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.3"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

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

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "372b90fe551c019541fafc6ff034199dc19c8436"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.12"

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

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
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
# ╟─1e9ab1ed-d7a9-4bfe-a9d6-743cf54a583a
# ╟─729ddb69-3eda-4885-bd99-7129b6256bba
# ╟─275fb5d9-bc63-415b-98e4-644ebe7da628
# ╟─bd65fc51-d6e3-4d42-bfbb-a7ea0cff251a
# ╟─349ac35e-10c9-4586-8517-f5b2739da6de
# ╟─84c3c863-3cf0-4903-af85-240485fac0a8
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
