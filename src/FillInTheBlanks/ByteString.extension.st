Extension { #name : #ByteString }

{ #category : #'*FillInTheBlanks' }
ByteString >> accept: aVisitor [
	aVisitor visitText: self
]
