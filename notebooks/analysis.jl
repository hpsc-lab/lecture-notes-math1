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

# ╔═╡ 0f870d00-ce80-4c42-b444-d840c1e703c5
begin
	using PlutoTeachingTools
	using PlutoUI
	using CairoMakie
	ultramarine40 = RGBf(100/255.0, 143/255.0, 255/255.0)
	indigo50      = RGBf(120/255.0,  94/255.0, 240/255.0)
	magenta50     = RGBf(220/255.0,  38/255.0, 127/255.0)
	orange40      = RGBf(254/255.0,  97/255.0,   0/255.0)
	gold20        = RGBf(255/255.0, 176/255.0,   0/255.0)
	TableOfContents()
end

# ╔═╡ 2c52d212-a901-11f0-0610-e9b014ee6e4f
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

# ╔═╡ b2a667d1-da08-469d-84f0-03b2f58cf986
md"""
# 2 Analysis

"""

# ╔═╡ bf17ec96-f486-46bc-87c1-825770049537
md"""
## 2.1 Folgen
### 2.1.1 Grundbegriffe

##### Definition:
Folgen sind _Abbildungen_ der Form $a:\mathbb{N}\to A, n\mapsto a(n)$ mit einer bestimmten Menge $A$ (z.B. $\mathbb{K}:=\mathbb{R}$ oder $\mathbb{C}$). Statt $a(n)$ schreiben wir $a_n$, und statt $a$ oft $(a_n)_{n\in \mathbb{N}}$ oder $(a_n)_{n\in\mathbb{N}}\subset A$. Die $a_n$ werden als Folgenglieder bezeichnet.

##### Beispiel:
1.  $a_n:=\frac{1}{n^2},\quad$ also $1, \frac{1}{4},\frac{1}{9},\frac{1}{16},\dots$
2.  $a_n:= 1,\quad$ also  $1,1,1,\dots\quad$ (konstante Folge)
3.  $(a_n)_{n\geq0}$ mit  $a_n:=2^n,\quad$ also $1,2,4,8,16,\dots$
4.  $a_n:= i^n,\quad$ also $i,-1,-i,1,i,-1,\dots\quad$ (oszilierende Folge)
5.  $a_n:= (1+\frac{1}{n})^n,\quad$ also $2,\, 2,\!25,\, 2,\!37,\dots\quad$ (nähert sich $e=2.71828\dots$)
6.  $(a_n)$ mit $a_1=1$ und $a_{n+1}:=\frac{1}{2}(a_n+\frac{2}{a_n}),\quad$ also $1,\,1,\!5,\,1,\!41666\dots\quad$ (rekursiv definiert, nähert sich $\sqrt{2}$)
"""

# ╔═╡ 6e38ce1b-40ea-4b3e-8fc0-0b4599edaf81
md"""
##### Definition:
Eine Folge $(a_n)\subset \mathbb{K}$ besitzt den _Grenzwert_ $a\in\mathbb{K}$, falls

$\forall\varepsilon>0\,\exists n_0\in\mathbb{N}:\,|a_n-a|\leq \varepsilon\quad \forall n\geq n_0.$

Wir schreiben $\lim_{n\to\infty} a_n = a$ oder $a_n\overset{n\to\infty}{\longrightarrow} a$ und nennen $(a_n)$ _konvergent_, andernfalls _divergent_.

##### Beispiel:
1.  $(2^n)_{n\geq0}$ und $(i^n)_{n\in\mathbb{N}}$ sind divergent.
2.  $a_n:= \frac{1}{n}$ ist konvergent mit $\lim_{n\to\infty} \frac{1}{n}=0$
Beweis: Zu zeigen $\forall\varepsilon>0\,\exists n_0\in\mathbb{N}:\,|\frac{1}{n}-0|\leq \varepsilon\quad \forall n\geq n_0$.

Wir fangen rückwärts an, d.h. $\left|\frac{1}{n}\right| \overset{?}{\leq} \varepsilon$.

Es gilt $\left|\frac{1}{n}\right|\leq \varepsilon \Leftrightarrow \frac{1}{n}\leq\varepsilon\Leftrightarrow n\geq \frac{1}{\varepsilon}$

Wähle $n_0\in\mathbb{N}$ so, dass $n_0=\frac{1}{\varepsilon}$ bzw. $n_0-1\leq \frac{1}{\varepsilon}\leq n_0.$ Für jede beliebige $\varepsilon > 0$ gilt mit diesem $n_0(\varepsilon)$

$\left|\frac{1}{n}\right|\leq \varepsilon, \quad n\geq n_0$
"""

# ╔═╡ adc9c72d-5ba1-4343-a468-71ecf38ced99
md"""
##### Bemerkung:
1. Die Menge $B_\varepsilon(a) :=\{z\in\mathbb{K}|\, |z-a|<\varepsilon\}$ heißt _offene $\varepsilon$-Umgebung_ von $a$. Im Reellen ist das ein Intervall $(a-\varepsilon, a+\varepsilon)$. Im Komplexen ist es eine Kreisscheibe um $a$.$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c2c9a014eeebcd8711675a7375443c049c6da975/notebooks/assets/umgebung.svg","./assets/umgebung.svg"))


2.  $\lim_{n\to\infty}a_n=a\Leftrightarrow$ In jeder $\varepsilon$-Umgebung von $a$ liegen alle Folgengleider bis auf _endlich viele_.$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c2c9a014eeebcd8711675a7375443c049c6da975/notebooks/assets/folgenkonvergenz.svg","./assets/folgenkonvergenz.svg"))
3. Es lässt sich zeigen: Eine komplexe Folge $(z_n)_{n\in\mathbb{N}}$ konvergiert genau dann, wenn Real- und Imaginärteil konvergieren. Also

$z_n = x_n + y_ni, \quad \lim_{n\to\infty}x_n\to x,\quad \lim_{n\to\infty}y_n\to y$
$\Rightarrow \lim_{n\to\infty}z_n = x+yi.$

Wir versuchen Konvergenz zu charakterisieren.
"""

# ╔═╡ 38a8e16e-e34e-4bc6-92e0-c981748062bf
md"""
##### Definition:
 $(a_n)\subset \mathbb{K}$ heißt beschränkt, falls es ein $s\in\mathbb{R}, s\geq 0$ gibt mit

$|a_n|\leq s\quad \forall n\in\mathbb{N}$

##### Satz:
Jede konvergente Folge $(a_n)\subset\mathbb{K}$ ist beschränkt.

##### Beweis:
Sei $\lim_{n\to\infty}a_n=a$, d.h. zum Beispiel für $\varepsilon = 1:\quad \exists n_\varepsilon \in \mathbb{N}:\quad |a_n-a|\leq 1 \quad \forall n\geq n_\varepsilon$.

$|a_n| \leq |a_n-a+a|\underset{\triangle\text{-Ungl.}}{\leq} |a_n-a|+|a|\leq 1+|a|\quad \forall n\geq n_\varepsilon.$

Setze $s:=\max\{1+|a|, |a_1|, \dots, |a_{n_\varepsilon -1}|\}>0$
"""

# ╔═╡ 07319b68-1c84-4a9b-b1bd-dd4600dce204
md"""
##### Bemerkung:
1. Konvergenz $\Rightarrow$ Beschränkt ist äquivalent zu Unbeschränkt $\Rightarrow$ nicht konvergent $(A\Rightarrow B) \Leftrightarrow (\neg B \Rightarrow \neg A)$\
   Also $a_n = 2^n$ ist nicht konvergent.
2. Es gilt _nicht_: Beschränkt $\Rightarrow$ Konvergenz (keine Äquivalenz).\
   $a_n = (-1)^n$ ist beschränkt, aber nicht konvergent!\
   Beschränktheit ist _notwendig_ für Konvergenz, aber _nicht hinreichend_.
3. Unbeschränkte Folgen, die gegen $+\infty$ oder $-\infty$ "konvergieren" heißen _bestimmt_ divergent. $a_n=(-1)^n$ ist _unbestimmt_ divergent.

##### Definition:
Eine reelle Folge $(a_n)\in \mathbb{R}$ heißt _monoton_ wachsend, falls $a_n\leq a_{n+1}\quad \forall n \in \mathbb{N}$.

##### Bemerkung:
Analog für monoton fallend, sowie _streng_ monoton, falls $a_n<a_{n+1}$.
"""

# ╔═╡ d113d633-f636-4098-8741-040d56c3603b
md"""
##### Satz:
Sei $(a_n)\subset\mathbb{R}$ eine monoton wachsende Folge. Falls $(a_n)$ beschränkt ist, so ist $(a_n)$ konvergent.

##### Beweis:
Offenbar ist die Teilmenge $A:=\{a_n|\,n\in\mathbb{N}\}\subset\mathbb{R}$ nach oben beschränkt, also existiert $a:=\sup(A)$.

Wähle also ein $\varepsilon > 0$ beliebig. $a$ ist Supremum, also gibt es ein $n_\varepsilon\in\mathbb{N}$ mit $a_{n_\varepsilon}> a-\varepsilon$. Da $a_n$ monoton wächst, gilt  $a-\varepsilon<a_{n_\varepsilon}\leq a_n\leq a < a+\varepsilon \quad \forall n\geq n_\varepsilon,$
d.h. $|a_n-a|\leq \varepsilon.$

##### Bemerkung:
1. Analog gilt dies für monoton fallend.
2. Offenbar gilt "Beschränkt + Monoton $\Rightarrow$ Konvergenz". Wieder gilt die Umkehrung _nicht_, z.B. $a_n = (-1)^n\frac{1}{n}$ ist konvergent, aber nicht monoton.
3. Beschränktheit + Monotonie ist _hinreichend_, aber _nicht notwendig_ für Konvergenz.
"""

# ╔═╡ 852e50d3-afa0-4b8d-9aaf-92917797d067
md"""
##### Definition:
Sei $n_1<n_2<\dots$ eine streng monoton wachsende Folge in $\mathbb{N}$, d.h. $(n_k)_{k\in\mathbb{N}}\subset\mathbb{N}$. Dann heißt die Folge $(a_{n_k})= (a_{n_1}, a_{n_2},\dots)$ eine _Teilfolge_ von $(a_n)_{n\in\mathbb{N}}$.

##### Beispiel:
Die Folge $(i^n)_{n\in\mathbb{N}}$ enthält die Folge $((-1)^k)_{k\in\mathbb{N}}$ als Teilfolge, oder $(1)_{k\in\mathbb{N}}$ oder $((-1)^ki)_{k\in\mathbb{N}}.$

##### Satz (Bolzano/Weierstrass, 1840):
Falls $(a_n)\subset\mathbb{K}$ beschränkt ist, dann existiert eine konvergente Teilfolge.

##### Beweis:
Dieser Beweis kann in jedem guten Analysis Buch studiert werden (z.B. Forster, Königsberger, Alt etc.)
"""

# ╔═╡ a3370b80-0076-430f-a53d-33461e78de03
md"""
##### Bemerkung
1. Beschränktheit $\Rightarrow$ Konvergenz _einer Teilfolge_ ist nur hinreichend, nicht notwendig. $a_n = \begin{cases}\frac{1}{n} &\text{n gerade}\\n&\text{n ungerade}\end{cases}$ enthält eine konvergente Teilfoge.
2. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/778cd38219a43ad43e5faf1a0f0aa6c88998e985/notebooks/assets/folgenmengen.svg","./assets/folgenmengen.svg"))

##### Definition:
 $(a_n)\subset\mathbb{K}$ heißt _Cauchy-Folge_, wenn gilt

$\forall\varepsilon>0\,\exists n_\varepsilon\in\mathbb{N}:\quad |a_n-a_m|\leq \varepsilon \quad \forall n,m\in\mathbb{N}\, n,m\geq n_\varepsilon.$
Das heißt ab $n_\varepsilon$ wird der Abstand beliebiger Folgenglieder beliebig klein.

"""

# ╔═╡ 8f0aefc3-376b-4912-9bb9-0c4d0c9c7d0b
md"""
##### Bemerkung:
Dies ist eine Eigenschaft einer Folge ähnlich zu "beschränkt" oder "monoton" und ist _ohne_ Kenntnis des Grenzwertes zu überprüfen.

##### Satz:
 $(a_n)\subset\mathbb{K}$ ist konvergent genau dann, wenn die Folge eine Cauchy-Folge ist.

##### Beweis:
"Konvergenz $\Rightarrow$ Cauchy"

 1.  $\forall\varepsilon>0\,\exists n_\varepsilon\in\mathbb{N}:\,|a_n-a|\leq \frac{\varepsilon}{2}$\
 2. Wähle $n,m\geq n_\varepsilon$\
 3.  $|a_n-a_m|= |a_n-a-(a_m-a)|\leq |a_n-a|+|a_m-a|=\frac{\varepsilon}{2} + \frac{\varepsilon}{2}=\varepsilon$

"Cauchy $\Rightarrow$ Konvergenz"

Dies folgt aus dem Vollständigkeitsaxiom.
"""

# ╔═╡ c778da30-033c-40af-8c1d-ece03b3b7323
md"""
##### Bemerkung:

Tatsächlich ist das Vollständigkeitsaxiom äquivalent zur Aussage "Jede Cauchy-Folge in $\mathbb{K}$ konvergiert". Oft wird der Körper $\mathbb{R}$ definiert mit letzterem, das ist auch viel konstruktiver:

Betrachte $(a_n)\subset \mathbb{Q}$ eine rationale Folge mit $a_1=1$ und $a_{n+1}=\frac{1}{2}(a_n+\frac{2}{a_n}).$ Diese ist Cauchy-Folge (zu beweisen), aber konvergiert nicht in $\mathbb{Q}, \lim_{n\to\infty}a_n=\sqrt{2}\notin \mathbb{Q}$.

 $\mathbb{Q}$ wird _vervollständigt_ durch die Forderung "Alle Cauchy-Folgen konvergieren" und das Resultat ist dann $\mathbb{R}$. Jede _irrationale_ Zahl ist der Grenzwert einer Cauchy-Folge in $\mathbb{Q}$.


"""

# ╔═╡ adc24a61-9c0a-47fb-8d6c-6e46ab28e0e4
md"""
### 2.1.2 Rechnen mit Folgen

Um Grenzwerte auszurechnen ist Folgendes sehr nützlich:
##### Satz:
Seien $(a_n)$ und $(b_n)$ konvergente Folgen in $\mathbb{K}$ mit Grenzwerten $a$ und $b$. Dann gilt

1.  $\lim\limits_{n\to\infty} (\alpha\,a_n + \beta\,b_n) = \alpha\,a + \beta\,b \quad \forall\alpha,\beta \in \mathbb{K}$
2.  $\lim\limits_{n\to\infty} (a_n\cdot b_n) = a\cdot b$
3.  $\lim\limits_{n\to\infty} \left(\frac{1}{a_n}\right)=\frac{1}{a} $ und $\lim\limits_{n\to\infty}\sqrt{a_n}=\sqrt{a}$

##### Beispiel:
1.  $a_n = \frac{n^2-n}{2n^2+1}, \quad \lim\limits_{n\to\infty}a_n = ?$\
   Umformen zu einer Kombination von $\frac{1}{n}:$\
    $a_n = \frac{n^2(1-\frac{1}{n})}{n^2(2+\frac{1}{n^2})} = \frac{1-\frac{1}{n}}{2+\frac{1}{n}\cdot\frac{1}{n}}$\
    $\lim\limits_{n\to\infty}a_n = \frac{\lim\limits_{n\to\infty}1 - \lim\limits_{n\to\infty}\frac{1}{n}}{\lim\limits_{n\to\infty}2+\lim\limits_{n\to\infty}\frac{1}{n}\lim\limits_{n\to\infty}\frac{1}{n}} = \frac{1}{2}$

2.  $a_n = \frac{(n-2)^3}{(n+2)(4n^2-3)}=\frac{n^3(1-\frac{2}{n})^3}{n(1+\frac{2}{n})n^2(4-\frac{3}{n^2})} = \frac{(1-\frac{2}{n})^3}{(1+\frac{2}{n})(4-\frac{3}{n^2})}, \quad \lim\limits_{n\to\infty}a_n=\frac{1}{4}$
3.  $a_n = \sqrt{n+1}-\sqrt{n}\quad$ Trick: Erweitern mit Summe, sodass Wurzeln verschwinden.\
    $a_n = \sqrt{n+1}-\sqrt{n}\frac{\sqrt{n+1}+\sqrt{n}}{\sqrt{n+1}\sqrt{n}} =\frac{\sqrt{n+1}^2-\sqrt{n}^2}{\sqrt{n+1}+\sqrt{n}}$\
    $=\frac{n+1-n}{\sqrt{n+1}+\sqrt{n}} = \frac{1}{\sqrt{n}\sqrt{1+\frac{1}{n}}+\sqrt{n}}=\frac{\sqrt{\frac{1}{n}}}{\sqrt{1+\frac{1}{n} +1}}.$\
    $\lim\limits_{n\to\infty}a_n = 0$
4.  $a_n = \frac{n+\sin(n)}{n^2+1}=\frac{n^2(\frac{1}{n}+\frac{\sin(n)}{n})}{n^2(1+\frac{1}{n^2})}$\
    $\lim\limits_{n\to\infty} \frac{\sin(n)}{n} = ?,\quad \left|\frac{\sin(n)}{n}\right| \leq \frac{1}{n}\to 0\quad$ "eingeschlossen" durch Nullfolge\
    $\Rightarrow \lim\limits_{n\to\infty} \frac{\sin(n)}{n}=0.$\

    Es folgt $\lim_{n\to\infty}a_n = 0$.
"""

# ╔═╡ c42fe7f1-e46a-4223-b481-44a6ec2e85a0
md"""
##### Bemerkung:
Eine Folge $(a_n)_{n\in \mathbb{N}}\subset\mathbb{K}$ mit $\lim\limits_{n\to\infty}a_n = 0$ heißt _Nullfolge_.
"""

# ╔═╡ 2b35d288-6db4-4d8c-aa88-484390676ebf
md"""
## 2.2 Reihen
Praktisch alle interessanten mathematischen Objekte (z.B. Funktionen) können durch Reihen beschrieben werden.
##### Definition:
Sei $(a_n)_{n\in\mathbb{N}}\subset\mathbb{K}$ eine Folge. Die zugeordnete _Reihe_ ist die Folge der Partialsummen

$s_n:=\sum_{k=1}^na_k=(a_1,a_1+a_2, a_1+a_2+a_3,\dots)$
und für den Grenzwert schreiben wir
$\lim\limits_{n\to\infty}s_n = \lim\limits_{n\to\infty}\sum_{k=1}^na_k =: \sum_{k=1}^\infty a_k$.
Oft nennen wir einfach $\sum_{k=1}^\infty a_k$ die _Reihe_.

##### Beispiel:
1. Die arithmetische Reihe $\sum_{k=1}^\infty k$. Offenbar gilt $s_n = \sum_{k=1}^n a_k = \frac{n(n+1)}{2}$, also divergiert die Reihe.
2. Die geometrische Reihe: $\sum_{k=0}^\infty q^k$. Für die Partialsumme gilt

   $s_n = \sum_{k=0}^n q^k = \frac{1-q^{k+1}}{1-q},\, q\neq 1$
   Die Folge $(s_n)_{n\in\mathbb{N}}$ mit $s_n = \frac{1-q^{k+1}}{1-q}$ konvergiert, falls $|q|<1$, $\lim\limits_{n\to\infty} s_n = \frac{1}{1-q}= \sum_{k=0}^\infty q^k$, ansonsten ist die Reihe divergent.

3. Die harmonische Reihe $\sum_{k=1}^\infty \frac{1}{k}$ divergiert, denn

   $s_n = \sum_{k=1}^n \frac{1}{k} = 1 + \frac{1}{2} + \underbrace{\frac{1}{3}+\frac{1}{4}}_{>\frac{1}{2}}+\underbrace{\frac{1}{5}+\frac{1}{6}+\frac{1}{7}+\frac{1}{8}}_{>\frac{1}{2}}+\dots \quad \text{ mit } n = 2^m$
   also $s_{2^m} \geq 1+ \frac{m}{2} \, m\in\mathbb{N}$ und $\sum_{k=1}^\infty\frac 1{k}\to\infty$

4. $\sum_{k=1}^\infty \frac{1}{k(k+1)} = \frac{1}{2}+\frac{1}{6}+\frac{1}{12}+\frac{1}{20}+\cdots$
   $s_n = \sum_{k=1}^n\frac{1}{k(k+1)}=\sum_{k=1}^n(\frac{1}{k}-\frac{1}{k+1}) \overset{\text{Teleskopsumme}}{=} 1 - \frac{1}{n+1} \Rightarrow \lim_{n\to\infty}s_n=1$
"""

# ╔═╡ eac4a80e-42f2-4f5c-84b3-dd444a3e5193
md"""
##### Bemerkung
1. Für Konvergenz muss offenbar $(a_n)$ eine Nullfolge sein.
2. Wegen der Rechenregeln für Folgen gilt
$\sum_{k=1}^\infty a_k = a \text{ und } \sum_{k=1}^\infty b_k = b \Rightarrow \sum_{k=1}^\infty (\alpha\,a_k + \beta\,b_k) = \alpha\,a + \beta\,b$
3. Für $a_k>0$ ist $s_n = \sum_{k=1}^n a_k$ monoton wachsend, dann gilt $(s_n)_{n\in\mathbb{N}}$ beschränkt $\Leftrightarrow (s_n)$ konvergent, also $\sum_{k=1}^\infty a_k$ konvergent.
##### Definition und Satz:
Sei $(a_k)_{k\geq0}$ eine monoton fallende Nullfolge mit $a_k>0$. Dann konvergiert die _alternierende Reihe_ $\sum_{k=0}^\infty(-1)^ka_k.$
##### Beweis: (durch Bild)
$(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c0536a46787931effaac05a93691f63f193efd32/notebooks/assets/alternierende_reihe.svg","./assets/alternierende_reihe.svg"))
"""

# ╔═╡ df1df3b1-c00f-45b7-a207-5da3a0c46834
md"""
##### Beispiel:
 $\sum_{k=1}^\infty (-1)^{k+1}\frac{1}{k} = 1-\frac{1}{2}+\frac{1}{3}-\frac{1}{4}+\dots$ konvergiert gegen $\ln(2)$, jedoch sehr langsam.

##### Warnung:
Zwar lässt sich mit Reihen rechnen, aber im Allgemeinen spielt die _Summationsreihenfolge_ eine Rolle!
##### Beispiel:
Betrachte

$\begin{align*} \ln(2) &= 1-\frac{1}{2}+\frac{1}{3}-\frac{1}{4}+\frac{1}{5}-\frac{1}{6}+\frac{1}{7}-\frac{1}{8}+\frac{1}{9}-\frac{1}{10}+\frac{1}{11}-\frac{1}{12}\cdots \\[2pt]
	+\frac{1}{2}\,\ln(2) &= \phantom{1}+\frac{1}{2}\phantom{+\frac11\;\,}-\frac{1}{4}\phantom{+\frac11\;\,}+\frac{1}{6}\phantom{+\frac11\;\,}-\frac{1}{8}\phantom{+\frac11\;\,}+\frac{1}{10}\phantom{+\frac1{11}\;\,}-\frac{1}{12}\cdots \\[2pt]
\frac{3}{2}\,\ln(2) &= \underbrace{1+\,0\,+\frac{1}{3}-\frac{1}{2}+\frac{1}{5}+\,0\,+\frac{1}{7}-\frac{1}{4}+\frac{1}{9}\,+\;\;0\;\;+\frac{1}{11}-\,\frac{1}{6}\cdots}_{=\ln(2)? \quad \text{ dieselben Summanden, aber andere Reihenfolge}}\end{align*}$

Die obige alternierende Reihe kann so umsortiert werden, dass ein beliebiger Grenzwert entsteht. Wir wollen, dass die Reihenfolge keine Rolle spielt.
"""

# ╔═╡ f4035677-2ad9-47b1-a942-6f7ffd56b5e9
md"""
##### Definition:
Eine Reihe $\sum_{k=1}^\infty a_k$ heißt absolut konvergent, falls $\sum_{k=1}^\infty |a_k|$ konvergiert.

##### Bemerkung:
1. Absolute Konvergenz $\Rightarrow$ Konvergenz, denn:\
   Cauchy für abs. Konvergenz: $\forall\varepsilon>0\,\exists n:\varepsilon\in \mathbb{N}:\, |s_n-s_m|<\varepsilon\quad m>n\geq n_\varepsilon$\
   $\left|\sum_{k=1}^n|a_k|-\sum_{k=1}^m|a_k|\right| = \left|\sum_{k=n+1}^m |a_k|\right|= \sum_{k=n+1}^m |a_k|$\
   Cauchy für Konvergenz: $\quad |s_n-s_m| = |\sum_{k=n+1}^m a_k | \leq \sum_{k=n+1}^m |a_k| <\varepsilon$
2. Es lässt sich zeigen: Bei absolut konvergenten Reihen ist der Grenzwert unabhängig von der Summationsreihenfolge
"""

# ╔═╡ 8bf26b35-aca3-4ecd-851f-2c1c1e82922e
md"""
### 2.2.1 Kriterien für absolute Konvergenz
##### Satz:
Die Reihe $\sum_{k=1}^\infty a_k$ ist absolut konvergent, falls eine der folgenden Bedingungen gilt:
1. Es existiert $\sum_{k=1}^\infty c_k$ konvergent mit $c_k\geq 0$ und $|a_k|\leq c_k$ ab $k\geq N\in \mathbb{N} \quad$"Majorantenkriterium"
2. Es existiert ein $q<1:\, \sqrt[k]{|a_k|} \leq q \quad$ ab $k \geq N\quad$ "Wurzelkriterium"
3. Es existiert ein $q<1: \, \left|\frac{a_{k+1}}{a_k}\right| \leq q \quad$ ab $k\geq N \quad$ "Quotientenkriterium"

##### Beweis:
1. wie oben: Cauchy für $\sum c_k \Rightarrow$ Cauchy für $\sum|a_k|$)
2. wegen $|a_k|\leq q^k$ ist $\sum_{k=1}^\infty q^k$ eine Majorante
3. Es ist $|a_{k+1}|\leq q\,|a_k|\leq q^2\,|a_{k-1}\leq \dots \leq q^{k+1}\,|a_0|\Rightarrow |a_0|\sum_{k=1}^\infty q^k$ ist Majorante

##### Bemerkung:
anstatt 2. und 3. wird oft Folgendes benutzt:

$\lim_{k\to\infty}\sqrt[k]{|a_k|}<1$
$\lim_{k\to\infty}\left|\frac{a_{k+1}}{a_k}\right|<1$
"""

# ╔═╡ 4393a0c9-168a-4fc9-b678-3e7e06b461ff
md"""
### 2.2.2 Potenzreihen
##### Beispiel:
Die geometrische Reihe definiert eine Funktion $g:(-1,1)\subset\mathbb{R}\to \mathbb{R}, \,x\mapsto \sum_{k=0}^\infty x^k.$\
$g(x)$ ist identisch mit $g(x) = \frac{1}{1-x}$ im Intervall $(-1,1).$

##### Definition:
Für $x\in\mathbb{K}$ heißt $\sum_{k=0}^\infty a_k\,x^k = a_0\,x+a_1\,x+a_2\,x^2+\cdots$ Potenzreihe in x.\
Hierbei sind die $a_k$ Koeffizienten, nicht Folgenglieder!

##### Bemerkung:
1. Dies definiert eine Funktion $f:D_{\!f}\subset\mathbb{K}\to \mathbb{K}, x\mapsto \sum_{k=0}^\infty a_k\,x^k$ mit $D_{\!f} = \{x\in\mathbb{K}\mid\sum_{k=0}^\infty a_k\,x^k$ konvergiert$\}$.
2. Die Potenzreihe oben ist "um den Punkt $0$".\
   Die Reihe $\sum_{k=0}^\infty a_k\,(x-x_0)^k$ wäre die Potenzreihe um $x_0$.

Leitfrage: Für welche $x\in \mathbb{K}$ konvergiert die Potenzreihe?
"""

# ╔═╡ 1b1f1b81-9ddf-4f4c-bfc6-5de4b3b78896
md"""
##### Satz und Definition:
Für eine Potenzreihe $\sum_{k=0}^\infty a_k\,x^k$ heißt $\varrho := \frac{1}{\lim\limits_{n\to\infty} \sqrt[k]{|a_k|}} \in \mathbb{R}$ der _Konvergenzradius_. Die Reihe konvergiert absolut für $|x|<\varrho$ und divergiert für $|x|>\varrho$.

##### Beweis:
(durch Verwenden des Wurzelkriterium)

$\lim_{k\to\infty}\sqrt[k]{|a_k\,x^k|} = \lim_{k\to\infty}\sqrt[k]{|a_k|}\cdot |x| = \frac{|x|}{\varrho} = \begin{cases}<1&|x|<\varrho\\>1&|x|>\varrho\end{cases}$

##### Bemerkung:
1. Der Rand, $|x| = \varrho$, muss extra untersucht werden.
2. Alternativ gilt $\varrho = \frac{1}{\lim\limits_{k\to\infty}\left|\frac{a_{k+1}}{a_k}\right|}$
"""

# ╔═╡ ba88414f-f414-44e7-8036-3037e62c0633
md"""
##### Beispiel:
$\sum_{k=0}^\infty \frac{1}{k}x^k,\quad a_k = \frac1k, \quad \lim_{k\to\infty}\left|\frac{a_{k+1}}{a_k}\right| = \lim_{k\to\infty}\left|\frac{k}{k+1}\right|=1\Rightarrow \varrho=1$
Die Reihe konvergiert absolut für $|x|<1$.\
Für $x=1$ ist $\sum_{k=0}^\infty \frac{1}{k}$ nicht konvergent.\
Für $x=-1$ ist $\sum_{k=0}^\infty \frac{-1^k}{k}$ konvergent, aber nicht absolut konvergent.
"""

# ╔═╡ 0d30d014-3031-4c3b-b8ea-f2431d8b805f
md"""
### 2.2.3 Die Exponentialreihe
##### Satz und Definition:
Die Reihe $\sum_{k=0}^\infty \frac{1}{k!}x^k = 1+x+\frac{1}{2}x^2+\frac{1}{6}x^3\dots$ heißt _Exponentialreihe_. Der Konvergenzradius ist $\varrho=\infty$, das heißt sie konvergiert für alle $x\in \mathbb{K}$ absolut.

##### Beweis:

$\lim_{k\to\infty}\left|\frac{a_{k+1}}{a_k}\right| = \lim_{k\to \infty}\left|\frac{k!}{(k+1)!}\right|=\lim_{k\to\infty}\frac{1}{(k+1)}=0\Rightarrow \varrho = \infty$

##### Satz und Definition:
Sind $\sum_{k=0}^\infty a_k$ und $\sum_{k=0}^\infty b_k$ absolut konvergente Reihen, so konvergiert auch das Cauchy-Produkt $\sum_{k=0}^\infty c_k$ mit $c_k := \sum_{j=0}^k a_j b_{k-j}$ absolut und es gilt $\sum_{k=0}^\infty c_k = \left(\sum_{k=0}^\infty a_k\right) \cdot \left( \sum_{k=0}^\infty b_k\right).$


"""

# ╔═╡ e6f45d31-b850-41e8-8343-8b2b7b551aa4
md"""
Wir betrachten die Funktion $f:\mathbb{R}\to\mathbb{R},\quad x\mapsto \sum_{k=0}^\infty \frac{1}{k!}x^k$.\
Es gilt (mit obigem Satz)

$\begin{align*}
f(a)\cdot f(b) &= \sum_{k=0}^\infty \frac{a^k}{k!}\cdot \sum_{k=0}^\infty \frac{b^k}{k!} =\sum_{r=0}^\infty \sum_{k=0}^r \frac{a^k\,b^{r-k}}{k!\,(r-k)!}\\[2pt]
&= \sum_{r=0}^\infty \sum_{k=0}^r \frac{1}{r!} \underbrace{\frac{r!\,a^k\,b^{r-k}}{k!\,(r-k)!}}_{=(a+b)^r,\text{ binomische Formel}}\\[2pt]
&= \sum_{r=0}^\infty \frac{1}{r!}(a+b)^r=f(a+b).
\end{align*}$

Damit folgt

$\begin{align*}f(2) &= f(1+1) = f(1)f(1) = f(1)^2,\\[2pt] f(3) &= f(1+1+1)=f(1)^3.\end{align*}$

Das heißt für $p\in\mathbb{N}: f(p) = f(1)^p,\quad$ "$\!f$ exponiert zur Basis $f(1)$".

Wir definieren die _Eulersche Zahl_ $e:= f(1) = \sum_{k=0}^\infty \frac{1}{k!}$ und damit $f(p)=e^p$.

Weiterhin gilt $f(0)=1$ und $f(x-x) = f(x)\cdot f(-x) = 1$, also $f(-x) = \frac{1}{f(x)}$, d.h. $\,e^{-n} = \frac{1}{e^n}.$

Außerdem ist

$\begin{align*}
f(1) &= f\left(\frac{1}{2}+\frac{1}{2}\right)=f\left(\frac{1}{2}\right)^2 \Rightarrow f\left(\frac{1}{2}\right)= \sqrt{f(1)}=f(1)^{\frac{1}{2}}\\[2pt]
f(1) &= f\left(\frac{1}{3}+\frac{1}{3}+\frac{1}{3}\right)=f\left(\frac{1}{3}\right)^3\Rightarrow f\left(\frac{1}{3}\right)=f(1)^{\frac{1}{3}}\\[2pt]
 &\Rightarrow f\left(\frac{1}{q}\right) = e^{\frac{1}{q}} = \sqrt[q]{e}.
\end{align*}$

Analog ist $f\left(\frac{p}{q}\right) = e^{\frac{p}{q}}\quad$ für $p,q\in\mathbb{N},\,$ d.h. $f(x) = e^x, \quad x\in\mathbb{Q}.$
"""

# ╔═╡ 65c54798-28b9-445e-aafb-727d3db668ef
md"""
##### Verallgemeinerung:
 $e^x:= f(x) = \sum_{k=0}^\infty \frac{1}{k!}x^k =: \exp(x)$ für $x\in \mathbb{R}$ und $x\in\mathbb{C}$.

Komplexe Argumente: $x\in\mathbb{C}, \,x = a+bi\quad a,b\in\mathbb{R}.$
$f(x) = f(a+bi) = \underbrace{f(a)}_{\in\mathbb{R}} \cdot \underbrace{f(bi)}_{\in\mathbb{C}?}$\
Was ist $z=e^{ib}$?
"""

# ╔═╡ a9b40cf0-b359-454b-8efe-53c3ad4bbea5
md"""
##### Satz:
$|e^{ib}|=1 \quad \forall b\in\mathbb{R}$

##### Beweis:
Zunächst komplexe Konjugation:

$\overline{f(x)} = \overline{\sum_{k=0}^\infty \frac{1}{k!}x^k} = \sum_{k=0}^\infty \frac{1}{k!}\overline{x}^k = f(\overline{x}).$
Damit ist

$|f(ib)| = \sqrt{f(ib)\cdot \overline{f(ib)}} = \sqrt{f(ib)f(\overline{ib})} = \sqrt{f(ib)f(-ib)}? \sqrt{f(ib)\frac{1}{f(ib)}}=1.$


 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c0536a46787931effaac05a93691f63f193efd32/notebooks/assets/exponential_formula.svg","./assets/exponential_formula.svg"))

 $e^{it} = \cos(\alpha)+i\sin(\alpha)\Rightarrow \alpha$ hängt irgendwie von $t$ ab, aber wie?

##### Satz:
Unter der Funktion $f(i\cdot):\mathbb{R}\to\mathbb{C}, t\mapsto e^{it}$ wird die reelle Achse $t\in \mathbb{R}$ längentreu und monoton auf den Einheitskreis abgewickelt, d.h. $\alpha = t$.

Hier ohne Beweis.
"""

# ╔═╡ 10a8d630-9cc2-40ec-831f-816f52723f9f
md"""
##### Satz:
Die geometrischen Funktionen $\sin$ und $\cos$ lassen sich darstellen als $\cos(t) = \mathrm{Re}(e^{it})$ und $\sin(t)=\mathrm{Im}(e^{it})$, d.h.

$e^{it}=\cos(t) +i \sin(t)$
und genügen den Potenzreihen

$\cos(t) = \sum_{k=0}^\infty  (-1)^k \frac{t^{2k}}{(2k)!},\quad \sin(t) = \sum_{k=0}^\infty (-1)^k\frac{t^{2k+1}}{(2k+1)!}$

##### Beweis:
Der erste Teil folgt aus dem obigen Satz. Außerdem haben wir

$e^{it} = \sum_{k=0}^\infty \frac{(it)^k}{k!} = 1 + it + \underbrace{\frac{1}{2}(it)^2}_{=-t^2} + \underbrace{\frac{1}{6}(it)^3}_{=-i\,t^3} + \underbrace{\frac{1}{24}(it)^4}_{t^4} + \dots$
Realteil ist also jede gerade Potenz ($\cos$) und Imaginärteil jede ungerade Potenz ($\sin$).
"""

# ╔═╡ 1a15c7e7-c181-402c-b8f7-24925600b785
md"""
##### Bemerkung:
Es gelten
1. $\cos(t) = \mathrm{Re}(e^{it}) = \frac{1}{2}(e^{it}+e^{it}),$
   $\sin(t) = \mathrm{Im}(e^{it}) = \frac{1}{2i}(e^{it}-e^{it}).$
2. $e^{i\pi}=\cos(\pi)+i\sin(\pi) = 1,$
   $e^{i\frac{\pi}{2}} = \cos(\frac{\pi}{2})+i\sin(\frac{\pi}{2})=i.$

##### Definition:
Für verschiedene Anwendungen (z.B. Kettenlinien) sind die hyperbolischen Funktionen wichtig:\
$\cosh(t):= \frac{1}{2}(e^t+e^{-t}), \quad$ "cosinus hyperbolicus"\
$\sinh(t):=\frac{1}{2}(e^t-e^{-1}),\quad$ "sinus hyperbolicus".

##### Eigenschaften:
Es gilt $\cosh^2(t)-\sinh^2(t) = 1$, entgegen $\cos^2(t) + \sin^2(t) = 1$.
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c0536a46787931effaac05a93691f63f193efd32/notebooks/assets/hyperbolicus.svg","./assets/hyperbolicus.svg"))

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c0536a46787931effaac05a93691f63f193efd32/notebooks/assets/unit_circle_trigonometry.svg","./assets/unit_circle_trigonometry.svg",:width=>330))
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c0536a46787931effaac05a93691f63f193efd32/notebooks/assets/unit_circle_hyperbolic.svg","./assets/unit_circle_hyperbolic.svg",:width=>330))

Der rot markierte Flächeninhalt beträgt stets $\frac{t}{2}$.
"""


# ╔═╡ 257a7c67-60e3-4322-bf41-38d774d1fc8e
md"""
### 2.2.5 Logarithmus

##### Satz:
Für die Funktion $\exp:\mathbb{R}\to\mathbb{R}, x\mapsto e^x$ gilt
1.  $e^x>0 \quad \forall x \in \mathbb{R}$
2. Als Funktion $\exp: \mathbb{R}\to\mathbb{R}^+$ ist $\exp$ bijektiv.
Wir können also $\exp$ umkehren.

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/c0536a46787931effaac05a93691f63f193efd32/notebooks/assets/logarithmus.svg","./assets/logarithmus.svg"))
##### Definition:
Die Funktion $\exp^{-1}:\mathbb{R}^+\to\mathbb{R}$ heißt _natürlicher Logarithmus_ "$\ln$".

Es gilt $\ln(e^x)=x$ und $e^{\ln(x)} = x$, sowie $\ln(x\cdot y) = \ln(x)+\ln(y)$ wegen $e^{a+b}=e^ae^b$, also $\ln(x^{\frac{p}{q}}) = \frac{p}{q} \ln(x).$
"""

# ╔═╡ 8d2ad4af-cac1-40a0-b373-3f7c8541fd1d
md"""
##### Definition
Die allgemeine Exponentialfunktion zur Basis $a$, d.h. $a^x$, ist für $x\in \mathbb{R}$ definiert als

$a^x:=(e^{\ln(a)})^x=e^{x\cdot\ln(a)}$
"""

# ╔═╡ cb6d0485-be4a-4b5e-b676-9213fb604cc0
md"""
## 2.3 Relle Funktionen
### 2.3.1 Grundbegriffe

$f:D\subset \mathbb{R}\to \mathbb{R}, x\mapsto y=f(x)$
Erinnere:
*  $D$ ist Definitionsbereich
*  $\mathrm{Im}(f) = \{y\in\mathbb{R}|\, y=f(x), x\in D\}$ ist der Wertebereich
* injektiv, surjektiv, bijektiv
* bijektive Funktionen lassen sich umkehren

##### Definition
Mehr elementare Eigenschaften von reellen Funktionen:
1.  $f$ ist beschränkt, falls $|f(x)| \leq M \quad \forall x\in D,\, M>0.$
2.  $f$ ist $\begin{cases} \text{gerade}\\\text{ungerade}\end{cases}\,$, falls $\forall x\in D\begin{cases}f(-x)=f(x)\\f(-x)=-f(x)\end{cases}$
3.  $f$ ist monoton $\begin{cases} \text{fallend}\\\text{wachsend}\end{cases}\,$, falls $\forall x_1,x_2\in D\begin{cases}x_1<x_2\Rightarrow f(x_1)\geq f(x_2)\\x_1<x_2\Rightarrow f(x_1) \leq f(x_2)\end{cases}$
4.  $f$ ist periodisch mit Periode $L$, falls $f(x+L) = f(x)\quad \forall x\in D.$
"""

# ╔═╡ b7a09980-45a0-4765-bff2-2a7302344075
md"""
##### Beispiel:
1.  $f(x) = \sin(x)$ ist beschränkt durch 1, ungerade und periodisch mit $2\pi$
2.  $f(x)=\sinh(x)$ ist unbeschränkt, ungerade, streng monoton wachsend und bijektiv

Wie bestimmt man die Umkehrfunktion?

 $y = \frac{1}{2}(e^x-e^{-x})$ nach $x$ auflösen. Definiere $z:= e^x$, dann gilt:

 $y = \frac{1}{2}(z-\frac{1}{z}) \Leftrightarrow z^2 - 2yz-1 = 0.$

 $\;\,z_{1,2} = y \pm \sqrt{y^2-1}\quad$ Es ist aber $z=e^x>0.$\
 $\Rightarrow x = \ln(y+\sqrt{y^2+1}) =: \mathrm{arsinh}(y).\quad$ "area sinus hyperbolicus"
"""

# ╔═╡ 63dc9443-c896-48a4-ae32-153f004f8303
md"""
### 2.3.2 Grenzwerte von Funktionen
Wir benutzen für diese Idee Folgen!

##### Definition:
Eine Zahl $b\in\mathbb{R}$ heißt Grenzwert von $f$ bei $a\in D$, wenn für alle Folgen $(x_n)\subset D$ mit $\lim\limits_{n\to\infty}x_n=a$ gilt $\lim\limits_{n\to\infty}f(x_n)=b$. Wir schreiben $b = \lim\limits_{x\to a}f(x)$.

##### Bemerkung:
1.  $b$ muss nicht Funktionswert sein(!), $\pm \infty$ sind mögliche "uneigentliche" Grenzwerte.
2. Werden nur Folgen mit $x_n<a$ betrachtet, heißt der Grenzwert _linksseitig_, $\lim\limits_{x\to a^-}f(x)$, für $x_n>a$ _rechtsseitig_, $\lim\limits_{x\to a^+} f(x).$
"""

# ╔═╡ 6edf4001-6421-4bf4-bd15-7d4c2bc999c3
md"""
##### Beispiel:
1. $f(x) = \begin{cases} x&0\leq x<1,\\x+1& x\geq 1.\end{cases}$
    $\,\lim\limits_{x\to 2}\;f(x) = 3, \quad \,\lim\limits_{x\to 1}\;f(x)$ existiert nicht\
   $\lim\limits_{x\to1^+}f(x) = 2,\quad \lim\limits_{x\to1^-} f(x)=1.$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/e6e200f5162e4c52f553aaa2d8cbe70c805ffde9/notebooks/assets/unstetig_linear.svg","./assets/unstetig_linear.svg"))
2. $f(x) = \begin{cases}\sin(x)&x\in\mathbb{R}\setminus\{\frac{\pi}{2}\},\\2&x=\frac{\pi}{2}.\end{cases}$
    $\,\lim\limits_{x\to 2}\;f(x)=\sin(\frac{\pi}{2})=1\neq 2,$\
   $\lim\limits_{x\to2^-}f(x)=1=\lim\limits_{x\to2^+}f(x).$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/e6e200f5162e4c52f553aaa2d8cbe70c805ffde9/notebooks/assets/unstetig_sinus.svg","./assets/unstetig_sinus.svg"))
3. $f:\mathbb{R}\setminus\{2\}\to\mathbb{R}, x\mapsto f(x) = \frac{x^2-4}{x-2}$
    $\,\lim\limits_{x\to2}f(x) = ?, \quad (x_n): x_n\to 2, \quad f(x_n) = \frac{\overbrace{x_n^2-4}^{(x_n-2)(x_n+2)}}{x_n-2}=x_n+2$\
   $\lim\limits_{n\to\infty}f(x_n) = \lim\limits_{n\to\infty}(x_n+2)=4.$
4. $f(x) = \begin{cases}1&x\in \mathbb{Q}\\0&x\notin\mathbb{Q}\end{cases},\quad \lim\limits_{x\to a}f(x) \text{ existiert für kein } a\in\mathbb{R}.$
   * Konstruiere $(x_n)\subset \mathbb{R}$ mit $x_n\in (a-\frac{1}{n}, a+\frac{1}{n})$ und $x_n\in \mathbb{Q}.$\
     $\lim\limits_{n\to\infty}x_n=a,\quad \quad \lim\limits_{n\to\infty}f(x_n)=1$
   * Konstruiere $(x_n)\subset\mathbb{R}$ mit $x_n\in (a-\frac{1}{n},a+\frac{1}{n})$ und $x_n\notin \mathbb{Q}.$
     $\lim\limits_{n\to\infty}x_n=a,\quad\quad \lim\limits_{n_\to\infty}f(x_n) = 0.$
5. $f(x) = e^{-\frac{1}{x}}$
    $\lim\limits_{x\to0}f(x)$ existiert nicht, da $\lim\limits_{x\to0^+}f(x)=0,\quad \lim\limits_{x_\to0^-}f(x)=\infty.$
6. $f(x) = \frac{1}{x-2}$
    $\lim\limits_{x\to2^+}f(x) = \infty,\quad\lim\limits_{x\to2^-}f(x)=-\infty.$
7. $f(x) = \frac{\sin(x)}{x}, \quad \lim\limits_{x\to0}f(x)=?$
   Zur Widerholung: $\sin(x) = \sum_{k=0}^\infty (-1)^k\frac{x^{2k+1}}{(2k+1)!}=x-\frac{1}{6}x^3+\frac{1}{120}x^5-\dots$\
   $\Rightarrow \lim\limits_{x\to0}\frac{\sin(x)}{x}=\lim\limits_{x\to0}\frac{x-\frac{1}{6}x^3+\frac{1}{120}x^5-\dots}{x}=\lim\limits_{x\to0}(1-\frac{1}{6}x^2+\frac{1}{120}x^4-\dots)=1.$
"""

# ╔═╡ b5a979ca-f35b-47ec-b460-287022148faf
md"""
##### Bemerkung:
 $\lim\limits_{x\to a}f(x)$ mit $a = \pm\infty$ kann ebenfalls auf die Existenz eines Grenzwertes untersucht werden.

##### Beispiel:
1.  $\lim\limits_{x\to\infty} \frac{1}{x}=0$
2.  $\lim\limits_{x\to\infty}\sin(x)$ existiert nicht.
3.  $\lim\limits_{x\to\infty} \frac{e^x}{x^p}=\infty.$ Das folgt mit Exp-Reihe. Das heißt $\exp$ wächst schneller als jede Potenz!
4.  $\lim\limits_{x\to\infty}\frac{\ln(x)}{x^p}=0.$ $\ln$ wächst also langsamer als jede Potenz.
5.  $\lim\limits_{x\to\infty} x\sin\left(\frac{1}{x}\right) = \lim\limits_{y\to\infty}\left(\frac{1}{y}\sin\left(\frac{1}{\frac{1}{y}}\right)\right) = \lim\limits_{y\to\infty}\frac{\sin(y)}{y}=0$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/e6e200f5162e4c52f553aaa2d8cbe70c805ffde9/notebooks/assets/topologen_sinus.svg","./assets/topologen_sinus.svg"))
"""

# ╔═╡ bb566e84-1ba2-411f-8d1a-895453dd6e43
md"""
### 2.3.3 Stetigkeit
_Idee_: Wenn $x$ wenig variiert, soll $f(x)$ auch wenig variieren.
##### Definition:
Eine Funktion $f:D\subset\mathbb{K}\to\mathbb{K}$ heißt _stetig_ in $x_0\in D$, wenn

$\forall\varepsilon>0\,\exists\delta=\delta(x_0,\varepsilon)>0:\,|x-x_0|\leq \delta\Rightarrow |f(x)-f(x_0)|\leq \varepsilon\quad\forall x\in D.$
Zu jeder gewünschten Genauigkeit $\varepsilon$ von $f(x_0)$ findet sich eine maximal erlaubte Abweichung von $x,$ nämlich $\delta$. Diese darf von $x_0$ abhängen.

##### Bemerkung:
1. $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/e6e200f5162e4c52f553aaa2d8cbe70c805ffde9/notebooks/assets/unstetig.svg","./assets/unstetig.svg"))
2. Auswertung von stetigen Funktion, zum Beispiel im Computer, sind "stabil" oder "robust".
"""

# ╔═╡ c79d2e6d-88fa-4e26-93ba-e05bd4a483f4
md"""
##### Satz:
Ist $f$ stetig bei $a$ gilt $\lim\limits_{x\to a} f(x) = f(\lim\limits_{x\to a}x)$ (und umgekehrt), dass heißt Grenzwert und Funktion können vertauscht werden.

##### Beweis:
Zu zeigen: Aus $(x_n)$ konvergiert zu $a$ folgt $(f(x_n))$ konvergiert zu $f(a)$, d.h.

$\forall\varepsilon\,\exists n_\varepsilon\in\mathbb{N}:\quad |f(x_n)-f(a)|\leq \varepsilon \quad n>n_\varepsilon.$
Wegen Stetigkeit existiert ein $\delta_\varepsilon$, so dass $|x-a\leq \delta_\varepsilon\Rightarrow |f(x)-f(a)|\leq\varepsilon$.
Wähle nun $n_\varepsilon\in\mathbb{N}$ so, dass $|x_n-a|\leq\delta_\varepsilon\quad \forall n>n_\varepsilon\quad$ (geht wegen Konvergenz von $(x_n)$).

Die Rückrichtung ist hier ohne Beweis.
"""

# ╔═╡ 2cbe1d61-6048-45c9-8c6d-719ff647d8a1
md"""
##### Beispiel:
1. Die Funktionen $x, x^2, \sin(x), e^x$ sind alle stetig.
2. Auf $\mathbb{R}\setminus\{0\}$ ist $\frac{1}{x}$ stetig und für $x>0$ ist $\ln(x)$ stetig.
3. Für $x\geq 0$ ist $f(x)=\sqrt{x}$ stetig.

   Für $x_0=0$ mit $\varepsilon$-$\delta$-Kriterium: Sei $\delta_\varepsilon:=\varepsilon^2$, dann $\forall\varepsilon\,\exists\delta=\delta_\varepsilon=\varepsilon^2:\, |x-x_0|\leq\delta_\varepsilon\Rightarrow|f(x)-f(x_0)|\leq \varepsilon$.\
   Tatsächlich $|x|\leq \varepsilon^2\Rightarrow|\sqrt{x}-\sqrt{x_0}=|\sqrt{x}|\leq \varepsilon$.

   Für $x_0>0$ zeigen wir $\lim\limits_{x\to x_0}f(x)=f(x_0):$

   Sei $(x_n)$ eine Folge mit $x_n>0,x_n\to x_0.$

   $|f(x_n)-f(x_0)|=\left|\sqrt{x_n}-\sqrt{x_0} \frac{\sqrt{x_n}+\sqrt{x_0}}{\sqrt{x_n}+\sqrt{x_0}}\right|=\left|\frac{x_n-x_0}{\sqrt{x_n}+\sqrt{x_0}}\right|\leq \frac{|x_n-x_0|}{\sqrt{x_0}}\to0.$
   Es folgt also $\sqrt{x_n}\to\sqrt{x_0}$

4.  $f(x)=\frac{x^2-4}{x-2}$ ist auf $\mathbb{R}{\setminus}\{2\}$ stetig.\
   Die _stetige Fortsetzung_ $g(x)=\begin{cases}\frac{x^2-4}{x-2}&x\neq2\\4&x=2\end{cases}$ ist stetig auf ganz $\mathbb{R}$.
5.  $f(x)=\frac{\sin(x)}{x}$ wird stetig fortgesetzt durch $g(x)=\begin{cases}\frac{\sin(x)}{x}&x\neq0\\1&x=0\end{cases}.$
6. Potenzreihen sind stetig in ihrem Definitionsbereich.
"""

# ╔═╡ 8cf5fc18-879e-4cd5-8cd4-e07dada54684
md"""
##### Definition:
Stimmt nur der rechtsseitige Grenzwert von $f$ bei $x_0$ mit $f(x_0)$ überein, heißt $f$ _rechtsseitig stetig_. Analog _linksseitig stetig_.
##### Beispiel:
1.  $f(x) = \begin{cases}-1&x<0,\\0&x=0,\\1&x>0.\end{cases}\quad$ "Signum" ist weder rechts- noch linksseitig stetig.


2.  $f(x)=\begin{cases}-1&x\leq0,\\1&x>0\end{cases}\quad$ ist linksseitig stetig.
##### Satz:
Seien $f$ und $g$ stetig bei $x_0$. Dann sind $\alpha f+\beta g \,($mit $\alpha,\beta\in\mathbb{R}), f\cdot g$ und $\frac{f}{g} \,(g(x_0)\neq 0)$ auch stetig bei $x_0$. Ist $f$ stetig bei $g(x_0)$ und $g$ stetig bei $x_0$, dann ist $f\circ g$ stetig bei $x_0$.

##### Beispiel:
1.  $f(x)=\frac{e^{1-\ln(x)^2}\arccos\left(\frac{1}{1+x^2}\right)}{\ln(2+\sin(1+e^x))}\quad$ ist stetig auf $\mathbb{R}^+$.\
   Den meisten Funktionen können wir Stetigkeit "ansehen".


2.  $f(x)=\begin{cases}1&x\in\mathbb{Q},\\0&x\notin\mathbb{Q}\end{cases}\quad$ ist für alle $x\in\mathbb{R}$ _unstetig_.

"""

# ╔═╡ fb5a6f17-fdda-4f8b-90df-0896f04e0311
md"""
### 2.3.4 Verfeinerte Stetigkeitsbegriffe

Betrachte für $x\in[0,1]$:

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/dd1c115d0715333c812da8cc6ac1a852324d0ff6/notebooks/assets/hyperbel.svg","./assets/hyperbel.svg"))
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/dd1c115d0715333c812da8cc6ac1a852324d0ff6/notebooks/assets/squareroot.svg","./assets/squareroot.svg"))
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/dd1c115d0715333c812da8cc6ac1a852324d0ff6/notebooks/assets/parabel.svg","./assets/parabel.svg"))

Was ist der Unterschied?

##### Definition:
1.  $f$ heißt _gleichmäßig stetig_, falls für alle $y\in D$ gilt:

$\forall\varepsilon>0\,\exists\delta=\delta(\varepsilon):\quad |x-y|\leq\delta\Rightarrow|f(x)-f(y)|\leq\varepsilon\quad\forall x \in D.$
2.  $f$ heißt _Lipschitz-stetig_, falls für alle $x,y\in D$ gilt:

$\exists L>0:\quad |f(x)-f(y)|\leq L|x-y|.$

3.  $f$ heißt _Kontraktion_, falls es Lipschitz-stetig mit $L<1$ ist.
"""

# ╔═╡ be62c9f6-cd2c-470e-af41-f03486f07a7b
md"""
##### Bemerkung:
Wir werden das Folgende sehen:\
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/dd1c115d0715333c812da8cc6ac1a852324d0ff6/notebooks/assets/stetigkeitsmenge.svg","./assets/stetigkeitsmenge.svg",:width=>300))

1. Lipschitz-Funktionen verlaufen überall in einem "Kegel" mit maximaler, minimaler Steigung $\pm L $, z.B. die Gerade $f(x)=ax$ ist Lipschitz:\
   $|f(x)-f(y) = |ax-ay|\leq |a||x-y|$ mit $L=|a|.$\
   Aber: $f(x) = \sqrt{x}$ mit $x\geq0$ ist _nicht_ Lipschitz.\
   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/82360ec40db458f640b617e1c7de3b633ed569dd/notebooks/assets/lipschitz.svg","./assets/lipschitz.svg"))


2.  $f(x)=\frac{1}{x}$ ist stetig, aber nicht gleichmäßig stetig, denn:\

   Stetigkeit: Gegeben eine Genauigkeit $\varepsilon$ mit $|f(x)-f(x_0)|\leq \varepsilon$, gesucht eine maximal erlaubte Abweichung $|x-x_0|\leq\delta$. Sei zur Einfachheit $0<x\leq x_0$.

    $\begin{align*}\left|\frac{1}{x}-\frac{1}{x_0}\right|=\frac{1}{x}-\frac{1}{x_0}\leq\varepsilon &\Leftrightarrow x\geq\frac{x_0}{\varepsilon x_0+1}\\ &\Leftrightarrow -x\leq\frac{-x_0}{\varepsilon x_0+1}\\&\Leftrightarrow x_0-x\leq x_0-\frac{x_0}{\varepsilon x_0 +1} \\&= x_0 \frac{\varepsilon x_0}{\varepsilon x_0 +1}=: \delta(\varepsilon,x_0)\end{align*}$

   Für gleichmäßige Stetigkeit auf $(0,1]$ müsste es ein minimales $\delta>0$ geben für alle $x_0\in (0,1].$ Problem: $\delta(\varepsilon,x_0)\to 0$ für $x_0\to0$.\

   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/66a1da4aef0a2a7763308a13a6ed72e9f3cb46c2/notebooks/assets/hyperbel_stetigkeit.svg","./assets/hyperbel_stetigkeit.svg"))
"""

# ╔═╡ c7555deb-f940-479b-a3cd-d3ced4213db6
md"""
##### Satz:
Eine stetige Funktion $f:[a,b]\to\mathbb{R}$ auf einem abgeschlossenem, beschränkten Intervall $[a,b]\subset\mathbb{R}$ ist gleichmäßig stetig.

##### Beweis:
Annahme: $f$ ist nicht gleichmäßig stetig, d.h. zu jedem $\delta>0$ gibt es ein $\varepsilon>0$ und Punkte $x,y$ mit $|x-y|\leq \delta$, aber $|f(x)-f(y)|>\varepsilon$. Wir konstruieren zwei Folgen $(x_n),(y_n)$ mit $|x_n-y_n|<\frac{1}{n}$ und $|f(x_n)-f(y_n)|>\varepsilon.$

Nach Bolzano-Weierstraß: $[a,b]$ beschränkt, d.h. $x_n\in[a,b]\Rightarrow (x_n)$ enthält eine konvergente Teilfolge. $(x_{n_k})_{n_k \in I\subset\mathbb{N}}$ mit $x_{n_k} \to x_0\in[a,b].$

Es folgt wegen $|x_{n_k}-y_{n_k}|<\frac{1}{n_k}\to0$ auch $y_{n_k}\to x_0$, also $\lim\limits_{k\to\infty}(f(x_{n_k})-f(y_{n_k})) \underset{f\text{ stetig}}{=} f(\lim\limits_{k\to\infty}x_{n_k})-f(\lim\limits_{k\to\infty}y_{n_k}) = f(x_0)-f(x_0)=0$, was zu einem Widerspruch führt.
"""

# ╔═╡ 3a0fe81e-2f5a-47f0-9f73-e6497290ed5d
md"""
##### Satz (ohne Beweis):
Jede Lipschitz-stetige Funktion ist gleichmäßig stetig.
"""

# ╔═╡ c7e9cffb-2fdd-4ca3-926b-da7a95b64b09
md"""
##### Satz (Zwischenwertsatz):
Sei $f$ auf $[a,b]$ stetig und $f(a)<0,f(b)>0$. Dann hat $f$ in $[a,b]$ mindestens eine Nullstelle.
##### Beweis:
Wir machen _Bisektion_ $a_0=a, b_0=b$. D.h. für $k=0,1,2,\dots$ iteriere mit $k$.

$t=\frac{a_k+b_k}{2} \Rightarrow \begin{cases}a_{k+1}=t,\, b_{k+1}=b_k&\text{ falls} f(t)<0\\a_{k+1}=a_k,\, b_{k+1}=t&\text{ falls} f(t)>0\end{cases}$
Es gilt $f(a_k)<0, f(b_k)>0\quad \forall k =0,1,2,\dots. (a_k)$ ist monoton steigend, $(b_k)$ ist monoton fallend, $a_k<b_k,\, |b_k-a_k|\overset{k\to\infty}{\to}0.$

Sei $\xi=\lim\limits_{k\to\infty}a_k=\lim\limits_{k\to\infty}b_k$. Behauptung: $f(\xi) = 0$.

Wäre $f(\xi)>0$, dann existiert $\delta>0,\,|x-\xi|\leq\delta\Rightarrow |f(x)-f(\xi)|\leq\varepsilon$ und zusätzlich $f>0$ in $\delta$-Umgebung von $\xi$. Aber $[\xi-\delta,\xi+\delta]$ muss ein $a_k$ enthalten, da $a_k\to\xi$ von unten. Widerspruch wegen $f(a_k)<0.$

##### Bemerkung:
1. Das Bisektionsverfahren wird tatsächlich oft numerisch benutzt.
2. Allgemein gilt: Ist $f$ stetig auf $[a,b]$, dann wird jeder Wert zwischen $f(a)$ und $f(b)$ angenommen.
3. Mit $f:B\to\mathbb{R}$ stetig und $B$ ein Intervall, folgt $\mathrm{Im}(B)$ auch ein Intervall.
"""
#TODO Skizzen

# ╔═╡ a44ddf76-a7f8-4e6f-9d26-47b85d593e20
md"""
## 2.4 Differentialrechnung
### 2.4.1 Grundbegriffe
Idee: Ableitung als _lineare Approximation_ (lässt sich später besser verallgemeinern). Wir wollen $f$ an der Stelle $x_0$ durch eine lineare Funktion $g(x)$ approximieren, d.h. $g(x_0)=f(x_0)$ und linear $\Rightarrow g(x) = a(x-x_0)+f(x_0)$ mit $a=?$

Neues Koordinatensystem mit

 $\Delta f(h) = f(x_0+h)-f(x_0),$

 $\Delta g(h) = g(x_0+h)-g(x_0)=ah.$

Es gilt $\Delta f(h) = ah+r(h),$ wobei $r(h)$ den Fehler bei der Approximation beschreibt, welcher klein sein soll. Am besten kleiner als $ah$, also $r(h) <\!\!< ah$ für kleine $h$, womit  $\frac{r(h)}{ah}<\!\!<1$, z.B. $\frac{r(h)}{ah}\approx0\quad$ für kleine $h.$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/66a1da4aef0a2a7763308a13a6ed72e9f3cb46c2/notebooks/assets/differenzierbarkeit.svg","./assets/differenzierbarkeit.svg",:width=>350))

Idee: $\lim\limits_{h\to0}\frac{r(h)}{ah}=0$, es reicht $\lim\limits_{h\to0}\frac{r(h)}{h}=0.$
Dies liefert $a$, d.h. die _beste_ lineare Approximation, denn: $\Delta f(h) = f(x_0+h)-f(x_0) = ah + r(h)$ nach $a$ auflösen liefert $a = \frac{f(x_0+h)-f(x_0)}{h}-\frac{r(h)}{h}$.

$\underbrace{\lim_{h\to0}a}_{=a} = \lim_{h\to0}\frac{f(x_0+h)-f(x_0)}{h}-\underbrace{\lim_{h\to0}\frac{r(h)}{h}}_{=0}.$
"""
#TODO Skizze 38

# ╔═╡ 414521f9-7c60-472d-a844-cfee979c5c9a
md"""
##### Definition:
Eine Funktion $f$ heißt _differenzierbar_ bei $x_0$, falls es eine Konstante $a$ gibt, so dass gilt

$f(x_0+h) = \underbrace{f(x_0) + ah}_{\text{ lin. Approximation}} + r(h)\quad\text{ mit } \lim_{h\to0}\frac{r(h)}{h}=0.$

 $a$ hängt von $f$ und $x_0$ ab und heißt _Ableitung_.

 $a=\lim\limits_{h\to0}\frac{f(x_0+h)-f(x_0)}{h}=:f'(x_0)$
 $= \lim\limits_{x\to x_0}\frac{f(x)-f(x_0)}{x-x_0}.$
"""

# ╔═╡ 26cc2470-dca2-4e18-94c8-6b2b9d6b1706
md"""
##### Bemerkung:

1.  $f'(x)$ wird auch $\frac{df}{dx}(x)$ geschrieben ("Differentialquotient")
2. Es gibt auch rechts-/linksseitige Ableitung $\lim\limits_{x\to x_0\pm}\frac{f(x)-f(x_0)}{x-x_0}$
3. Jede differenzierbare Funktion ist stetig
4. ($f$ mit "Knick" $\Rightarrow f'$ springt), d.h. unstetig

##### Beispiel:
0.  $f(x) = \mathrm{const.} \qquad f'(x_0)=0$
1.  $f(x)=ax \qquad f'(x_0) = \lim\limits_{x\to x_0} \frac{ax-ax_0}{x-x_0}=a$


2.  $\begin{align*}f(x) = x^2\qquad f'(x_0) &= \lim_{h\to0}\frac{(x_0+h)^2-x_0^2}{h}\\&=\lim_{h\to0}\frac{x_0^2+2hx_0+h^2-x_0^2}{h}\\&=\lim_{h\to0}(2x_0+h)=2x_0\end{align*}$


3.  $\begin{align*}f(x)=e^x\qquad f'(x_0) &= \lim_{h\to0}\frac{e^{x_0+h}-e^{x_0}}{h}\\&=\lim_{h\to0}e^{x_0}\frac{e^h-1}{h}\\&=e^{x_0}\lim_{h\to0}\frac{e^h-1}{h}=e^{x_0}\end{align*}$


4.  $f(x)=|x|\qquad \lim\limits_{h\to0}\frac{|x_0+h|-|x_0|}{h}=\begin{cases}\phantom{-}1&x_0>0,\\-1&x_0<0,\\\text{ex. nicht}&x_0=0.\end{cases}$

    $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/66a1da4aef0a2a7763308a13a6ed72e9f3cb46c2/notebooks/assets/betragsfunktion.svg","./assets/betragsfunktion.svg",:width=>350))

    Bei $x_0=0$ gibt es nur eine rechts-und linksseite Ableitung.
"""

# ╔═╡ 31c3216b-aca6-4c6b-bc61-f2455de9ac77
md"""
### 2.4.2 Rechenregeln für Differentiation

Für $f,g$ differenzierbar bei $x_0$ gilt
1.  $(\alpha f + \beta g)'(x_0) = \alpha f'(x_0) + \beta g'(x_0),\quad \alpha,\beta\in\mathbb{R}$
2.  $(f\cdot g)'(x_0) = f'(x_0)g(x_0)+f(x_0)g'(x_0),\quad$ "Produktregel"
3.  $\left(\frac{f}{g}\right)'(x_0) = \frac{f'(x_0)g(x_0)-f(x_0)g'(x_0)}{g(x_0)^2},\quad g(x_0)\neq0,$ "Quotientenregel"
4.  Falls $g$ differenzierbar bei $y_0=f(x_0)$: $(g\circ f)'(x_0) = \frac{d}{dx}g(f(x)) \big|_{x=x_0} = g'(f(x_0))f'(x_0),\quad$ "Kettenregel"
5.  Falls $f$ umkehrbar und in einer Umgebung von $x_0$ differenzierbar ist: $(f^{-1})'(y_0)=\frac{1}{f'(f^{-1}(y_0))},\quad$ mit $y_0=f(x_0)$, "Umkehrregel"

##### Beweis:
für 4: $\frac{g(f(x_0+h)) - g(f(x_0))}{h}=\frac{g(f(x_0+h))-g(f(x_0))}{f(x_0+h)-f(x_0)}\,\frac{f(x_0+h)-f(x_0)}{h} \overset{h\to0}{\to} g'(f(x_0))f'(x_0)$

für 5: $f^{-1}(f(x_0))=x_0 \Rightarrow (f^{-1})'(\underbrace{f(x_0)}_{y_0})\underbrace{f'(x_0)}_{=f^{-1}(y_0)}=1$
"""

# ╔═╡ 2fc93fad-76b0-480a-a636-6a913559b609
md"""
##### Beispiel:
1.  $g(x) = \ln(x) = \exp^{-1}(x)$

    $g'(x) = \underbrace{(\exp^{-1})}_{=f^{-1}}(x) = \frac{1}{\exp(\ln(x))} = \frac{1}{x} ,\quad$ also $\ln(x)'=\frac{1}{x}.$


2. Für $\alpha\in\mathbb{R}$ betrachten wir $f(x)=x^\alpha=e^{\ln(x^\alpha)}=e^{\alpha\ln(x)}.$

   Hier haben wir eine doppelte Verknüpfung $\begin{cases}a(x)=\ln(x),\\b(y)=\alpha\,y,\\c(z)=e^z.\end{cases}\quad \Rightarrow f(x) = c(b(a(x)))=e^{\alpha\ln(x)}$

    $f'(x)=c'(b(a(x)))\frac{d}{dx}b(a(x))=\underbrace{c'(b(a(x)))}_{e^z=e^{\alpha\ln(x)}}\underbrace{b'(a(x))}_{\alpha}\underbrace{a'(x)}_{\frac{1}{x}} = e^{\alpha\ln(x)}\alpha\frac{1}{x}$

    $\phantom{f'(x)}= \alpha x^\alpha\frac{1}{x} = \alpha x^{\alpha-1}.$


3.  $f(x) = \cos(x) = \frac{e^{ix}+e^{-ix}}{2}$

    $f'(x) = \frac{1}{2}(ie^{ix}+(-i)e^{-ix})=\underbrace{i}_{-\frac{1}{i}}\frac {e^{ix}-e^{-ix}}2 = -\sin(x)$

    Analog $\sin'(x) = \cos(x),\quad \sinh'(x) = \cosh(x),\text{ aber}\cosh'(x)=+\sinh(x).$


4.  $f(x) = \tan(x) = \frac{\sin(x)}{\cos(x)}$

    $f'(x) = \frac{\sin'(x)\cos(x)-\cos'(x)\sin(x)}{(\cos(x))^2}= \frac{\cos^2(x)+\sin^2(x)}{\cos^2(x)}=\frac{1}{\cos^2(x)}.$


5.  $f(x)=\arcsin(x),\quad f'(x) = \frac{1}{\sqrt{1-x^2}}\quad$ mit "Umkehr-Regel".

"""

# ╔═╡ beb04ead-d386-4d24-b787-70f8679f6125
md"""
##### Satz:
1.  $f'(x)=0\quad \forall x\in(a,b) \Leftrightarrow f$ ist konstant in $(a,b)$.
2.  $f'(x) \geq 0 \quad \forall x\in(a,b)\Leftrightarrow f$ ist monoton wachsend in $(a,b)$.
3. Analog für fallend, bzw. _streng_ monoton mit "<" oder ">".

##### Definition:
Die _n-te Ableitung_ einer Funktion $f$ im Punkt $x_0$ ist rekursiv definiert, d.h. es existiert der Grenzwert

$\lim_{h\to0}\frac{f^{(n-1)}(x_0+h)-f^{(n-1)}(x_0)}{h}=:f^{(n)}(x_0).$
Wir schreiben $f, f', f'', f''', f^{(iv)}, \dots, f^{(n)}.$ Existiert $f^{(k)}(x_0)$ für $k=1,2,\dots,n$ heißt $f$ _n-mal differenzierbar_ in $x_0$.

##### Definition:
Sei $I\subset \mathbb{R}$ ein Intervall. Die Menge

$C^n(I):=\{f:I\to\mathbb{R}|\,f^{(k)}\text{ stetig },\, k=0,1,\dots,n\}$
enthält die _n-mal stetig differenzierbaren_ Funktionen auf $I$. Ist $f^{(n)}$ stetig für beliebige $n$, so heißt $f$ _unendlich_ _oft_ _differenzierbar_ oder _glatt_, $f\in C^\infty(I).$
"""

# ╔═╡ 24975dda-9ce3-4d50-8004-50564309d2eb
md"""
##### Beispiel:
1.  $f(x)=e^x, \quad f\in C^\infty(\mathbb{R})$.
2. Für Polynome $p$ mit Grad $n$ gilt $p\in C^\infty(\mathbb{R})$, inbesondere $p^{(k)}=0$ für $k>n$.
3.  $f(x)=|x|, \quad f\in C^0(\mathbb{R})$, also nur stetig.
4.  $f(x)=|x|^3,\quad f\in C^2(\mathbb{R}),\quad f^{''}(x) = |x|.$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/8d2fa0d520b1743f00e86f0bc74b1a817a25c240/notebooks/assets/betrag_kubisch.svg","./assets/betrag_kubisch.svg", :width=>350))

##### Bemerkung:
 $\frac{d}{dx}:C^n(I)\to C^{n-1}(I),\quad f\mapsto\frac{d}{dx}(f)=f'\quad$ ist der sogenannte "Ableitungsoperator"
"""

# ╔═╡ 3ca46888-3700-47a0-868b-e66c97fd25b8
md"""
##### Definition:
Sei $f:I\to\mathbb{R}$ eine Funktion. Gilt für alle $x_0,x_1\in I$ und $\lambda\in[0,1]$

$f((1-\lambda)x_0+\lambda x_1)\leq (1-\lambda)f(x_0)+\lambda f(x_1)$

so heißt $f$ auf $I$ _konvex_.

##### Bemerkung:
1. Analog konkav für $\geq$ und _streng_ für < bzw. >.


2.  $\tilde{f}(\lambda) = f((1-\lambda)x_0+\lambda x_1) = f(x_0) + \lambda(x_1-x_0)$

    $g(\lambda) = (1-\lambda)f(x_0)+\lambda f(x_1) = f(x_0) + \lambda(f(x_1)-f(x_0)$

    $g(\lambda)$ entspricht dabei der Geraden zwischen $f(x_0)$ und $f(x_1)$. _Konvexe_ Funktionen liegen _unterhalb_ ihrer Sekanten (links-gekrümmt). 

    $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/8d2fa0d520b1743f00e86f0bc74b1a817a25c240/notebooks/assets/konvexitaet.svg","./assets/konvexitaet.svg"))
"""

# ╔═╡ dbe2e33f-91ff-4c47-bad3-cc6c8d4c9ad2
md"""
##### Satz:
Für $f\in C^2(I)$ gilt: $f$ konvex auf $I \Leftrightarrow f''(x)\geq 0,\quad \forall x\in I.$

##### Bemerkung:
Analog gilt das für konkave, streng konkave und streng konvexe Funktionen.

##### Beispiel:
1.  $f(x)=x^2,\quad f''(x)=2\Rightarrow f$ ist konvex.
2.  $f(x)=\sin(x)$ ist konkav auf $(2k\pi,(2k+1)\pi)$ für $k\in \mathbb{Z}.$

##### Bemerkung:
Jede Potenzreihe ist in ihrem Konvergenzgebiet, d.h. $|x|<\varrho$ (Konvergenzradius) $\infty$-oft differenzierbar, also $C^\infty$.
"""

# ╔═╡ b61d62c4-b6be-457c-b336-1b80956e7860
md"""
### 2.4.3 Kurvendiskussion

##### Definition:
Sei $f:(a,b) \to\mathbb{R}$ und $x_0\in(a,b)$ gegeben. Falls eine Umgebung von $x_0$ (z.B. $U=[x_0-\delta,x_0+\delta])$ existiert, sodass $f(x)\leq f(x_0),\quad \forall x\in U$, dann hat $f$ ein lokales _Maximum_ in $x_0$. Analog für _Minimum_. Beides heißt _Extremum_.

##### Satz:
Sei $f$ differenzierbar. Hat $f$ in $x_0$ ein lokales Extremum, so gilt $f'(x_0)=0$.

##### Beweis:
Zu zeigen: $\underbrace{f(x)\leq f(x_0)\quad\forall x\in U}_{\text{ lokales Extremum}}\Rightarrow f'(x_0)=0$. Für den Differenzen-Quotienten gilt:

 $\frac{\overbrace{f(x)-f(x_0)}^{\leq 0}}{x-x_0}\begin{cases}\geq0&\text{ für } x<x_0\\\leq0&\text{ für }x>x_0,\end{cases}\quad \text{d.h. } \lim\limits_{x\to x_0\pm}\frac{f(x)-f(x_0)}{x-x_0}\begin{cases}\leq0\\\geq0.\end{cases}$

Aber $f$ ist differenzierbar, also muss $\lim\limits_{x\to x_0}$ existieren $\Rightarrow f'(x_0)=0.$
"""

# ╔═╡ a5fc080e-d356-4290-960f-8c295aa714b7
md"""
##### Bemerkung:
 $f'(x_0)=0$ ist nur notwendig, nicht hinreichend für ein Extremum. Der Punkt $x_0$ heißt _kritischer Punkt_.

##### Satz:
Für $f\in C^2$ sei $f'(x_0)=0.$ Dann ist bei $x_0$
1. ein lokales Maximum, falls $f'$ bei $x_0$ fallend ist, d.h. $f''(x_0)<0 \quad$ (rechts gekrümmt).
2. Analog: Minimum
"""

# ╔═╡ f0c132db-3821-4557-9525-4c02d9370bf1
md"""
##### Bemerkung:
Ein Punkt, in dem die Krümmung wechselt, heißt _Wendepunkt_. Notwendig ist $f''(x_0)=0$, hinreichend ist $f''(x_0)=0$ und $f'''(x_0)\neq 0$.
"""

# ╔═╡ de17e260-42e3-4d67-a196-e5ca78aee6ff
WideCell(max_width=930, md"""##### Beispiel:
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/8d2fa0d520b1743f00e86f0bc74b1a817a25c240/notebooks/assets/kurvendiskussion.svg","./assets/kurvendiskussion.svg",:width=>300))
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/8d2fa0d520b1743f00e86f0bc74b1a817a25c240/notebooks/assets/kurvendiskussion_ableitung.svg","./assets/kurvendiskussion_ableitung.svg",:width=>300))
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/8d2fa0d520b1743f00e86f0bc74b1a817a25c240/notebooks/assets/kurvendiskussion_2ableitung.svg","./assets/kurvendiskussion_2ableitung.svg",:width=>300))
""")

# ╔═╡ 0750a5f7-e01c-4127-b12d-30dad617af36
md"""
### 2.4.4 Satz von de l'Hospital

Nützlich für Grenzwerte, z.B. $\lim\limits_{x\to0}\frac{\ln(\cos(x))}{\ln(\cos(2x))}=\vphantom{\frac00}''\frac00''$. Wir benötigen einige Vorarbeit:

##### Satz:
Sei $f:B\to\mathbb{R}$ stetig und $B$ abgeschlossen und beschränkt. Dann ex. $\max\limits_{x\in B}f(x)$ und $\min\limits_{x\in B}f(x).$

##### Bemerkung:
1. Eventuall am Rand, eventuell mehrdeutig 
2.  $B\subset \mathbb{R}$ abgeschlossen und beschränkt heißt $B$ _kompakt_, z.B. Intervalle $[a,b]$.
3. Für $f=\mathrm{id}$ sagt der Satz: "kompakte Teilmengen von $\mathbb{R}$ haben ein Maximum und Minimum":
"""

# ╔═╡ 2b396a1a-5922-4597-aa3f-6adf1c762b17
md"""
##### Satz (Allgemeiner Mittelwertsatz):

Seien $f,g$ Funktionen, stetig in $[a,b]$ und differenzierbar im Inneren $(a,b)$. Dann gibt es ein $\xi\in(a,b)$ mit $(f(b)-f(a))\,g'(\xi)=(g(b)-g(a))f'(\xi)$.
##### Beweis:
Betrachte $h:[a,b]\to\mathbb{R},\, h(x)=(f(b)-f(a))\,g(x)-(g(b)-g(a))\,f(x)$. Es gilt $h(a)=h(b)=f(b)g(a)-g(b)f(a)$, $h$ stetig und differenzierbar. Zu zeigen:

$\exists \xi \in (a,b): \, h'(\xi)=0.$

Fall 1: $h(x)=$ const $= h(a)=h(b) \Rightarrow h'(x)=0$

Fall 2: $h(x)$ variiert, z.B. es gibt ein $x$ mit $h(x) > h(a) = h(b)$. Wegen Stetigkeit wird ein Maximum angenommen und zwar im Inneren $\xi\in(a,b).$ Wegen Differenzierbarkeit gilt dort $h'(\xi)=0$.

Fall 3: Analog zu Fall 2 nimmt $h$ ein Minimum an.
"""

# ╔═╡ 9658f505-a331-4e4b-bac9-c894ef2e0476
md"""
##### Bemerkung:
1. Der klassische Mittelwertsatz entsteht für $g(x)=x$.

   $\exists\xi\in(a,b):\quad f(b)=f(a)+f'(\xi)(b-a),\, \text{ oder } \frac{f(b)-f(a)}{b-a}=f'(\xi).$

   Es gibt mindestens eine Stelle an der die Tangente parallel zur Sekante ist.
   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/8d2fa0d520b1743f00e86f0bc74b1a817a25c240/notebooks/assets/mittelwertsatz.svg","./assets/mittelwertsatz.svg", :width=> 350))
2. Für $g(x)=x$ und $f(a)=f(b)$ entsteht der Satz von Rolle:

   $\exists \xi\in(a,b):\quad f'(\xi)=0.$
   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/8d2fa0d520b1743f00e86f0bc74b1a817a25c240/notebooks/assets/sv_rolle.svg","./assets/sv_rolle.svg", :width=>350))

"""

# ╔═╡ 1f92a719-9af8-46b8-9214-1bd9a8904844
md"""
##### Satz (von de L'Hospital):
Seien $f,g$ differenzierbar und $\lim\limits_{x\to a} f(x)=0, \,\lim\limits_{x\to a} g(x)=0,\, a\in\mathbb{R}\cup\{\pm\infty\}.$ Dann gilt

$\lim_{x\to a}\frac{f(x)}{g(x)}=\lim_{x\to a} \frac{f'(x)}{g'(x)}\quad\text{ (falls existent)}$

##### Beweis:
Für $a<\infty, \,f$ und $g$ differenzierbar $\Rightarrow f$ und $g$ stetig, also $f(a)=0,\, g(a)=0.$

Für $x\neq a$ ist
 $\frac{f(x)}{g(x)}=\frac{f(a)-f(x)}{g(a)-g(x)}\underset{\text{MWS}}{=}\frac{f'(\xi)}{g'(\xi)}$

 $\xi$ hängt von $x$ ab! Wähle also $\xi_x$ mit $\lim\limits_{x\to a} \xi_x=a.$

 $\lim\limits_{x\to a}\frac{f(x)}{g(x)}=\lim\limits_{x\to a}\frac{f'(\xi_x)}{g'(\xi_x)}=\lim\limits_{x\to a} \frac{f'(x)}{g'(x)}.$
"""

# ╔═╡ f4c0a98b-07cf-478e-b9cb-eccc4c44a7bc
md"""
##### Beispiel:
1.  $\lim\limits_{x\to 0} \frac{\sin(x)}{x} = \lim\limits_{x\to 0} \frac{\cos(x)}{1} = \cos(0)=1.$


2.  $\lim\limits_{x\to 0} \frac{\ln(\cos(x))}{\ln(\cos(2x))} =\lim\limits_{x\to 0}\frac{\frac{1}{\cos(x)}(-\sin(x))}{\frac{1}{\cos(2x)}(-\sin(2x))\cdot 2}=\lim\limits_{x\to0}\frac{\tan(x)}{2\cdot \tan(2x)}$

    $\phantom{ \lim\limits_{x\to 0} \frac{\ln(\cos(x))}{\ln(\cos(2x))} }=\lim\limits_{x\to0}\frac{\frac{1}{\cos(x)^2}}{2\frac{1}{\cos^2(2x)}\cdot 2} = \lim\limits_{x\to0}\frac{\cos^2(2x)}{4\cos^2(x)} = \frac{1}{4}.$


3.  $\lim\limits_{x\to\frac{\pi}{2}} \left(x-\frac{\pi}{2}\right)\tan(x) = \lim\limits_{x\to\frac{\pi}{2}}\frac{x-\frac{\pi}{2}}{\frac{1}{\tan(x)}}$

    $= \lim_{x\to\frac{\pi}{2}}\frac{1}{\underbrace{-\frac{1}{\tan^2(x)}}_{=-\frac{\cos^2(x)}{\sin^2(x)}}\frac{1}{\cos^2(x)}} = \lim_{x\to\frac{\pi}{2}}(-\sin^2(x))=-1$


4.  $\lim\limits_{x\to\infty} (1+\frac{\alpha}{x})^x = \lim\limits_{x\to\infty} \exp(x\ln(1+\frac{\alpha}{x})) = \lim\limits_{x\to\infty}\exp\left(\frac{\ln(1+\frac{\alpha}{x})}{\frac{1}{x}}\right) = e^\alpha$

    mit $\lim\limits_{x\to\infty}\frac{\ln(1+\frac{\alpha}{x})}{\frac{1}{x}} = \lim\limits_{x\to\infty}\frac{\frac{1}{1+\frac{\alpha}{x}}\cdot(-\frac{\alpha}{x^2})}{-\frac{1}{x^2}} = \lim\limits_{x\to\infty}\frac{\alpha}{1+\frac{\alpha}{x}} = \alpha.$
"""

# ╔═╡ 96c6d8cc-b8d4-4819-bd0b-b34b3d5ce696
md"""
### 2.4.5 Taylor-Entwicklung

Wie berechnet sich eine Potenzreihe $\sum_{k=0}^\infty a_kx^k$ zu einer beliebigen Funktion $f$?\
Das hat etwas mit Approximation zu tun!

##### Beispiel:
Anstatt nur einer Geraden mit gleicher Steigung bei $x_0=0$ (lineare Approximation) wollen wir nun die gleiche Steigung und gleiche Krümmung.

Ansatz:

 $\begin{align*} p(x) &= a_0 + a_1x + a_2x^2\quad &p(0) &= f(0) \Rightarrow a_0 = f(0)&\\p'(x) &= a_1 + 2a_2x \quad &p'(0) &= f'(0) \Rightarrow a_1 = f'(0)&\\ p''(x) &= 2a_2 \quad &p''(0) &= f''(0) \Rightarrow a_2 = \frac{1}{2}f''(0)&\end{align*}$

 $\Rightarrow p(x) = f(0) + f'(0)x + \frac{1}{2}f''(0)x^2.$ Geht auch für $x_0$ beliebig.
"""

# ╔═╡ 022df025-f076-4551-b10c-735f8144c56d
md"""
##### Definition:
Für $f\in C^n(I)$ und $x_0\in I, \, n\in \mathbb{N}$ heißt

$T_n(x)=\sum_{k=0}^n\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k = f(x_0)+f'(x_0)(x-x_0)+\frac{1}{2}f''(x_0)(x-x_0)^2+\dots$

die Taylor-Entwicklung (oder Taylor-Polynom) $n$-ter Ordnung zu $f$ um den Punkt $x_0$.

##### Beispiel:
1.  $f(x)=e^x,\quad f^{(k)}(x)=e^x,\,x_0=0,\,f^{(k)}(0)=1$

    $\Rightarrow T_n(x)=\sum\limits_{k=0}^n\frac{1}{k!}x^k \quad$ (Für $n\to\infty$ ist dies die Exponentialreihe!)


2.  $f(x) = x^2-2x+3,\, x_0=1,\, f(1)=2,\, f'(1)=0,\, f''(1)=2$

    $\Rightarrow T_2(x)=\sum\limits_{k=0}^2\frac{f'(1)}{k!}(x-1)^k = 2 + 0(x-1)^1 + \frac{2}{2}(x-1)^2 = x^2-2x+3$


3.  $f(x)=\sin(x),\, x_0=0,\, f^{(k)}(0)\Rightarrow \{1,0,-1,0,1,\dots\}$

    $\Rightarrow T_5(x) = x-\frac{1}{6}x^3+\frac{1}{120}x^5$
"""

# ╔═╡ 703e6fb5-9dd6-47df-abde-3861a8039e61
begin
	function poly_deg5(x)
		return (x^5 + 3x^4 - 11x^3 - 27x^2 + 10x + 64)/20
	end
	function bsp_taylor2(x)
		return x^2 - 2x + 3
	end
	function nth_derivative(::typeof(cos), n, x)
		mod4 = n % 4
		if mod4 == 1
			result = -sin(x)
		elseif mod4 == 2
			result = -cos(x)
		elseif mod4 == 3
			result = sin(x)
		else
			result = cos(x)
		end
		return result
	end
	function nth_derivative(::typeof(sin), n, x)
		mod4 = n % 4
		if mod4 == 1
			result = cos(x)
		elseif mod4 == 2
			result = -sin(x)
		elseif mod4 == 3
			result = -cos(x)
		else
			result = sin(x)
		end
		return result
	end
	function nth_derivative(::typeof(exp), n, x)
		return exp(x)
	end
	function nth_derivative(::typeof(poly_deg5), n, x)
		if n == 0
			result = (x^5 + 3x^4 - 11x^3 - 27x^2 + 10x + 64)/20
		elseif n == 1
			result = (5x^4 + 12x^3 - 33x^2 - 54x + 10)/20
		elseif n == 2
			result = (20x^3 + 36x^2 - 66x - 54)/20
		elseif n == 3
			result = (60x^2 + 72x - 66)/20
		elseif n == 4
			result = (120x + 72)/20
		elseif n == 5
			result = 6*one(x)
		else
			result = zero(x)
		end
		return result
 	end
	function nth_derivative(::typeof(bsp_taylor2), n, x)
		if n == 0
			result = bsp_taylor2(x)
		elseif n == 1
			result = 2x - 2
		elseif n == 2
			result = 2
		else
			result = zero(x)
		end
		return result
	end
	nothing
end

# ╔═╡ c3779634-cf79-4b3b-b724-c2d6a7ed9e98
md"""
zu approximierende Funktion $(@bind selected_function Select([sin, cos, exp, poly_deg5, bsp_taylor2]))

wir betrachten ``x`` aus dem geschlossenen Intervall von $(@bind x_min Scrubbable(-20:0; default=-10)) bis $(@bind x_max Scrubbable(1:20; default=10))

wir betrachten ``y`` aus dem geschlossenen Intervall von $(@bind y_min Scrubbable(-10:0;default=-5)) bis $(@bind y_max Scrubbable(1:20;default=5))
"""

# ╔═╡ cc9f5089-7bba-4c2a-8163-914a572e4cdd
md"""
Polynomgrad: $\quad$
$(@bind n PlutoUI.Slider(0:20, default=1, show_value=true))

Approximationspunkt $x_0$: $\quad$ $(@bind x0 PlutoUI.Slider(x_min:0.05:x_max, default=0.0, show_value=true))
"""

# ╔═╡ ad561de0-a2ad-4030-8543-ba5e253f3e71
let
	"""
    function taylor_polynomial(f, n, x0, x)

	Evaluate `n`-th Taylor polynomial for function `f` around the evaluation point `x0` at the position `x`. Uses `nth_derivative(f, i, x0)` to evaluate the i-th derivative 	of `f` at `x0`, thus a corresponding method must exist.
	"""
	function taylor_polynomial(f, n, x0, x)
		result = nth_derivative(f, 0, x0)
		for i in 1:n
			result += nth_derivative(f, i, x0) * (x - x0)^i / factorial(i)
		end
		return result
	end
	
	# Plot canvas and set some default options
	f = Figure(size=(600,400))
	ax = Axis(f[1,1], aspect=1)
	xlims!(x_min,x_max)
	ylims!(y_min,y_max)

	# Plot exact function
	xvalues = range(x_min, x_max, 1001)
	#label_exact = L"%$(nameof(selected_function))$\,(x)$"
    lines!(xvalues, selected_function.(xvalues), color=indigo50)

	# Plot Taylor polynomial
	taylor_values = taylor_polynomial.(
		Ref(selected_function),
		Ref(n),
		Ref(x0),
		xvalues)
	taylor_values_limited = clamp.(taylor_values, y_min-1, y_max+1)
	# taylor_values_limited = clamp.(taylor_values, -Inf, Inf)
    lines!(xvalues, taylor_values_limited, label=L"T_{%$n}(x)", color=gold20)

	# Plot marker at x0
	scatter!([x0], [selected_function(x0)], label=L"x_0", markersize=10, color=magenta50)
	f
end

# ╔═╡ 8223202c-a921-4909-add3-9c338004538b
md"""
##### Bemerkung:
1. Jedes Polynom $n$-ten Grades ist identisch zu seinem Taylorpolynom $T_n$.
2. Wir können einen "Taylor-Operator" definieren.
   Sei dazu $P_n=\{f:\mathbb{R}\to\mathbb{R}|\, f$ Polynom n-ten Grades$\}:$\
    $j_{x_0}^n:C^n(I)\to P_n,\, f\mapsto j_{x_0}^n(f)=\sum_{k=0}^n\frac{f^{(k)}(x_0)}{k!}(\cdot \,- x_0)^k.$

   Was ist der Fehler $|f(x)-j_{x_0}^n(f)(x)|$?

##### Satz von Taylor:
Sei $f\in C^n([x_0,x])$ und $f^{(n+1)}$ stetig in $(x_0,x).$ Dann existiert ein $\xi\in(x_0,x)$, so dass

$f(x)-\underbrace{\sum_{k=0}^n\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k}_{T_n(x)} = \underbrace{\frac{f^{(n+1)}(\xi)}{(n+1)!}(x-x_0)^{n+1}}_{\text{Fehler } r_n(x), \text{ "Lagrange-Restglied"}}$

##### Bemerkung:

Für $n=0$ ist das der Mittelwertsatz: $f(x)-f(x_0) = f'(\xi)(x-x_0)$(!)
"""

# ╔═╡ 8cd3a268-d8c8-45f8-87a1-429376013887
md"""
##### Beweis:
Wir definieren $\varrho$ durch $f(x)-T_n(x)=r_n(x)=\frac{(x-x_0)^{n+1}}{(n+1)!} \varrho$.\
Zu zeigen ist $\varrho=f^{(n+1)}(\xi)$ mit $\xi\in(x_0,x)$.

"Geniestreich": Definiere $g(t) = f(x) - \sum\limits_{k=0}^n\frac{f^{(k)}(t)}{k!}(x-t)^k-\frac{(x-t)^{n+1}}{(n+1)!}\varrho.$

Es gilt $g(x)=f(x)-f(x)-0=0, \, g(x_0) = f(x) -T_n(x)-\frac{(x-x_0)^{n+1}}{(n+1)!}\varrho=0$ und

$\begin{align*}g'(t)&=-\sum_{k=0}^n \frac{f^{(k+1)}(t)}{k!}(x-t)^k + \sum_{k=1}^n\frac{f^{(k)}(t)}{(k-1)!}(x-t)^{k-1}+\frac{(x-t)^n}{n!}\varrho\\&= -\frac{f^{(n+1)}(t)}{n!}(x-t)^n+\frac{(x-t)^n}{n!}\varrho.\end{align*}$

Mit Satz von Rolle (Mittelwertsatz) können wir folgern, dass $g(x)=g(x_0)=0\Rightarrow \exists \xi\in(x,x_0):\, g'(\xi)=0$, also $\varrho=f^{(n+1)}(\xi).$
"""

# ╔═╡ ef93403f-26b6-4176-a051-ae76a1eb8b43

md"""
##### Beispiel:
 $f(x) = \sin(x).$ Es gilt $r_5(x)= f(x)-T_5(x) = \frac{f^{(n)}(\xi)}{6!}x^6 = \frac{-x^6}{720}\sin(\xi).$

 $T_5(x)=x-\frac{1}{6}x^3+\frac{1}{120}x^5\quad$ mit $\xi\in(0,x).$

 $|r_5(x)|=\frac{1}{720}|x^6\sin(\xi)|\leq \frac{1}{720}|x^6|=\begin{cases}\approx 10^{-3}&x=1\\\approx1&x=3.\end{cases}$

Die Abschätzung ist dabei sehr konservativ, der tatsächlicher Fehler ist $\begin{cases}\approx2\cdot 10^{-4}&x=1\\\approx0.4&x=3.\end{cases}$

Für $f\in C^\infty(I)$ dürfen wir in der Taylorentwicklung $n\to\infty$ schreiben.
"""

# ╔═╡ c2ce741c-d0f0-413a-99c5-4b149e702ea3
md"""
##### Definition:
Für $f\in C^\infty(I)$ heißt $\sum\limits_{k=0}^\infty\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k$ Taylor-Reihe.

##### Bemerkung:
Die Reihe konvergiert nur, wenn $\lim\limits_{n\to\infty}|r_n(x)|=0.$

##### Satz:

Falls ein $c>0$ existiert mit $\left|\frac{f^{(n+1)}(x)}{(n+1)!}\right|\leq c^{n+1}, \quad \forall x: |c(x-x_0)|<1$, dann konvergiert die Taylor-Reihe mit Konvergenzradius $|x-x_0|<\frac{1}{c}$.

##### Beweis:
 $|r_n(x)|=\left|\frac{f^{(n+1)}(\xi)}{(n+1)!}(x-x_0)^{n+1}\right|\leq |\underbrace{\phi(x-x_0)}_{<1}|^{n+1}\overset{n\to\infty}{\to}0.$
"""

# ╔═╡ 5f815d22-80a3-48a8-acbc-04c5ebd736dc
md"""
##### Beispiel:
1.  $f(x) = \ln(1+x),\quad x_0=0$

    $f^{(k)}(x)=(-1)^{k-1}\frac{(k-1)!}{(1+x)^k},\quad$ also $f^{(k)}(0)=(-1)^{k-1}(k-1)!$

    $T_{\infty}(x)=\sum_{k=0}^\infty(-1)^{k-1}\frac{(k-1)!}{k!}x^k=\sum_{k=0}^\infty\frac{(-1)^{k-1}}{k}x^k$

    $\left|\frac{f^{(k)}(x)}{k!}\right|=\frac{1}{k}\left|\frac{1}{(1+x)}\right|^k\leq \left|\frac{1}{(1+x)}\right|^k \overset{?}{\leq}\phi^k$

    $\left|\frac{1}{1+x}\right|\leq \phi,\quad\forall x$ mit $|x|<\frac{1}{\phi}?$

    $\Rightarrow$ Konvergiert für $|x|<1.$

2. $f(x) = \begin{cases}e^{-\frac{1}{x^2}}&x\neq0\\0&x=0\end{cases},\quad f'(x)=\begin{cases}\frac{2}{x^3}e^{-\frac{1}{x^2}}&x\neq0\\0&x=0\end{cases}$

   Es lässt sich zeigen, dass $f\in C^\infty(\mathbb{R}),\, f^{(k)}(0)=0\,\forall k\in\mathbb{N}\Rightarrow T_\infty(x)\equiv 0$ (hat also (fast) nichts mit $f(x)$ zu tun).
"""

# ╔═╡ 8a9b9e48-28b6-49bf-8b9c-916ec198d121
md"""
## 2.5 Integration
### 2.5.1 Grundbegriffe

Frage: Was ist die Fläche zwischen $y=f(x)$ und der $x$-Achse für $a\leq x\leq b?$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/f4f5c0daebef80c7c81d5a951b0a20bc102b8af0/notebooks/assets/integral.svg","./assets/integral.svg"))

Idee: Approximation durch Rechtecke:
1. Wähle eine Zerlegung $Z=(x_0,x_1,\dots,x_n)$ von $[a,b]$ mit $a=x_0<x_1<x_2<\dots<x_n=b\quad$ ($n$ Teilintervalle $[x_{i-1},x_i]$)
2. Wähle in jdeem Teilintervall $I$ eine Zwischenstelle $\xi_i\in[x_{i-1},x_i],\, i=1,\dots,n$
3.  $A\approx \sum\limits_{i=1}^n \underbrace{f(\xi_i)(x_i-x_{i-1})}_{\text{Rechteckinhalt}}$.

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/f4f5c0daebef80c7c81d5a951b0a20bc102b8af0/notebooks/assets/integral_teilintervalle.svg","./assets/integral_teilintervalle.svg"))


Manche $\xi_i$ sind ausgezeichnet. $O(f,Z)$ ist die Obersumme, $U(f,Z)$ ist die Untersumme und die eingezeichneten Balken nimmt den Funktionswert in der Mitte des Intervalls als Höhe des Rechtecks.
"""

# ╔═╡ 725e22e0-6e67-4fbb-8225-d3aa0ff32d5a
md"""
##### Definition:
1. Wähle $\xi_i\in[x_{i-1},x_i]$ so, dass $f(\xi_i)=\underset{[x_{i-1},x_i]}{\min}f(x)$, dann heißt $U(f,z)=\sum_{i=1}^nf(\xi_i)(x_i-x_{i-1})$ _Untersumme_.
2. Analog heißt für $f(\xi_i)=\underset{[x_{i-1},x_i]}{\max}f(x)$ $O(f,z)$ _Obersumme_.

Offenbar gilt für $Z_2$ feiner als $Z_1$ immer $U(f,Z_2) \geq U(f,Z_1)$ und $O(f,Z_2)\leq O(f,Z_1).$ Außerdem ist $U(f,Z) \leq O(f,Z).$
##### Definition:
Sei $f:[a,b]\to\mathbb{R}$ beschränkt. Sei $\mathcal{Z}$ die Menge _aller_ möglichen Zerlegungen $Z$ von $[a,b].$
1. Der Wert $O(f) = \inf\{O(f,z)|\,Z\in\mathcal{Z}\}$ heißt _Oberintegral_
2. Der Wert $U(f)=\sup\{U(f,z)|\,Z\in\mathcal{Z}\}$ heißt _Unterintegral_.
3.  $f$ heißt _Riemann-integrierbar_, falls $O(f)=U(f)$. Wir schreiben $\int_a^bf(x)dx=O(f)=U(f)$.
"""

# ╔═╡ 942c21fe-8b95-432f-83d9-17ccd38c8067
md"""
Zeige Obersumme: $(@bind show_upper CheckBox(default=true)) |
Zeige Untersumme: $(@bind show_lower CheckBox(default=true)) |
Zeige exaktes Integral: $(@bind show_exact CheckBox(default=true))
"""

# ╔═╡ 436b3889-a170-4bcb-91e8-e83970d7bbcd
md"""
Wir betrachten ``x`` aus dem geschlossenen Intervall von $(@bind int_x_min Scrubbable(-20:0, default=-10)) bis $(@bind int_x_max Scrubbable(1:20, default=10)).\
Wir betrachten ``y`` aus dem geschlossenen Intervall von $(@bind int_y_min Scrubbable(-10:0, default=-5)) bis $(@bind int_y_max Scrubbable(1:20, default=5)).
"""

# ╔═╡ c15de1c9-56e5-400b-90b1-7f821b11a8b6
md"""
Integrationsbereich ist das geschlossene Intervall von ``a`` $(@bind interval_a Scrubbable(int_x_min:0.1:int_x_max, default=max(-5,int_x_min))) bis ``b`` $(@bind interval_b Scrubbable(int_x_min:0.1:int_x_max, default=min(5,int_x_max))) in $(@bind n_intervals Scrubbable(1:100, default=4)) Teilintervallen.

zu integrierende Funktion $(@bind int_selected_function Select([sin, cos, exp, poly_deg5])).

"""

# ╔═╡ d078dfa1-07ef-485d-ba7e-d166d0075740
begin
	"""
    antiderivative(f, x)

	Evaluate the antiderivative of the function `f` at position `x` with a constant of integration assumed to be zero. This function is used to compute the integral inside the `integrate` function. To support more functions, add a new method that dispatches on the function type.
	"""
	function antiderivative(f, x) end
	antiderivative(::typeof(cos), x) = sin(x)
	antiderivative(::typeof(sin), x) = -cos(x)
	antiderivative(::typeof(exp), x) = exp(x)
	function antiderivative(::typeof(poly_deg5), x)
		result = (x^6/6 + 3x^5/5 - 11x^4/4 - 27x^3/3 + 10x^2/2 + 64x)/20
		return result
	end
	"""
    function integrate(f, a, b)

	Compute the integral of function `f` in the interval ``[a, b]``. Uses `antiderivative(f, x)` to evaluate the antiderivative of `f` at `a` and `b`, thus a 	corresponding method must exist.
	"""
	function integrate(f, a, b)
		result = antiderivative(f, b) - antiderivative(f, a)
		return result
	end
	nothing
end

# ╔═╡ 8d9277b4-b3b4-4f61-baf8-62db58b6caa4
begin
	# Compute Riemann sum
	f = Figure(size=(600,400))
	ax = Axis(f[1,1], aspect=1)
	xlims!(int_x_min,int_x_max)
	ylims!(int_y_min,int_y_max)
	
	n_bars = n_intervals
	bar_width = (interval_b - interval_a)/n_bars
	if n_bars == 1
		positions = [(interval_a + interval_b)/2]
	else
		positions = range(interval_a + bar_width/2, interval_b - bar_width/2, n_bars)
	end

	# Compute lower and upper sum
	n_subintervals = floor(Int, 1000 / n_intervals)
	n_subpositions = n_intervals * n_subintervals + 1
	subpositions = LinRange(interval_a, interval_b, n_subpositions)
	lowervalues = similar(positions)
	uppervalues = similar(positions)
	for i in 1:n_bars
		@views sp = subpositions[((i-1)*n_subintervals+1):(i*n_subintervals+1)]
		lowervalues[i] = minimum(int_selected_function.(sp))
		uppervalues[i] = maximum(int_selected_function.(sp))
	end
	lower_sum = sum(lowervalues)*bar_width
	upper_sum = sum(uppervalues)*bar_width
	
	# Compute "exact" integral
	integration_result = integrate(int_selected_function, interval_a, interval_b)
	# Plot exact function
	xvalues = range(int_x_min, int_x_max, 1001)
	
	if show_upper
		barplot!(positions, uppervalues; color=magenta50, width=bar_width, gap=0.0)
	end
	if show_lower
		barplot!(positions, lowervalues; color=gold20, width=bar_width, gap=0.0)
	end
	if show_exact
		barplot!(xvalues, int_selected_function.(xvalues); color=indigo50, alpha=0.5, gap=0.0)
	end
    lines!(xvalues, int_selected_function.(xvalues), color=indigo50)
	vlines!([interval_a,interval_b], color=:black)
	f
end

# ╔═╡ 5d3652b8-1687-41f3-a96d-e1c4a63a9fd9
md"""
| Integration method | Value |
|:-- | --: |
| Upper sum  | $(round(upper_sum, digits=2)) |
| Exact | $(round(integration_result, digits=2)) |
| Lower sum  | $(round(lower_sum, digits=2)) |
"""

# ╔═╡ 81e04c16-4fd5-4225-be72-a0086d729ea0
md"""
##### Bemerkung:
1. Es gibt eine Verallgemeinerung, das sogenannte "Lebesgue-Integral".
2. Es ist auch möglich über Folgen von Zerlegungen $Z_n$ mit $\lim\limits_{n\to\infty}$ "Feinheit von $Z_n$" = 0 zu definieren.
3. Nicht jede Funktion ist Riemann-integrierbar, z.B. $f(x) = \begin{cases}1&x\in\mathbb{Q}\\0&x\notin\mathbb{Q}\end{cases}\quad$ auf $[0,1].$
    $O(f)=1$, $U(f)=0$.

Welche Funktionen sind Riemann-integrierbar?

##### Hilfssatz:
Eine beschränkte Funktion $f$ ist Riemann-integrierbar auf $[a,b]$ genau dann, wenn

$\forall\varepsilon\,\exists Z_\varepsilon\in\mathcal{Z}:\quad O(f,Z_\varepsilon)-U(f,Z_\varepsilon)<\varepsilon.$

##### Beweis:
Wir beginnen mit der Rückrichtung: Es gilt also $O(f,Z_\varepsilon)-U(f,Z_\varepsilon)<\varepsilon$, zu zeigen ist $O(f) = U(f)$ bzw. $O(f)-U(f) < \varepsilon$ für beliebige $\varepsilon>0$. Was gilt, da $O(f) - U(f) \leq O(f,Z_\varepsilon)-U(f,Z_\varepsilon)<\varepsilon$, da $O(f)$ kleinste Obersumme.

Für die Hinrichtung gilt $O(f)=U(f)$, d.h. $\exists \,Z_\varepsilon:\,O(f,Z_\varepsilon)<O(f)+\frac{\varepsilon}{2}$ und $U(f,Z_\varepsilon)>U(f)-\frac{\varepsilon}{2}$ für beliebiges $\varepsilon > 0.$

 $\Rightarrow O(f,Z_\varepsilon)-U(f,Z_\varepsilon)=(O(f,Z_\varepsilon)-O(f))-(U(f,Z_\varepsilon)-O(f))< \frac{\varepsilon}{2} + \frac{\varepsilon}{2}=\varepsilon.$
"""

# ╔═╡ 8cd56a50-51bc-43aa-80de-6c5f74c152e8
md"""
##### Satz:
Sei $f$ auf $[a,b]$ stetig. Dann ist $f$ Riemann-integrierbar.

##### Beweis:
Ansatz: Wir wollen zeigen, dass $\forall\tilde{\varepsilon}>0\,\exists Z_\varepsilon$ mit

 $O(f,Z_\varepsilon)=\sum\limits_{i=1}^n\underbrace{\underset{[x_{i-1},x_i]}{\max}f(\xi)}_{=:M_i}(x_i,x_{i-1}),$

 $U(f,Z_\varepsilon)=\sum\limits_{i=1}^n\underbrace{\underset{[x_{i-1},x_i]}{\min}f(\xi)}_{=:m_i}(x_i-x_{i-1})$ und $O(f,Z_\varepsilon)-U(f,Z_\varepsilon) = \sum\limits_{i=1}^n(M_i-m_i)(x_i-x_{i-1}))<\tilde{\varepsilon}.$

Idee: Wir müssen also $M_i-m_i$ "kontrollieren".

Stetigkeit auf $[a,b] \Rightarrow$ gleichmäßig stetig, also

$\forall\varepsilon>0\,\exists\delta_\varepsilon>0:\quad |f(x)-f(y)|<\varepsilon = \frac{\tilde{\varepsilon}}{b-a}\quad \text{ für }|x-y|<\delta_\varepsilon.$
Sei $Z_\varepsilon$ eine Zerlegung mit $x_i-x_{i-1}<\delta_\varepsilon,\quad \forall i=1,\dots,n$.

Dann variiert $f$ in $[x_{i-1},x_i]$ maximal um $\varepsilon=\frac{\tilde{\varepsilon}}{b-a}$ für $|x-y|<\delta_\varepsilon$.\
Insbesondere $\sum_{i=1}^n\underbrace{(M_i-m_i)}_{<\frac{\tilde{\varepsilon}}{b-a}}(x_i-x_{i-1})<\frac{\tilde{\varepsilon}}{b-a}\underbrace{\sum_{i=1}^n(x_i-x_{i-1})}_{=b-a} = \tilde{\varepsilon}$
"""

# ╔═╡ 341cd2aa-549d-4a74-9f3a-79209008f533
md"""
##### Bemerkung:
Präzise gilt $f$ ist Riemann-integrierbar, falls es endlich viele Unstetigkeiten hat (oder maximal abzählbar unendlich viele). Wir sprechen dabei von "stückweise stetig".

Für stetige $f$ dürfen wir also eine Zerlegung wählen und per Grenzwert das Integral ausrechenen.

##### Beispiel:
 $f(x)=x^2\quad$ auf $[0,b].$

Wähle $x_i=i\frac{b}{n}$ (äquidistant)$,\,i=0,1,\dots,n$.

 $\begin{align*}O(f,Z_n)&=\sum_{i=1}^nf(x_i)(x_i-x_{i-1})=\sum_{i=1}^n\left(i\frac{b}{n}\right)^2\frac{b}{n}\\&=(\frac{b}{n})^3\underbrace{\sum_{i=1}^n i^2}_{=\frac{n(n+1)(2n+1)}{6}} = b^3\frac{n(n+1)(2n+1)}{6n^3}=b^3\frac{(1+\frac{1}{n})(2+\frac{1}{n})}{6}\\\lim_{n\to\infty} O(f,Z_n) &= \frac{1}{3}b^3\Rightarrow \int_0^b x^2\,dx = \frac{1}{3}b^3.\end{align*}$
"""

# ╔═╡ 5eef606d-d1e1-4977-b0a0-fcb3a860cf31
md"""
### 2.5.2 Rechenregeln für Integrale

Seien $f$ und $g$ Riemann-integrierbar auf $I=[a,b]$. Dann gilt
1.  $\int_a^bf(x)\,dx=\int_a^cf(x)\,dx+\int_c^bf(x)\,dx,\quad c\in (a,b).$


2.  $\int_a^b(\alpha f(x) + \beta g(x))\,dx = \alpha\int_a^bf(x)\,dx + \beta\int_a^bg(x)\,dx.$


3.  $f(x)\leq g(x)$ auf $[a,b] \Rightarrow \int_a^bf(x)\,dx \leq \int_a^bg(x)\,dx.$


4.  $\left|\int_a^bf(x)\,dx\right|\leq \int_a^b|f(x)|\,dx\leq \lVert f \rVert_\infty \cdot (b-a)\quad$ mit $\lVert f\rVert_\infty = \underset{x\in I}{\max}|f(x)|.$

5.  $\text{ Sei } g\geq 0,\, m\leq f(x)\leq M:\, m\int_a^bg(x)\,dx\leq \int_a^bf(x)g(x)\,dx\leq M\int_a^bg(x)\,dx.$

##### Definition:
Sei $B=[a,b]\subset\mathbb{R}$. Dann heißt die Funktion $\lVert\cdot\rVert_\infty:C(B)\to\mathbb{R}$ mit $\lVert f\rVert_\infty:=\underset{x\in B}{\max}|f(x)|$ die _Maximumsnorm_.

##### Bemerkung:
1.  $\int_a^af(x)\,dx = 0\quad$ und $\int_a^bf(x)\,dx = - \int_b^af(x)\,dx.$
2. Regel 1 von oben bleibt gültig für beliebige $c\in\mathbb{R}$, falls $f$ Riemann-integrierbar auf $\mathbb{R}$ ist.
3.  $\int_a^bf(x)\,dx = \int_a^bf(t)\,dt.$
"""

# ╔═╡ 340b86f9-6234-4847-a97e-fa21bd03bcca
md"""
##### Satz:
Sei $f:[a,b]\to\mathbb{R}$ stetig. Dann existiert ein $\xi\in(a,b)$ mit $\int_a^bf(x)\,dx= f(\xi)(b-a)$.

##### Beweis:
Zu zeigen: $\exists \xi\in(a,b)$ mit $\mu=f(\xi)$ für den Mittelwert $\frac{1}{b-a}\int_a^bf(x)\,dx=\mu.$

Es existiert ein Maximum/Minimum, da $f$ stetig ist, seien $m\leq f(x)\leq M$.

Mit $g\equiv1$ folgt $m\underbrace{\int_a^bg(x)\,dx}_{=b-a}\leq\int_a^bf(x)g(x)\,dx\leq M\underbrace{\int_a^bg(x)\,dx}_{=b-a}$ und damit $m\leq \mu\leq M$.

Nach Zwischenwertsatz nimmt $f$ jeden Wert zwischen $m$ und $M$ an, also auch $\mu$. $\xi$ liegt im Inneren.

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/integral_mws.svg","./assets/integral_mws.svg"))
"""

# ╔═╡ e8a0fc4b-757c-4b0c-be50-36ce81cb56a0
md"""
Wie lässt sich ein Integral ohne Ober-/Untersumme berechnen?
##### Satz (Hauptsatz der Differential- und Integralrechnung):
1. Sei $f:[a,b]\to\mathbb{R}$ stetig, $x,x_0\in[a,b]$ und $F(x):=\int_{x_0}^xf(t)\,dt$.\
   Dann ist $F$ differenzierbar und es gilt

   $F'(x) = \frac{d}{dx}\int_{x_0}^xf(t)\,dt = f(x)\quad\quad x\in[a,b]$

2. Sei $F:[a,b]\to\mathbb{R}$ und $F\in C^1([a,b])$ mit $F'(x)=f(x)$ für $x\in[a,b]$. Dann ist

   $\int_a^bf(x)\,dx = F(x)\bigg|_a^b:=F(b)-F(a).$

##### Beweis:

Den ersten Teil beweisen wir mittels Differenzen-Quotient:

$F(x+h)-F(x) = \int_{x_0}^{x+h}f(t)\,dt-\int_{x_0}^xf(t)\,dt = \int_x^{x+h}f(t)\,dt = f(\xi_h)h$
mit $\xi_h\in[x,x+h].$ Es gilt $\lim\limits_{h\to0}\xi_h=x$.

Also $\lim\limits_{h\to0}\frac{F(x+h)-F(x)}{h} = \lim\limits_{h\to0}f(\xi_h)=f(x)$.

Für den zweiten Teil der Aussage definiere $G(x):=\int_a^xf(t)\,dt$ mit $G(a)=0,\,G(b)\overset{*}{=}\int_a^bf(t)\,dt$ und $G'(x)=f(x).$
Also $F'(x)-G'(x)=(F-G)'(x)=0$

 $\Rightarrow F-G= $ const $\quad (\text{z.B. } F(a)-G(a) = F(b)-G(b))$\
$\Rightarrow \underbrace{\int_a^bf(t)\,dt=G(b)}_{*}-\underbrace{G(a)}_{=0} = F(b)-F(a).$
"""

# ╔═╡ 3cbf73dc-48fe-4fe4-8cd0-f89b819d4a73
md"""
##### Bemerkung:
1.  $F\in C$ mit $F'=f$ heißt _Stammfunktion_ von $f$ oder das _unbestimmte Integral_ $\int f(x)\,dx$.
2. Stammfunktionen sind nur bis auf eine Konstante bestimmt. Das heißt $F(x)$ Stammfunktion $\Rightarrow \tilde{F}(x) = F(X)+c,\quad c\in\mathbb{R}.$

Merke: Differenzieren ist Arbeit. Integrieren ist Kunst!
"""


# ╔═╡ e180527b-3f8d-41b2-8f06-d1eb0484eb48
md"""
##### Beispiel
Einige Standard-Stammfunktionen:
1.  $\displaystyle \int x^\alpha\,dx = \frac{1}{\alpha+1}x^{\alpha+1}+c\quad \alpha \neq -1$
2.  $\displaystyle \int \frac{1}{x}\,dx=\ln(|x|)+c$
3.  $\displaystyle \int e^x\,dx=e^x+c$
4.  $\displaystyle \int\sin(x)\,dx = -\cos(x)+c$
5.  $\displaystyle \int\cos(x)\,dx=\sin(x)+c$
6.  $\displaystyle \int\frac{1}{1+x^2}\,dx=\arctan(x)+c$
7.  $\displaystyle \int\frac{1}{\sqrt{1-x^2}}\,dx=\arcsin(x)+c$
"""

# ╔═╡ bb35c873-4bab-4d15-9d19-c75618215d2c
md"""
Es gibt zwei Standard-Techniken (Partielle Integration und Substitution) zur Umformung.
### 2.5.3 Partielle Integration
Aus $(f\cdot g)'=f'g+fg'$ (Produktregel für Ableitungen) folgt

$\begin{align*}\int(f\cdot g)'\,dx &= f(x)g(x) = \int f'(x)g(x)\,dx + \int f(x)g'(x)\,dx\\\Rightarrow\;\, \int f(x)g'(x)\,dx &= f(x)g(x)-\int f'(x)g(x)\,dx\\\Rightarrow \int_a^b f(x)g'(x)\,dx &= f(x)g(x)\bigg|_a^b-\int_a^bf'(x)g(x)\,dx\end{align*}.$

##### Beispiel:
1.  $\displaystyle\int\underbrace{t^2}_{f(t)}\underbrace{e^t}_{g'(t)\,}dt = \underbrace{t^2}_{f(t)}\underbrace{e^t}_{g(t)}-\int\underbrace{\underbrace{2t}_{f'(t)}\underbrace{e^t}_{g(t)}}_{f(t)g'(t)}\,dt$\
    $\displaystyle\hphantom{\int\underbrace{t^2}_{f(t)}\underbrace{e^t}_{g'(t)}\,dt}=t^2e^t-[2te^t-\underbrace{\int2e^t\,dt}_{2e^t}] = (t^2-2t+2)e^t$.


2.  $\displaystyle\int\underbrace{1}_{g'(x)}\cdot\underbrace{\ln(x)}_{f(x)}\,dx = \underbrace{x}_{g(x)}\underbrace{\ln(x)}_{f(x)}- \int\underbrace{x}_{g(x)}\underbrace{\frac{1}{x}}_{f'(x)}\,dx = x\ln(x)-x$


3.  $\displaystyle \int \underbrace{e^x}_{g'(x)}\underbrace{\cos(x)}_{f(x)}\,dx = e^x\cos(x) - \int\underbrace{e^x}_{g'(x)}\underbrace{(-\sin(x))}_{f(x)}\,dx$\
    $\displaystyle\hphantom{\int \underbrace{e^x}_{g'(x)}\underbrace{\cos(x)}_{f(x)}\,dx} = e^x\cos(x)+e^x\sin(x)-\underbrace{\int e^x\cos(x)}_{:= I}$\
    $\displaystyle\hphantom{\int \underbrace{e^x}_{g'(x)}\underbrace{\cos(x)}_{f(x)}\,dx}\!\!\! I = e^x(\cos(x)+\sin(x))-I$\
    $\displaystyle\hphantom{\int \underbrace{e^x}_{g'(x)}\underbrace{\cos(x)}_{f(x)}\,dx} \Rightarrow \int e^x\cos(x)\,dx = \frac{1}{2}e^x(\cos(x)+\sin(x)).$
"""

# ╔═╡ e0778981-d933-47a2-ac73-a541afe52570
md"""
### 2.5.4 Substitution
Sei $F'=f$. Für $F(\phi(t))$ gilt $\frac{d}{dt}F(\phi(t))\overset{\text{Kettenregel}}{=}F'(\phi(t))\phi'(t)=f(\phi(t))\phi'(t)$. Also

$\underbrace{\int f(\phi(t))\phi'(t)dt}_{\int\frac{d}{dt}Fdt=F}=\underbrace{\int f(x)dx}_{=F}\bigg|_{x=\phi(t)}+c\in \mathbb{R}$

Zwei Möglichkeiten der Anwendung:

1. Gegeben $\int f(\underbrace{\phi(t)}_{x})\phi'(t)\underbrace{dt}_{\frac{1}{\phi'(x)}dx} \Rightarrow $ Ersetze $\phi(t) = x \Rightarrow \frac{dx}{dt}=\phi'(t) \Rightarrow dt = \frac{dx}{\phi'(t)}$
2. Gegeben $\int f(\underbrace{x}_{\phi(t)})\underbrace{dx}_{\phi'(t)dt} \Rightarrow$ Ersetze $x=\phi(t)\Rightarrow\frac{dx}{dt}=\phi'(t)\Rightarrow dx=\phi'(t)dt$

Achtung: Grenzen müssen immer mit substituiert werden!

$\int_{t=a}^{t=b}f(\phi(t))\phi'(t)dt = \int_{x=\phi(a)}^{x=\phi(b)}f(x)dx \quad \text{bzw.}$
$\int_{x=x_0}^{x=x_1}f(x)dx=\int_{t=\phi^{-1}(x_0)}^{t=\phi^{-1}(x_1)}f(\phi(t))\phi'(t)dt.$
"""

# ╔═╡ f11a05a5-69f9-4d31-93f7-f7bc2afa46d1
md"""
##### Beispiel:
1.  $\displaystyle \phantom{=}\; \int\left(\sin^3(t)+e^{\sin(t)}\right)\cos(t)\,dt\quad\quad (x=\phi(t)=\sin(t),\, dx=\cos(t)\,dt)$\
    $\displaystyle =\int(x^3+e^x)\,dx = \frac{1}{4}x^4+e^x+c\bigg|_{x=\sin(t)} = \frac{1}{4}\sin^4(t)+e^{\sin(t)}+c$

   Mit Grenzen:

    $\displaystyle \int_0^{\frac{\pi}{2}}(\sin^3(t)+e^{\sin(t)})\cos(t)\,dt \quad\quad(x=\sin(t);\, t=0\Leftrightarrow x= 0;\, t=\frac{\pi}{2}\Leftrightarrow x=1)$\
    $\displaystyle\qquad\qquad = \int_0^1(x^3+e^x)\,dx = \left[\frac{1}{4}x^4+e^x\right]\Bigg|_0^1  = \frac{1}{4}+e-1 = e-\frac{3}{4}.$

2.  $\displaystyle \int\sin(\underbrace{\sqrt{x}}_{t})\,\underbrace{dx}_{2t\,dt} = \int\sin(t)2t\,dt = -2t\cos(t)+2\sin(t)+c$\
    $\displaystyle\hphantom{\int\sin(\underbrace{\sqrt{x}}_{t})\,\underbrace{dx}_{2t\,dt}} = 2(\sin(\sqrt{x})-\sqrt{x}\cos(\sqrt{x}))+c.$
"""

# ╔═╡ 214518e7-e33d-46cf-94ca-044da60db06f
md"""
Es gibt einige Standardsubstitutionen:
1. Potenzen von $e^x,\quad t=e^x,\, dt = e^x\,dx,\, dx=\frac{1}{t}\,dt$


2. Potenzen von $x$ und $\sqrt[n]{ax+b},\quad t=\sqrt[n]{ax+b},\,dx=\frac{n}{a}t^{n-1}\,dt$


3. Potenzen von $x$ und $\underbrace{\sqrt{1-x^2}}_{\cos(t)},\quad x=\sin(t),\,dx=\cos(t)\,dt$


4. Potenzen von $x$ und $\underbrace{\sqrt{x^2-1}}_{\sinh(t)},\quad x=\cosh(t),\,dx=\sinh(t)\,dt$


5. Potenzen von $x$ und $\underbrace{\sqrt{x^2+1}}_{\cosh(t)},\quad x=\sinh(t),\,dx=\cosh(t)\,dt$
"""

# ╔═╡ 725db376-0766-44fc-9fce-d514cfb595d2
md"""
##### Beispiel:
1. zu 1: $t = e^x$, $\frac{dt}{dx}=e^x$, $dx = \frac1{e^x}\,dt = \frac{dt}t$

   $\begin{align*}\int\frac{e^x}{1+e^{2x}}\,dx &=\int\frac{t}{1+t^2}\frac{1}{t}\,dt=\int\frac{1}{1+t^2}\,dt\\[2pt]&=\arctan(t)+c\big|_{t=e^x}=\arctan(e^x)+c.\end{align*}$


2. zu 2: $t = \sqrt{x - 1}$, $x = t^2 + 1$, $dx = 2t\,dt$

   $\begin{align*}\int_{x=5}^{x=10}\frac{x}{\sqrt{x-1}}\,dx &= \int_{t=2}^{t=3}\frac{t^2+1}{t}2t\,dt\\&=2\int_2^3(t^2+1)\,dt=2(\frac{1}{3}t^3+t)\bigg|_2^3=\frac{44}{3}.\end{align*}$


3. zu 3: $x = \sin t$, $dx = \cos t\, dt$

   $\begin{align*}\int\underbrace{\sqrt{1-x^2}}_{\cos(t)}\,dx &= \int\cos(t)\cos(t)\,dt = \int\cos^2(t)\,dt\\&\overset{\text{part.Int.}}{=} \cos(t)\sin(t) +\int\underbrace{\sin^2(t)}_{1-\cos^2(t)}\,dt = \cos(t)\sin(t)+t-\int\cos^2(t)\,dt\\&\Rightarrow \int\sqrt{1-x^2}\,dx=\frac{1}{2}(t+\cos(t)\sin(t))+c\bigg|_{t=\arcsin(x)}\\&= \frac{1}{2}(\arcsin(x)+\underbrace{\cos(\arcsin(x))}_{\sqrt{1-x^2}})+c.\end{align*}$


4. zu 5: $x = \sinh t$, $dx = \cosh t\,dt$; $\quad y = e^t$, $dy = e^t\,dt$, $dt = \frac{dy}y$

   $\begin{align*}2\int\sqrt{1+\frac{1}{x^2}}\,dx &= 2\int\frac{\sqrt{1+x^2}}{x}\,dx = 2\int\frac{\cosh(t)}{\sinh(t)}\cosh(t)\,dt\\&=2\int\frac{(\frac{1}{2}(e^t+e^{-t}))^2}{\frac{1}{2}(e^t-e^{-t})}\,dt = \int\frac{e^{2t}+2+e^{-2t}}{e^t-e^{-t}}\,dt\\&=\int\frac{y^2+2+\frac{1}{y^2}}{y-\frac{1}{y}}\frac{1}{y}\,dy=\int\frac{y^4+2y^2+1}{y^4-y^2}\,dy\\&=\int(\frac{y^4-y^2}{y^4-y^2}+\frac{3y^2+1}{y^4-y^2})\,dy = y +\underbrace{\int\frac{3y^2+1}{y^4-y^2}\,dy}_{???}.\end{align*}$
"""

# ╔═╡ bbd6dd32-06d3-4d34-b007-c214d38845f3
md"""
### 2.5.5 Partialbruchzerlegung

Idee. Schreibe eine rationale Funktion $\frac{p(x)}{q(x)}$ mit Polynomen $p,q$ als Summe einfacher Brüche (typischerweise grad$(p)<$grad$(q)$).

##### Beispiel:
$\frac{1}{y^4-y^2}=\frac{1}{y^2(y^2-1)}=\frac{1}{y^2(y-1)(y+1)}\overset{?}{=}\frac{A}{y^2}+\frac{B}{y-1}+\frac{C}{y+1}$
$=\frac{A(y-1)(y+1)+By^2(y+1)+Cy^2(y-1)}{y^4-y^2}=\frac{\overbrace{(B+C)}^{\overset{!}{=}0}y^3+\overbrace{(A+B-C)}^{\overset{!}{=}0}y^2-\overbrace{A}^{\overset{!}{=}1}}{y^4-y^2}$

Über Koeffizienten-Vergleich erlangen wir $A=-1,\,B=\frac{1}{2},\,C=-\frac{1}{2}$. Somit lässt sich das Integral aus dem vorherigen Beispiel fertig berechnen.

$\begin{align*} 2\int \sqrt{1+\frac{1}{x^2}}dx &= y + \int \frac{3y^2+1}{y^4-y^2}dy\\&=y + \int \frac{-1}{y^2}dy + \int \frac{2}{y-1}dy + \int \frac{-2}{y-1}dy\\&= y + \frac{1}{y} + 2 \ln(y-1) - 2 \ln(y+1) + c\big|_{y=e^t}\Big|_{t=\text{arcsinh}(x)}=\dots\end{align*}$
"""

# ╔═╡ b7b6ad15-89cb-4aa5-9372-8fc4490a7f13
md"""
##### Bemerkung:
1. Potenzreihen $f(x)=\sum_{i=0}^\infty a_i\,x^i$ dürfen im Konvergenzbereich gliedweise integriert werden, d.h.

$\int f(x)\,dx = \sum_{i=0}^\infty a_i\int x^i\,dx = \sum_{i=0}^\infty\frac{a_i}{i+1}x^{i+1}+c$
2. Es gibt Integrale, die können nicht "elementar" gelöst werden, so etwa $\int_0^a e^{-t^2}\,dt$. Per Potenzreihe wird die "Fehlerfunktion" definiert

$\mathrm{erf}(x) := \frac{2}{\sqrt{\pi}} \int _0^x e^{-t^2}\,dt = \frac{2}{\sqrt{\pi}}\sum_{k=0}^\infty\frac{(-1)^k\,x^{2k+1}}{(2k+1)\,k!}.$
"""

# ╔═╡ 459175f5-93ef-46ea-a58d-b29eab96175a
md"""
### 2.5.6 Uneigentliche Integrale

##### Definition:
1. Es sei $f:[a,\infty)\to\mathbb{R}$ auf jedem Intervall $[a,b]$ Riemann-integrierbar. Wir definieren

   $\int_a^\infty f(x)\,dx := \lim_{b\to\infty}\int_a^b f(x)\,dx$
   als uneigentliches Integral von $f$ über $[a,\infty)$.

2. Es sei $f:[a,b]\setminus\{x_0\}\to\mathbb{R}$ bei $x_0\in[a,b]$ unbeschränkt und integrierbar auf jedem Intervall, welches $x_0$ nicht enthält. Wir definieren

   $\int_a^bf(x)\,dx := \lim_{t\to x_0^-}\int_a^tf(x)\,dx+\lim_{t\to x_0^+}\int_t^bf(x)\,dx$
   als uneigentliches Integral von $f$.
"""

# ╔═╡ f5304dcc-aa9b-4bce-a349-4d322d17f088
md"""
##### Bemerkung:
1. Uneigentliche Integrale sind entweder konvergent (wenn der Grenzwert existiert) oder divergent.
2. Es lässt sich analog $\int_{-\infty}^bf(x)\,dx$ definieren und
$\int_{-\infty}^\infty f(x)\,dx=\int_{-\infty}^0f(x)\,dx + \int_0^{\infty}f(x)\,dx.$
3. Ist $F$ eine Stammfunktion von $f$, so gilt bei 1. in der Definition $\int_a^\infty f(x)\,dx = \lim\limits_{b\to\infty}F(b)-F(a)$.
4. In 2. der Definition ist die typische Situation eine Singularität am Rand, d.h. $x_0=a$ oder $x_0=b$, z.B.

   $\int_{x_0}^bf(x)\,dx = \lim_{t\to x_0^+}\int_t^b f(x)\,dx = F(b)-\lim_{t\to x_0^+}F(t).$
"""

# ╔═╡ 014e2078-5127-4066-a12e-e53c25b3207b
md"""
##### Beispiel:

1.  $\displaystyle \int_0^\infty e^{-x\,}dx = \lim_{b\to\infty} (-e^{-x})\bigg|_0^b = \underbrace{\lim_{b\to\infty}(-e^{-b})}_{=0} - \underbrace{(-e^0)}_{=-1}=1.$

    $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/integral_e_fkt.svg","./assets/integral_e_fkt.svg"))

2.  $\displaystyle \int_{-\infty}^\infty\frac{1}{1+x^2}\,dx = \int_{-\infty}^0\frac{1}{1+x^2}\,dx + \int_0^\infty \frac{1}{1+x^2}\,dx$\
    $\displaystyle\hphantom{\int_{-\infty}^\infty\frac{1}{1+x^2}\,dx} = 2\int_0^\infty\frac{1}{1+x^2}\,dx = \lim\limits_{b\to\infty}(2\arctan(x))\bigg|_0^b$\
    $\displaystyle\hphantom{\int_{-\infty}^\infty\frac{1}{1+x^2}\,dx} = 2\lim\limits_{b\to\infty}\arctan(b)=\pi.$

   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/integral_bruch.svg","./assets/integral_bruch.svg"))

3.  $\displaystyle \int_0^1\ln(x)\,dx=\lim_{a\to0}\;(x\ln(x)-x)\bigg|_a^1=-1-\lim_{a\to0}(a\ln(a)-a)=-1.$

4. Betrachte $f(x) = x^\alpha,\quad \alpha\in\mathbb{R}$\

   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/potenzen.svg","./assets/potenzen.svg"))

   $\int_a^b x^\alpha dx = \begin{cases}\frac{1}{\alpha+1}x^{\alpha + 1}\big|_a^b&\alpha \neq -1,\\\ln(x)\big|_a^b&\alpha=-1.\\\end{cases}$

   (i) $\displaystyle \int_1^\infty x^\alpha\,dx = \begin{cases}\frac{1}{\alpha +1} (\lim\limits_{b\to\infty}b^{\alpha+1}-1)&\alpha\neq-1,\\[2pt]\lim\limits_{b\to\infty}\ln(b)-0&\alpha=-1.\end{cases}$

    da $\lim\limits_{b\to\infty} \ln(b) = \infty$ und $\lim\limits_{b\to0} b^{\alpha+1} = \begin{cases} \infty & \alpha > -1 \\[2pt] 0 & \alpha < -1, \end{cases}$\
    folgt Konvergenz, falls $\displaystyle \alpha<-1,\quad \int_1^\infty x^\alpha\,dx = -\frac{1}{\alpha+1}.$

   (ii) $\displaystyle \int_0^1 x^\alpha\,dx = \begin{cases} \frac{1}{\alpha +1}(1-\lim\limits_{b\to0}b^{\alpha+1})&\alpha\neq -1\\[2pt]0-\lim\limits_{b\to0}\ln(b)&\alpha=-1\end{cases}$

    da $\lim\limits_{b\to\infty} \ln(b) = \infty$ und $\lim\limits_{b\to0} b^{\alpha+1} = \begin{cases} \infty & \alpha < -1 \\[2pt] 0 & \alpha > -1, \end{cases}$\
    folgt Konvergenz, falls $\displaystyle \alpha > -1,\quad \int_0^1 x^\alpha\,dx = \frac{1}{\alpha+1}.$
"""


# ╔═╡ 618661ef-0f21-4b49-96f4-643dff2e148e
md"""
##### Satz:
Sei $f$ stetig in $[a,b]\setminus\{x_0\}$ und bei $x_0\in[a,b]$ unbeschränkt. Gilt in einer Umgebung von $x_0$
1.  $|f(x)|\leq c\frac{1}{|x-x_0|^p},\quad$ mit $p<1,\,c>0,\,$ so konvergiert $\int_a^bf(x)dx.$
2.  $|f(x)|\geq c\frac{1}{|x-x_0|^p},\quad$ mit $p\geq1,\,c>0,\,$ so divergiert $\int_a^bf(x)dx.$

Bild: $f$ hat Singularität von algebraischem Typ mit Ordnung $p$. Das heißt $\lim\limits_{x\to x_0} |x-x_0|^p\,|f(x)|\leq C < \infty.$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/singularitaet.svg","./assets/singularitaet.svg"))
"""

# ╔═╡ 6ab7bf41-937e-4d35-8e8e-87f1e93ae93b
md"""
##### Bemerkung:
Analog: Falls $|f(x)|\leq g(x),\quad x\in [a,\infty)$ und $\int_a^\infty g(x)\,dx$ existiert, dann folgt $\left|\int_0^\infty f(x)\,dx\right|\leq\int_0^\infty|f(x)|\,dx\leq \int_a^\infty g(x)\,dx$. Also existiert $\int_0^\infty f(x)\,dx.$ ($g$ heißt "Majorante")
##### Beispiel:
 $\int_1^\infty(1+\sin(t))e^{-1}\,dt$ existiert, denn $|(1+\sin(t)e^{-t}|\leq \underbrace{2e^{-t}}_{g(t)}$
"""

# ╔═╡ 84f2fc4b-bfb6-4309-ab04-dbe3cb846400
md"""
##### Satz:
Sei $f:[1,\infty)\to\mathbb{R}^+$ stetig und monoton fallend. Dann gilt

 $\displaystyle \sum_{n=1}^\infty f(n)$ konvergiert $\displaystyle\Leftrightarrow \int_1^\infty f(x)\,dx$ existiert.

##### Beweis:
Auf dem Intervall $I=[n-1,n]$ gilt $\underset{x\in I}{\max}f(x) = f(n-1)>0$ und $\underset{x\in I}{\min}f(x)=f(n)>0$, also

$f(n)\leq \int_{n-1}^nf(x)\,dx\leq f(n-1).$

Summiere über $n=2,\ldots,N$: $\begin{align*}\sum_{n=2}^Nf(n)\leq \int_1^Nf(x)dx\leq\sum_{n=2}^Nf(n-1)=\sum_{n=1}^{N-1}f(n)\end{align*}.$

Für die Hinrichtung haben wir, für $N$ beliebig, da $f(n) \geq 0$

$\int_1^Nf(x)\,dx\leq\sum_{n=1}^{N-1}f(n)\leq \sum_{n=1}^\infty f(n)\Rightarrow \lim_{N\to\infty}\int_1^Nf(x)\,dx<\infty$

Für die Rückrichtung gilt, für $N$ beliebig, da $f(x) \geq 0$

$\sum_{n=2}^Nf(n)\leq \int_1^Nf(x)\,dx\leq\int_1^\infty f(x)\,dx\Rightarrow \lim_{N\to\infty}\sum_{n=1}^Nf(n)<\infty$

##### Beispiel:
 $\displaystyle \sum_{n=1}^\infty \frac{1}{n^\alpha} \begin{cases} \text{konvergiert}&\alpha > 1,\\\text{divergiert}&\alpha \leq 1.\end{cases}$
"""

# ╔═╡ 02d9df1c-1289-4025-800b-a13763ba63bd
md"""
### 2.5.7 Parameter-Integrale

##### Definition:
Sei $f:[a,b]\times\mathbb{R}\to\mathbb{R}, \,(x,t)\mapsto f(x,t)$ eine Funktion in $x$ mit Parameter $t$. Für ein festes $t$ sei $f(\cdot,t):\mathbb{R}\to\mathbb{R}$ Riemann-integrierbar. Das Integral $g(t)=\int_a^bf(x,t)\,dx$ heißt Parameter-Integral und ist eine Funktion $g:\mathbb{R}\to\mathbb{R}.$
"""

# ╔═╡ f8d430f5-35f6-4a6e-80ca-769f18bef648
md"""
##### Beispiel:
Betrachte $I(n)=\int_0^\infty t^ne^{-t}\,dt,\quad f(t,n)=t^ne^{-t}$ mit $n\in\mathbb{N}$ als Parameter.

$\begin{align*}n&=0:\quad I(0)=\int_0^\infty e^{-t}\,dt=1\\[2pt]n&=1:\quad I(1)=\int_0^\infty te^{-t}\,dt = -te^{-t}\bigg|_0^\infty +\int_0^\infty e^{-t}\,dt = 1\\[2pt]
I(n)&=\int_0^\infty t^ne^{-t}\,dt=\underbrace{-t^ne^{-t}\bigg|_0^\infty}_{=0} + n \int_0^\infty t^{n-1}e^{-t}\,dt\\[2pt]
 &= n\,I(n-1)= n\,(n-1)\,I(n-2)\dots=n!\quad \forall n\in\mathbb{N}\end{align*}$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/integral_fakultaet.svg","./assets/integral_fakultaet.svg"))

Beachte $I(n)$ ist auch für $n\in\mathbb{R}^+$ definiert. Und für $n<0$?

In der Nähe von $t=0$ gilt

$|t^ne^{-t}|\leq c\,t^n \Rightarrow I(n)\;\begin{cases}\text{divergiert}&n\leq-1,\\\text{konvergiert}&n>-1.\end{cases}$
"""

# ╔═╡ 936879c3-c85f-4dbc-ad38-0069bd16f786
md"""
##### Definition:
 $\Gamma:(0,\infty)\to\mathbb{R},\,x\mapsto\int_0^\infty t^{x-1}e^{-t}\,dt \quad$ heißt Gamma-Funktion.
Es gilt

 $\begin{align*}\underbrace{\Gamma(x+1)}_{\int t^xe^{-t}}&=\underbrace{x\Gamma(x)}_{x\int t^{x-1}e^{-t}},\quad x\in(0,\infty),\\\Gamma(n+1)&=n!=I(n),\quad n\in\mathbb{N}.\end{align*}$

 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/gamma_funktion.svg","./assets/gamma_funktion.svg"))
"""

# ╔═╡ 83277f80-2358-4912-9c43-c2ad8bb3b5aa
md"""
##### Bemerkung:
1. Die Funktion $\Gamma$ ist die Verallgemeinerung der Fakultät $n!$ für reelle Zahlen.
2. Es gibt viele Funktionen, die $f(n+1)=nf(n)$ für $n\in\mathbb{N}$ gilt, aber nur $\Gamma$ ist _konvex_.
3.  $\Gamma$ kann fortgesetzt werden für $x<0$ durch $\Gamma(x)=\frac{\Gamma(x+1)}{x}.$
4. Faszinierend: $\Gamma(\frac{1}{2}) = \sqrt{\pi},\quad \sin(\pi x) = \frac{\pi}{\Gamma(x)\Gamma(1-x)}$.


5.  $\displaystyle \Gamma'(x_0) =\lim_{x\to x_0}\frac{\Gamma(x)-\Gamma(x_0)}{x-x_0}=\lim_{n\to\infty}\frac{\Gamma(x_n)-\Gamma(x_0)}{x_n-x_0}$

    $\displaystyle\hphantom{\Gamma'(x_0)}=\lim_{n\to\infty}\int_0^\infty\underbrace{\frac{t^{x_n-1}e^{-t}-t^{x_0-1}e^{-t}}{x_n-x_0}}_{f_n(t)}\,dt.$
"""

# ╔═╡ 2659d0a0-1e6b-4121-bbfc-4d12e4452e94
md"""
### 2.5.8 Funktionenfolgen

Wir hatten bisher Folgen von Zahlen $(a_n)_{n\in\mathbb{N}}\subset\mathbb{R}$.

##### Definition:
Sei $D\subset\mathbb{R}$ und $\mathcal{F}(D,\mathbb{R})$ die Menge der Funktionen $f:D\to\mathbb{R}$. Dann heißt die Folge der Funktionen $(f_n)_{n\in\mathbb{N}}\subset\mathcal{F}$ _Funktionenfolge_.

##### Beispiel:
1.  $f_n(x)=x^n,\quad\quad f_n:[0,1]\to\mathbb{R}$\
   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/funktionenfolge_xhochn.svg","./assets/funktionenfolge_xhochn.svg"))

   Als Grenzwert entsteht

    $f(x)= \lim\limits_{n\to\infty}f_n(x)=\begin{cases}0&x\in[0,1),\\1&x=1.\end{cases}\quad$(unstetig!)

2.  $f_n:[0,1]\to\mathbb{R},\,f_n(x)=x-\frac{1}{n}x^n$\
   $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/funktionenfolge_beispiel.svg","./assets/funktionenfolge_beispiel.svg"))

    $f(x)=\lim\limits_{n\to\infty}f_n(x)=x,\quad x\in[0,1]$\
   Aber: $f_n'(x)=1-x^{n-1},\quad \lim\limits_{n\to\infty}f_n'(x)=\begin{cases}1&x\in[0,1),\\0&x=1\end{cases}\neq f'(x).$

Das Beispiel zeigt uns, dass die Vertauschbarkeit von Grenzwerten offenbar nicht immer gegeben ist!
"""

# ╔═╡ e5838aca-0d93-4e57-898e-9ed25832b84a
md"""
##### Definition:
Die Folge $(f_n)_{n\in\mathbb{N}}\subset\mathcal{F}(D,\mathbb{R})$ _konvergiert punktweise_ gegen eine Funktion $f\in\mathcal{F}(D,\mathbb{R})$, falls für jedes $x\in D$ gilt

$\forall \varepsilon>0\,\exists n(x,\varepsilon): |f_n(x)-f(x_0)|\leq \varepsilon\quad n\geq n(x,\varepsilon)$

##### Bemerkung:
Dies ist die direkte Verallgemeinerung von Konvergenz für Folgen. Die Grenzwerte in Beispiel 1 und 2 waren _punktweise_ Grenzwerte.

"""

# ╔═╡ feb4e44d-4dc2-477e-a1a4-b0d5f0bb8495
md"""
##### Definition:
Sei $f:D\to\mathbb{R}$ der punktweise Grenzwert von $(f_n)_{n\in\mathbb{N}}\subset\mathcal{F}(D,\mathbb{R}). (f_n)$ _konvergiert gleichmäßig_, falls

$\forall\varepsilon>0\,\exists n_\varepsilon: |f_n(x)-f(x)|\leq\varepsilon\quad\forall n\geq n_\varepsilon\quad \forall x\in D.$

##### Bemerkung:
1. Bei gleichmäßger Konvergenz lässt sich ein "$\varepsilon$-Schlauch" um den Grenzwert $f$ legen, in dem alle übrigen Folgenglieder liegen.
 $(RobustLocalResource("https://github.com/hpsc-lab/lecture-notes-math1/raw/68c6f1ba9a12fee79c5d75bbcc94725d22b0573d/notebooks/assets/funktionenfolge_gleichmaessig.svg","./assets/funktionenfolge_gleichmaessig.svg"))
2. Jedes gleichmäßig konvergente $f_n$ konvergiert auch punktweise.
3.  $(f_n)$ konvergiert gleichmäßig, falls $\lim\limits_{n\to\infty}\lVert f_n-f\rVert_\infty = 0$, wobei $\|f_n - f\|_\infty := \max\limits_{x\in D} \left| f_n(x) - f(x)\right|$.

"""

# ╔═╡ e2b720d8-b644-4407-8331-ec5ca02bae05
md"""
##### Beispiel:
1. Für $x\in[0,1]$ konvergiert $f_n=x^n$ nicht gleichmäßig.
2. Für $x\in[0,1]$ konvergiert $f_n=x-\frac{1}{n}x^n$ gleichmäßig

##### Satz:
Falls $(f_n)_{n\in\mathbb{N}}\subset C^0(D,\mathbb{R})$, d.h. jedes $f_n$ ist stetig in $D$ und $(f_n)$ gleichmäßig konvergent gegen $f$, dann ist $f$ auch stetig in $D$, also $f\in C^0(D,\mathbb{R})$.

##### Beispiel:
1.  $f_n=x^n \Rightarrow f$ nicht stetig.
2.  $f_n=x-\frac{1}{n}x^n\Rightarrow f$ stetig.
"""

# ╔═╡ e7071a4d-3950-4ca1-af05-2aca227ea119
md"""
##### Satz:
Sei $D=[a,b]\subset\mathbb{R}$ und $(f_n)_{n\in\mathbb{N}}\subset C^0(D,\mathbb{R})$ gleichmäßig konvergent gegen $f$. Dann gilt:

$\lim_{n\to\infty}\int_a^bf_n(x)\,dx=\int_a^b\lim_{n\to\infty}f_n(x)\,dx=\int_a^bf(x)\,dx.$

Der Limes und das Integral dürfen also vertauscht werden.

##### Bemerkung:
Damit lässt sich für die Gamma Funktion zeigen

$\Gamma'(x)=\int_0^\infty\underbrace{\frac{\partial}{\partial x}(\overbrace{t^{x-1}}^{e^{(x-1)\ln(t)}}}_{\text{Ableitung nach } x}\cdot e^{-t})\,dt=\int_0^\infty t^{x-1}\ln(t)e^{-t}\,dt.$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CairoMakie = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
CairoMakie = "~0.15.6"
PlutoTeachingTools = "~0.4.6"
PlutoUI = "~0.7.71"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.7"
manifest_format = "2.0"
project_hash = "839ad8f85e939996be75648f0cce995fc4682f34"

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

[[deps.Cairo]]
deps = ["Cairo_jll", "Colors", "Glib_jll", "Graphics", "Libdl", "Pango_jll"]
git-tree-sha1 = "71aa551c5c33f1a4415867fe06b7844faadb0ae9"
uuid = "159f3aea-2a34-519c-b102-8c37f9878175"
version = "1.1.1"

[[deps.CairoMakie]]
deps = ["CRC32c", "Cairo", "Cairo_jll", "Colors", "FileIO", "FreeType", "GeometryBasics", "LinearAlgebra", "Makie", "PrecompileTools"]
git-tree-sha1 = "f8caabc5a1c1fb88bcbf9bc4078e5656a477afd0"
uuid = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
version = "0.15.6"

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

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "a641238db938fff9b2f60d08ed9030387daf428c"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.3"

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

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "9b8215b1ee9e78a293f99797cd31375471b2bcae"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.1.3"

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
deps = ["Artifacts", "JLLWrappers", "LazyArtifacts", "Libdl"]
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
"""

# ╔═╡ Cell order:
# ╟─2c52d212-a901-11f0-0610-e9b014ee6e4f
# ╟─0f870d00-ce80-4c42-b444-d840c1e703c5
# ╟─b2a667d1-da08-469d-84f0-03b2f58cf986
# ╟─bf17ec96-f486-46bc-87c1-825770049537
# ╟─6e38ce1b-40ea-4b3e-8fc0-0b4599edaf81
# ╟─adc9c72d-5ba1-4343-a468-71ecf38ced99
# ╟─38a8e16e-e34e-4bc6-92e0-c981748062bf
# ╟─07319b68-1c84-4a9b-b1bd-dd4600dce204
# ╟─d113d633-f636-4098-8741-040d56c3603b
# ╟─852e50d3-afa0-4b8d-9aaf-92917797d067
# ╟─a3370b80-0076-430f-a53d-33461e78de03
# ╟─8f0aefc3-376b-4912-9bb9-0c4d0c9c7d0b
# ╟─c778da30-033c-40af-8c1d-ece03b3b7323
# ╟─adc24a61-9c0a-47fb-8d6c-6e46ab28e0e4
# ╟─c42fe7f1-e46a-4223-b481-44a6ec2e85a0
# ╟─2b35d288-6db4-4d8c-aa88-484390676ebf
# ╟─eac4a80e-42f2-4f5c-84b3-dd444a3e5193
# ╟─df1df3b1-c00f-45b7-a207-5da3a0c46834
# ╟─f4035677-2ad9-47b1-a942-6f7ffd56b5e9
# ╟─8bf26b35-aca3-4ecd-851f-2c1c1e82922e
# ╟─4393a0c9-168a-4fc9-b678-3e7e06b461ff
# ╟─1b1f1b81-9ddf-4f4c-bfc6-5de4b3b78896
# ╟─ba88414f-f414-44e7-8036-3037e62c0633
# ╟─0d30d014-3031-4c3b-b8ea-f2431d8b805f
# ╟─e6f45d31-b850-41e8-8343-8b2b7b551aa4
# ╟─65c54798-28b9-445e-aafb-727d3db668ef
# ╟─a9b40cf0-b359-454b-8efe-53c3ad4bbea5
# ╟─10a8d630-9cc2-40ec-831f-816f52723f9f
# ╟─1a15c7e7-c181-402c-b8f7-24925600b785
# ╟─257a7c67-60e3-4322-bf41-38d774d1fc8e
# ╟─8d2ad4af-cac1-40a0-b373-3f7c8541fd1d
# ╟─cb6d0485-be4a-4b5e-b676-9213fb604cc0
# ╟─b7a09980-45a0-4765-bff2-2a7302344075
# ╟─63dc9443-c896-48a4-ae32-153f004f8303
# ╟─6edf4001-6421-4bf4-bd15-7d4c2bc999c3
# ╟─b5a979ca-f35b-47ec-b460-287022148faf
# ╟─bb566e84-1ba2-411f-8d1a-895453dd6e43
# ╟─c79d2e6d-88fa-4e26-93ba-e05bd4a483f4
# ╟─2cbe1d61-6048-45c9-8c6d-719ff647d8a1
# ╟─8cf5fc18-879e-4cd5-8cd4-e07dada54684
# ╟─fb5a6f17-fdda-4f8b-90df-0896f04e0311
# ╟─be62c9f6-cd2c-470e-af41-f03486f07a7b
# ╟─c7555deb-f940-479b-a3cd-d3ced4213db6
# ╟─3a0fe81e-2f5a-47f0-9f73-e6497290ed5d
# ╟─c7e9cffb-2fdd-4ca3-926b-da7a95b64b09
# ╟─a44ddf76-a7f8-4e6f-9d26-47b85d593e20
# ╟─414521f9-7c60-472d-a844-cfee979c5c9a
# ╟─26cc2470-dca2-4e18-94c8-6b2b9d6b1706
# ╟─31c3216b-aca6-4c6b-bc61-f2455de9ac77
# ╟─2fc93fad-76b0-480a-a636-6a913559b609
# ╟─beb04ead-d386-4d24-b787-70f8679f6125
# ╟─24975dda-9ce3-4d50-8004-50564309d2eb
# ╟─3ca46888-3700-47a0-868b-e66c97fd25b8
# ╟─dbe2e33f-91ff-4c47-bad3-cc6c8d4c9ad2
# ╟─b61d62c4-b6be-457c-b336-1b80956e7860
# ╟─a5fc080e-d356-4290-960f-8c295aa714b7
# ╟─f0c132db-3821-4557-9525-4c02d9370bf1
# ╟─de17e260-42e3-4d67-a196-e5ca78aee6ff
# ╟─0750a5f7-e01c-4127-b12d-30dad617af36
# ╟─2b396a1a-5922-4597-aa3f-6adf1c762b17
# ╟─9658f505-a331-4e4b-bac9-c894ef2e0476
# ╟─1f92a719-9af8-46b8-9214-1bd9a8904844
# ╟─f4c0a98b-07cf-478e-b9cb-eccc4c44a7bc
# ╟─96c6d8cc-b8d4-4819-bd0b-b34b3d5ce696
# ╟─022df025-f076-4551-b10c-735f8144c56d
# ╟─ad561de0-a2ad-4030-8543-ba5e253f3e71
# ╟─c3779634-cf79-4b3b-b724-c2d6a7ed9e98
# ╟─cc9f5089-7bba-4c2a-8163-914a572e4cdd
# ╟─703e6fb5-9dd6-47df-abde-3861a8039e61
# ╟─8223202c-a921-4909-add3-9c338004538b
# ╟─8cd3a268-d8c8-45f8-87a1-429376013887
# ╟─ef93403f-26b6-4176-a051-ae76a1eb8b43
# ╟─c2ce741c-d0f0-413a-99c5-4b149e702ea3
# ╟─5f815d22-80a3-48a8-acbc-04c5ebd736dc
# ╟─8a9b9e48-28b6-49bf-8b9c-916ec198d121
# ╟─725e22e0-6e67-4fbb-8225-d3aa0ff32d5a
# ╟─8d9277b4-b3b4-4f61-baf8-62db58b6caa4
# ╟─942c21fe-8b95-432f-83d9-17ccd38c8067
# ╟─5d3652b8-1687-41f3-a96d-e1c4a63a9fd9
# ╟─c15de1c9-56e5-400b-90b1-7f821b11a8b6
# ╟─436b3889-a170-4bcb-91e8-e83970d7bbcd
# ╟─d078dfa1-07ef-485d-ba7e-d166d0075740
# ╟─81e04c16-4fd5-4225-be72-a0086d729ea0
# ╟─8cd56a50-51bc-43aa-80de-6c5f74c152e8
# ╟─341cd2aa-549d-4a74-9f3a-79209008f533
# ╟─5eef606d-d1e1-4977-b0a0-fcb3a860cf31
# ╟─340b86f9-6234-4847-a97e-fa21bd03bcca
# ╟─e8a0fc4b-757c-4b0c-be50-36ce81cb56a0
# ╟─3cbf73dc-48fe-4fe4-8cd0-f89b819d4a73
# ╟─e180527b-3f8d-41b2-8f06-d1eb0484eb48
# ╟─bb35c873-4bab-4d15-9d19-c75618215d2c
# ╟─e0778981-d933-47a2-ac73-a541afe52570
# ╟─f11a05a5-69f9-4d31-93f7-f7bc2afa46d1
# ╟─214518e7-e33d-46cf-94ca-044da60db06f
# ╟─725db376-0766-44fc-9fce-d514cfb595d2
# ╟─bbd6dd32-06d3-4d34-b007-c214d38845f3
# ╟─b7b6ad15-89cb-4aa5-9372-8fc4490a7f13
# ╟─459175f5-93ef-46ea-a58d-b29eab96175a
# ╟─f5304dcc-aa9b-4bce-a349-4d322d17f088
# ╟─014e2078-5127-4066-a12e-e53c25b3207b
# ╟─618661ef-0f21-4b49-96f4-643dff2e148e
# ╟─6ab7bf41-937e-4d35-8e8e-87f1e93ae93b
# ╟─84f2fc4b-bfb6-4309-ab04-dbe3cb846400
# ╟─02d9df1c-1289-4025-800b-a13763ba63bd
# ╟─f8d430f5-35f6-4a6e-80ca-769f18bef648
# ╟─936879c3-c85f-4dbc-ad38-0069bd16f786
# ╟─83277f80-2358-4912-9c43-c2ad8bb3b5aa
# ╟─2659d0a0-1e6b-4121-bbfc-4d12e4452e94
# ╟─e5838aca-0d93-4e57-898e-9ed25832b84a
# ╟─feb4e44d-4dc2-477e-a1a4-b0d5f0bb8495
# ╟─e2b720d8-b644-4407-8331-ec5ca02bae05
# ╟─e7071a4d-3950-4ca1-af05-2aca227ea119
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
