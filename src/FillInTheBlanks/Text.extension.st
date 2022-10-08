Extension { #name : #Text }

{ #category : #'*FillInTheBlanks' }
Text >> accept: aVisitor [
	aVisitor visitText: self
]
