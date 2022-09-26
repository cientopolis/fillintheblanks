Class {
	#name : #BaselineOfFillInTheBlanks,
	#superclass : #Object,
	#category : #BaselineOfFillInTheBlanks
}

{ #category : #baselines }
BaselineOfFillInTheBlanks >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self
			seaside: spec;
			bootstrap4: spec.
		spec
			package: 'FillInTheBlanks'
			with: [ 
			spec requires: #( 'Seaside3' 'Bootstrap4-Core' ) ] ]
]

{ #category : #baselines }
BaselineOfFillInTheBlanks >> bootstrap4: spec [

	spec
		package: 'Bootstrap4-Core'
		with: [ 
		spec repository: 'github://astares/Seaside-Bootstrap4:master/src' ]
]

{ #category : #baselines }
BaselineOfFillInTheBlanks >> seaside: spec [

	[ 
	spec
		baseline: 'Seaside3'
		with: [ 
		spec repository: 'github://SeasideSt/Seaside:master/repository' ].
	spec
		package: 'Seaside-REST-Core'
		with: [ 
		spec repository: 'github://SeasideSt/Seaside:master/repository' ] ]
]
