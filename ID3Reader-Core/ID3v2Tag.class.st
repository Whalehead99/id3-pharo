Class {
	#name : #ID3v2Tag,
	#superclass : #Object,
	#instVars : [
		'header',
		'frames'
	],
	#category : #'ID3Reader-Core'
}

{ #category : #'instance creation' }
ID3v2Tag class >> withHeader: aHeader andFrames: aCollectionOfFrames [

	^ self new initializeWithHeader: aHeader andFrames: aCollectionOfFrames
]

{ #category : #fields }
ID3v2Tag >> album [

	^ self contentOfFrameIdentifiedWith: self albumFrameId
]

{ #category : #'frame ids' }
ID3v2Tag >> albumFrameId [
	"according to http://id3.org/id3v2.4.0-frames"

	^ 'TALB'
]

{ #category : #fields }
ID3v2Tag >> artist [

	^ self contentOfFrameIdentifiedWith: self artistFrameId
]

{ #category : #'frame ids' }
ID3v2Tag >> artistFrameId [
	"according to http://id3.org/id3v2.4.0-frames"

	^ 'TPE1'
]

{ #category : #'private - frames' }
ID3v2Tag >> contentOfFrameIdentifiedWith: aFrameId [

	^ (self frameIdentifiedWith: aFrameId) content
]

{ #category : #'private - frames' }
ID3v2Tag >> frameIdentifiedWith: aFrameId [

	^ frames
		detect: [ :frame | frame isIdentifiedWith: aFrameId ]
		ifNone: [ FrameNotFoundError signal: aFrameId ]
]

{ #category : #initialization }
ID3v2Tag >> initializeWithHeader: aHeader andFrames: aCollectionOfFrames [

	header := aHeader.
	frames := aCollectionOfFrames
]

{ #category : #fields }
ID3v2Tag >> title [

	^ self contentOfFrameIdentifiedWith: self titleFrameId
]

{ #category : #'frame ids' }
ID3v2Tag >> titleFrameId [
	"according to http://id3.org/id3v2.4.0-frames"

	^ 'TIT2'
]
