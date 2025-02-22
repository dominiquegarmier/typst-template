#import "preamble.typ": *

#show: lecture_notes.with(
  lecture: [Foundations of Mathematics \ and Physics],
  lecture_id: [XXX-XXXX-XXL],
  lecturer: [David Hilbert],
  authors: (
    (
      name: "Eric Ceglie",
      affiliation: "ETH Zurich",
      email: "eceglie@ethz.ch",
    ),
    (
      name: "Dominique Garmier",
      affiliation: "ETH Zurich",
      email: "dgarmier@ethz.ch",
    ),
  ),
  semester: [Spring 2025],
)


= Very Cool Stuff

== Alot of Formulas

$ integral_E f dif mu $
$ FF := \(bb(A)_n\)_n $
$ mu(E) = integral_E 1 dif mu = integral_X bb(1)_E dif mu $
$ integral_E |nabla f|^2 dif mu $
#let L2mu = $L^2(X,mu)$
$ f in L2mu ==> integral_X |f|^2 dif mu < infinity $
$ lim_(x -> y) f(x) = f(y) $

== A random Fact About Topology
Let $X$ be a $T_2$ space. Then for any $x, y in X$ such that $x != y$ we can find open sets $U,V subset X$
open such that $x in U$, $y in V$ and $U sect V = emptyset$.


