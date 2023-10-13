"A non-empty list"
Class {
	#name : #Cons,
	#superclass : #List,
	#instVars : [
		'head',
		'tail'
	],
	#category : #'Examples'
}

Cons class >> new [

  self error: 'Cons should be created using head:tail:'
]

Cons class >> head: element tail: list [
  
  ^self basicNew initializeHead: element tail: list
]

Cons >> initializeHead: element tail: list [

  head := element.
  tail := list.
  ^self
]

Cons >> head [

  ^head
]

Cons >> tail [

  ^tail
]

Cons >> zip: list [
  "Zips a list with a non-empty list"

  ^list zipCons: self
]

Cons >> zipCons: list [
  "Zips a non-empty list with another non-empty list"

  ^self class 
    head: (Pair first: list head second: self head) 
    tail: (list tail zip: self tail)
]

Cons >> printElementsOn: aStream [

  self head printOn: aStream.
  self tail isEmpty ifFalse: [ 
    aStream nextPutAll: ', '.
    self tail printElementsOn: aStream
  ]
]

Cons >> isEmpty [
  
  ^false
]
