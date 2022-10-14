"
#Simple example

```Smalltalk
{'Estuve en contacto con '. {'mi papá'. 'mi mamá'. 'mi hermana'. 'mi hermano'. 'una amiga'. 'un amigo'.}. '(género: '. {'varón'. 'mujer'. 'otro'}. ', edad:'. {'entre 40 y 45'. 'menos de 40'. 'mas de 45'.}. '), con quien tengo contacto '. {   'diariamente'. 'semanalmente'. 'rara vez'}. ', por un lapso de '. { 'menos de 10'. 'más de 10'}. ' minutos. El contacto se dió a '. {'menos'. 'mas'.}. 'de un metro de distancia, barbijo '. {'tenía solo yo'. 'teníamos los dos'. 'tenía solo ella'. 'tenía solo él'}. ' y '. {'no'. 'si'.}. 'tuvimos contacto físico'.} . 
```
"
Class {
	#name : #Choice,
	#superclass : #Object,
	#instVars : [
		'choices',
		'selected'
	],
	#category : #'FillInTheBlanks-Model'
}

{ #category : #'instance creation' }
Choice class >> choices: aCollectionOfStrings [

	^ self new
		  choices: aCollectionOfStrings;
		  yourself
]

{ #category : #visiting }
Choice >> accept: aVisitor [
	aVisitor visitChoice: self
]

{ #category : #accessing }
Choice >> choices [

	^ choices
]

{ #category : #initialization }
Choice >> choices: aCollectionOfStrings [

	^ choices := aCollectionOfStrings
]

{ #category : #accessing }
Choice >> selected [

	^ selected
]

{ #category : #accessing }
Choice >> selected: anObject [

	selected := anObject
]
