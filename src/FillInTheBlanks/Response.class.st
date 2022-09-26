Class {
	#name : #Response,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'choices'
	],
	#category : #'FillInTheBlanks-Model'
}

{ #category : #voyage }
Response class >> isVoyageRoot [
	^true.
]
