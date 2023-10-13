"An ordered pair of elements"
Class {
	#name : #Pair,
	#superclass : #Object,
	#instVars : [
		'first',
		'second'
	],
	#category : #'Examples'
}

Pair class >> new [

  self error: 'Pair should be created using first:second:'
]

Pair class >> first: e1 second: e2 [
  
  ^self basicNew initializeFirst: e1 second: e2
]

Pair >> initializeFirst: e1 second: e2 [

  first := e1.
  second := e2.
  ^self
]

Pair >> first [

  ^first
]

Pair >> second [

  ^second
]

Pair >> printOn: aStream [

	aStream
		nextPut: $(;
		print: first;
		nextPutAll: ', ';
		print: second;
		nextPut: $)
]
