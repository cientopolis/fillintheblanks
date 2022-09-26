Class {
	#name : #FITBComponent,
	#superclass : #WAComponent,
	#category : #'FillInTheBlanks-Web'
}

{ #category : #rendering }
FITBComponent >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : #rendering }
FITBComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	aWARoot
		beHtml5.
	aWARoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1.0'.
	aWARoot stylesheet
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'
]
