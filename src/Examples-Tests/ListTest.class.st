Class {
	#name : #ListTest,
	#superclass : #TestCase,
	#category : #'Examples-Tests'
}

ListTest >> testPrints [

  | empty one two |
  empty := Empty new.
  one := Cons head: 3 tail: (Empty new).
  two := Cons head: 0 tail: (Cons head: 8 tail: (Empty new)).

  self assert: empty printString equals: '[]'.
  self assert: one printString equals: '[3]'.
  self assert: two printString equals: '[0, 8]'.
]

ListTest >> testZipsEmptyAndEmpty [

  | l |
  l := Empty new zip: Empty new.

  self assert: l isEmpty equals: true.
  self assert: l printString equals: '[]'.
]

ListTest >> testZipsEmptyAndNonEmpty [

  | l l1 l2 |
  l := Cons head: 3 tail: (Empty new).
  l1 := Empty new zip: l.
  l2 := l zip: Empty new.

  self assert: l1 isEmpty equals: true.
  self assert: l1 printString equals: '[]'.
  self assert: l2 isEmpty equals: true.
  self assert: l2 printString equals: '[]'.
]

ListTest >> testZipsConsAndConsEqualSized [

  | l1 l2 l12 l21 |
  l1 := Cons head: 3 tail: (
    Cons head: 7 tail: (
      Cons head: 0 tail: (
        Cons head: 1 tail: Empty new))).
  l2 := Cons head: $S tail: (
    Cons head: $P tail: (
      Cons head: $A tail: (
        Cons head: $E tail: Empty new))).
  l12 := l1 zip: l2.
  l21 := l2 zip: l1.

  self assert: l12 isEmpty equals: false.
  self assert: l12 printString equals: '[(3, $S), (7, $P), (0, $A), (1, $E)]'.
  self assert: l21 isEmpty equals: false.
  self assert: l21 printString equals: '[($S, 3), ($P, 7), ($A, 0), ($E, 1)]'.
]

ListTest >> testZipsConsAndConsUnequalSized [

  | l1 l2 l12 l21 |
  l1 := Cons head: 3 tail: (Cons head: 7 tail: (Empty new)).
  l2 := Cons head: $S tail: (
    Cons head: $P tail: (
      Cons head: $A tail: (
        Cons head: $E tail: Empty new))).
  l12 := l1 zip: l2.
  l21 := l2 zip: l1.

  self assert: l12 isEmpty equals: false.
  self assert: l12 printString equals: '[(3, $S), (7, $P)]'.
  self assert: l21 isEmpty equals: false.
  self assert: l21 printString equals: '[($S, 3), ($P, 7)]'.
]
