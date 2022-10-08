Class {
	#name : #ResponseRepository,
	#superclass : #Object,
	#category : #'FillInTheBlanks-Persistency'
}

{ #category : #accessing }
ResponseRepository >> responses [ 
	^FillInTheBlanksResponse selectAll.
]
