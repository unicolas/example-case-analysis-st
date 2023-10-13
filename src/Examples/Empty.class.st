"An empty list"
Class {
	#name : #Empty,
	#superclass : #List,
	#category : #'Examples'
}

Empty class >> new [

  ^self basicNew
]

Empty >> zip: list [
  "Zip list with empty list"

  ^self class new
]

Empty >> zipCons: list [
  "Zip non empty list with empty list"

  ^self class new
]

List >> printElementsOn: aStream [
  "Nothing to print"
]

Empty >> isEmpty [
  
  ^true
]
