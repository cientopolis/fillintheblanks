"
```Smalltalk
FillInTheBlanksQuestion fromArray:
{'Estuve en contacto con '. {'mi papá'. 'mi mamá'. 'mi hermana'. 'mi hermano'. 'una amiga'. 'un amigo'.}. ' (género: '. {'varón'. 'mujer'. 'otro'}. ', edad: '. {'entre 40 y 45'. 'menos de 40'. 'mas de 45'.}. '), con quien tengo contacto '. {   'diariamente'. 'semanalmente'. 'rara vez'}. ', por un lapso de '. { 'menos de 10'. 'más de 10'}. ' minutos. El contacto se dió a '. {'menos'. 'mas'.}. ' de un metro de distancia, barbijo '. {'tenía solo yo'. 'teníamos los dos'. 'tenía solo ella'. 'tenía solo él'}. ' y '. {'no'. 'si'.}. ' tuvimos contacto físico'.} .

```
"
Class {
	#name : #FillInTheBlanksQuestion,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'FillInTheBlanks-Model'
}

{ #category : #'instance creation' }
FillInTheBlanksQuestion class >> fromArray: anArrayOfStringsAndArrays [

	| question |
	question := self new.
	anArrayOfStringsAndArrays do: [ :each | 
		each class = Array
			ifTrue: [ question add: (Choice choices: each) ]
			ifFalse: [ question add: each ] ].
	^ question
]

{ #category : #accessing }
FillInTheBlanksQuestion >> add: anObject [ 
	elements add: anObject
]

{ #category : #initialization }
FillInTheBlanksQuestion >> initialize [
	elements := OrderedCollection new. 
]

{ #category : #printing }
FillInTheBlanksQuestion >> printOn: aStream [

	elements do: [ :each | 
		each class = Array
			ifTrue: [ each first printOn: aStream ]
			ifFalse: [ each printOn: aStream ] ]
]
