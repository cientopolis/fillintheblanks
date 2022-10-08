Class {
	#name : #FillInTheBlanksResponse,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'choices'
	],
	#category : #'FillInTheBlanks-Model'
}

{ #category : #voyage }
FillInTheBlanksResponse class >> isVoyageRoot [
	^true.
]
