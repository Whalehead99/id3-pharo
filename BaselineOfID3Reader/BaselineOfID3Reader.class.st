Class {
	#name : #BaselineOfID3Reader,
	#superclass : #BaselineOf,
	#category : #BaselineOfID3Reader
}

{ #category : #baselines }
BaselineOfID3Reader >> baseline: spec [
	<baseline>

	spec for: #common do: [

		spec 
			package: 'ID3Reader-Core';
			package: 'ID3Reader-Tests' with: [ spec requires: #('ID3Reader-Core') ].
									].



]
