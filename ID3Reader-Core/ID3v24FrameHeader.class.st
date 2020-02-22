Class {
	#name : #ID3v24FrameHeader,
	#superclass : #ID3v24TagFragment,
	#category : #'ID3Reader-Core'
}

{ #category : #fields }
ID3v24FrameHeader >> id [

	^ self idBytes asString
]

{ #category : #private }
ID3v24FrameHeader >> idBytes [

	^ bytes first: 4
]

{ #category : #fields }
ID3v24FrameHeader >> size [

	^ self synchsafeDecode: self sizeBytes
]

{ #category : #private }
ID3v24FrameHeader >> sizeBytes [

	^ bytes copyFrom: 5 to: 8
]
