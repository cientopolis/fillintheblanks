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
		'responses',
		'currentResponse'
	],
	#category : #'FillInTheBlanks-Web'
}

{ #category : #rendering }
COVIDSurveyComponent >> initialize [
	super initialize .
	currentResponse := Array new: 6.
	responses := OrderedCollection new. 
]

{ #category : #rendering }
COVIDSurveyComponent >> renderContactSelectorOn: html [
	html select
		list: {'¿quién?'. 'mi mamá' . 'mi papá'. 'un amigo'. 'una amiga'. 'mi hermanito'. 'mi hermanita'. 'alguien'};
		callback: [ :value | currentResponse at: 3 put: value ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderContactStatusOn: html [
	html select
		list: {'¿cómo?'. 'tuvimos contacto físico' . 'no tuvimos contacto físico'};
		callback: [ :value | currentResponse at: 6 put: value ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderContentOn: html [

	html container
		style: 'margin-top:16px';
		with: [ 
			self renderResponseFormOn: html.
			self renderSubmittedResponsesOn: html ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderDurationSelectorOn: html [
	html select
		list: {'¿duración?' . '5' . '10' . '15' . 'más de 15'};
		callback: [ :value | currentResponse at: 4 put: value ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderMaskStatusOn: html [
	html select
		list: {'¿barbijo?'. 'teníamos los dos' . 'tenía solo él/ella' . 'tenía solo yo' . };
		callback: [ :value | currentResponse at: 5 put: value ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderPlaceCharacteristicsSelectorOn: html [ 

	html select
		list: {'¿ventilación?'. 'cerrado'. 'abierto'};
		callback: [ :value | currentResponse at: 2 put: value ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderPlaceSelectorOn: html [
	html select
		list: {'¿donde?' . 'casa' . 'la escuela'};
		callback: [ :value | currentResponse at: 1 put: value ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderResponse: each on: html [

	html paragraph: [ 
		html text: 'En '.
		html strong: each first.
		html text: ', que es un lugar '.
		html strong: each second.
		html text: ', estuve en contacto con '.
		html strong: each third.
		html text: ' por un lapso de '.
		html strong: each fourth.
		html text: ' minutos. Barbijo '.
		html strong: each fifth.
		html text: ' y '.
		html strong: each sixth ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderResponseFormOn: html [

	html form: [ 
		html paragraph
			class: 'response';
			with: [ 
				html text: 'En '.
				self renderPlaceSelectorOn: html.
				html text: ', que es un lugar '.
				self renderPlaceCharacteristicsSelectorOn: html.
				html text: ', estuve en contacto con '.
				self renderContactSelectorOn: html.
				html text: ' por un lapso de '.
				self renderDurationSelectorOn: html.
				html text: ' minutos. Barbijo '.
				self renderMaskStatusOn: html.
				html text: ' y '.
				self renderContactStatusOn: html.
				html space.
				html formButton
					id: 'accept-button';
					bePrimary;
					beSmall;
					style: 'line-height: 1;';
					callback: [ self submit ];
					with: 'Agregar respuesta' ] ]
]

{ #category : #rendering }
COVIDSurveyComponent >> renderSubmittedResponsesOn: html [

	html heading
		style: 'margin-top: 16px';
		level: 2;
		with: 'Respuestas anteriores'.
	responses reversed do: [ :each | self renderResponse: each on: html ].
	responses notEmpty ifTrue: [ 
		html form: [ 
			html formButton
				id: 'accept-button';
				bePrimary;
				beSmall;
				callback: [ self show: DemographicsComponent new ];
				with: 'Enviar todo y terminar' ] ]
]

{ #category : #rendering }
COVIDSurveyComponent >> style [

	^ '.response { line-height: 2;}'
]

{ #category : #rendering }
COVIDSurveyComponent >> submit [ 
	responses add: currentResponse .
	currentResponse := Array new: 6.
]
