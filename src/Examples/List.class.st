"An ordered list of elements whose instances are either Empty or Cons"
Class {
	#name : #List,
	#superclass : #Object,
	#category : #'Examples'
}

List class >> new [

  ^Empty new
]

List class >> new: element [

  ^Cons head: element tail: Empty new
]

List >> zip: list [

  ^self subclassResponsibility
]

List >> zipCons: list [

  ^self subclassResponsibility
]

List >> printOn: aStream [

	aStream nextPut: $[.
	self printElementsOn: aStream.
	aStream nextPut: $]
]

List >> printElementsOn: aStream [

  ^self subclassResponsibility
]
