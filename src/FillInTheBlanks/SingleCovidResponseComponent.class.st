Class {
	#name : #SingleCovidResponseComponent,
	#superclass : #FITBComponent,
	#instVars : [
		'choices'
	],
	#category : #'FillInTheBlanks-Web'
}

{ #category : #initialize }
SingleCovidResponseComponent >> initialize [
	super initialize .
	choices := Dictionary new. 
]
