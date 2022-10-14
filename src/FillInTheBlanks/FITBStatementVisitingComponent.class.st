Class {
	#name : #FITBStatementVisitingComponent,
	#superclass : #FITBComponent,
	#instVars : [
		'isEditing',
		'statement',
		'visitingCanvas',
		'parent'
	],
	#category : #'FillInTheBlanks-Web'
}

{ #category : #'instance-creation' }
FITBStatementVisitingComponent class >> statement: aStatement parent: aComponent [

	^ self new
		  statement: aStatement parent: aComponent;
		  yourself
]

{ #category : #accessing }
FITBStatementVisitingComponent >> initialize [

	super initialize.
	isEditing := true
]

{ #category : #rendering }
FITBStatementVisitingComponent >> renderAcceptButtonOn: html [

	isEditing ifFalse: [ ^ self ].
	html formButton
		id: 'accept-button';
		bePrimary;
		beSmall;
		style: 'line-height: 1;';
		callback: [ self submit ];
		with: 'Agregar respuesta'
]

{ #category : #rendering }
FITBStatementVisitingComponent >> renderContentOn: html [

	html paragraph
		class: 'response';
		with: [ 
			visitingCanvas := html.
			statement accept: self.
			visitingCanvas := nil ]
]

{ #category : #accessing }
FITBStatementVisitingComponent >> statement [

	^ statement
]

{ #category : #accessing }
FITBStatementVisitingComponent >> statement: anObject parent: aComponent [

	parent := aComponent.
	statement := anObject
]

{ #category : #rendering }
FITBStatementVisitingComponent >> submit [ 
  parent submit.
  isEditing := true. 
]

{ #category : #rendering }
FITBStatementVisitingComponent >> visitChoice: aChoice [

	isEditing
		ifTrue: [ 
			visitingCanvas select
				list: (aChoice choices copyWith: nil);
				selected: aChoice selected;
				onChange: (visitingCanvas jQuery ajax serializeForm);
				callback: [ :value | aChoice selected: value ] ]
		ifFalse: [ visitingCanvas text: aChoice selected ]
]

{ #category : #rendering }
FITBStatementVisitingComponent >> visitText: aText [

  	visitingCanvas text: aText
]
