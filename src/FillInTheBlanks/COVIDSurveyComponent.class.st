"
```Smalltalk
application := WAAdmin register: COVIDSurveyComponent asApplicationAt: 'covid'.
application
	addLibrary: SBSDeploymentLibrary 
```
"
Class {
	#name : #COVIDSurveyComponent,
	#superclass : #FITBComponent,
	#instVars : [
		'responseComponents',
		'currentResponseComponent'
	],
	#category : #'FillInTheBlanks-Web'
}

{ #category : #rendering }
COVIDSurveyComponent >> addNewResponse [ 
	responseComponents addFirst: self newResponseComponent .

]

{ #category : #initalize }
COVIDSurveyComponent >> children [

	^ responseComponents
]

{ #category : #initalize }
COVIDSurveyComponent >> initialize [

	super initialize.
	responseComponents := OrderedCollection with:
		                      self newResponseComponent
]

{ #category : #rendering }
COVIDSurveyComponent >> newResponse [

  ^	FillInTheBlanksStatement fromArray: { 
			'Ayer estuve en contacto con '.
			{ 'miembro del hogar'. 'familiar'. 'conocido/a no familiar'. }.
			' (género: '.
			{ 'varón'. 'mujer'. 'otro' }.
			', edad: '.
			{ 'entre 40 y 45'. 'menos de 40'. 'mas de 45' }.
			'), con quien tengo contacto '.
			{ 'diariamente'. 'semanalmente'. 'rara vez' }.
			', por un lapso de '.
			{ 'menos de 10'. 'más de 10' }.
			' minutos. El contacto se dió a '.
			{ 'menos'. 'mas' }.
			' de un metro de distancia, barbijo '.
			{ 'tenía solo yo'. 'teníamos los dos'. 'tenía solo ella'.
			'tenía solo él' }.
			' y '.
			{ 'no'. 'si' }.
			' tuvimos contacto físico' }
]

{ #category : #rendering }
COVIDSurveyComponent >> newResponseComponent [

	^ FITBStatementVisitingComponent
		  statement: self newResponse
		  parent: self
]

{ #category : #rendering }
COVIDSurveyComponent >> renderButtonsOn: html [

	html formButton
		bePrimary;
		beSmall;
		callback: [ self addNewResponse ];
		with: 'Agregar otra'.
	html space.
	html formButton
		bePrimary;
		beSmall;
		callback: [ self show: DemographicsComponent new ];
		with: 'Enviar todo y terminar'
]

{ #category : #rendering }
COVIDSurveyComponent >> renderContentOn: html [

	html container
		style: 'margin-top:16px';
		with: [ 
			html form: [ 
					self renderButtonsOn: html.
					responseComponents do: [ :each | html render: each ] ] ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderSubmitButtonOn: html [

	responseComponents notEmpty ifTrue: [ 
		html formButton
			id: 'accept-button';
			bePrimary;
			beSmall;
			callback: [ self show: DemographicsComponent new ];
			with: 'Enviar todo y terminar' ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderSubmittedResponsesOn: html [

	html heading
		style: 'margin-top: 16px';
		level: 2;
		with: 'Respuestas anteriores'.
	responseComponents reversed do: [ :each | html render: each ].

]

{ #category : #rendering }
COVIDSurveyComponent >> style [

	^ '.response { line-height: 2;}'
]

{ #category : #rendering }
COVIDSurveyComponent >> submit [ 
	responseComponents add: currentResponseComponent .
	currentResponseComponent := self newResponseComponent .
]
