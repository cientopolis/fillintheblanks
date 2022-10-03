Class {
	#name : #DemographicsComponent,
	#superclass : #FITBComponent,
	#category : #'FillInTheBlanks-Web'
}

{ #category : #rendering }
DemographicsComponent >> comboFor: variable with: options on: html [

	| select id |
	id := variable asCamelCase asValidSelector.
	html formGroup: [ 
		html label
			for: id;
			with: [ html text: variable ].
		select := html select.
		select
			formControl;
			list: options;
			callback: [ :value |  ];
			selected: nil;
			id: id ]
]

{ #category : #rendering }
DemographicsComponent >> proceed [ 
	self show: COVIDSurveyComponent new. 
]

{ #category : #rendering }
DemographicsComponent >> renderContentOn: html [

	html container
		style: 'margin-top:16px';
		with: [ 
			html form: [ 
					self
						comboFor: 'Género'
						with: { nil. 'Varón'. 'Mujer'. 'Otro'. 'No contesta' }
						on: html.
					self
						comboFor: 'Máximo nivel educativo alcanzado'
						with:
							{ nil . 'Sin estudios'. 'Primeraio incompleto'. 'Primario completo'.
							'No contesta' }
						on: html.
					self
						comboFor: 'Actualmente usted se encuentra ...'
						with:
							{ nil. 'Trabajando'. 'Buscando trabajo'. 'Inactivo'. 'No contesta' }
						on: html.
					html paragraph: [ 
							html formButton
								id: 'accept-button';
								beSmall;
								bePrimary;
								callback: [ self proceed ];
								with: 'Continuar' ] ] ]
]
