Class {
	#name : #ID3v1TagTest,
	#superclass : #TestCase,
	#category : #'ID3Reader-Tests'
}

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> tagTitled: aTitle [

	^ self
		tagTitled: aTitle
		artist: ''
		album: ''
		year: 1900
		comment: ''
		genre: 0
]

{ #category : #helpers }
ID3v1TagTest >> tagTitled: aTitle artist: anArtistName album: anAlbumName year: aYear	comment: aComment genre: aGenreCode [

	| title artist album year comment genre |
	title := aTitle asByteArray , (ByteArray new: 30 - aTitle size).
	artist := anArtistName asByteArray , (ByteArray new: 30 - anArtistName size).
	album := anAlbumName asByteArray , (ByteArray new: 30 - anAlbumName size).
	year := aYear asString asByteArray , (ByteArray new: 4 - aYear asString size).
	comment := aComment asByteArray , (ByteArray new: 30 - aComment size).
	genre := ByteArray with: aGenreCode.
	^ ID3v1Tag withBytes: 'TAG' asByteArray , title , artist , album , year , comment , genre
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> tagWithAlbum: anAlbumName [

	^ self
		tagTitled: ''
		artist: ''
		album: anAlbumName
		year: 1900
		comment: ''
		genre: 0
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> tagWithArtist: anArtistName [

	^ self
		tagTitled: ''
		artist: anArtistName
		album: ''
		year: 1900
		comment: ''
		genre: 0
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> tagWithComment: aComment [

	^ self
		tagTitled: ''
		artist: ''
		album: ''
		year: 1900
		comment: aComment
		genre: 0
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> tagWithGenre: aGenreCode [

	^ self
		tagTitled: ''
		artist: ''
		album: ''
		year: 1900
		comment: ''
		genre: aGenreCode
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> tagWithYear: aYear [

	^ self
		tagTitled: ''
		artist: ''
		album: ''
		year: aYear
		comment: ''
		genre: 0
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> testShouldParseTheSongAlbum [

	| tag |
	tag := self tagWithAlbum: 'Piano Bar'.
	
	self assert: tag album equals: 'Piano Bar'
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> testShouldParseTheSongArtist [

	| tag |
	tag := self tagWithArtist: 'Serú Girán'.
	
	self assert: tag artist equals: 'Serú Girán'
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> testShouldParseTheSongComment [

	| tag |
	tag := self tagWithComment: 'my favourite song'.
	
	self assert: tag comment equals: 'my favourite song'
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> testShouldParseTheSongGenre [

	| tag |
	tag := self tagWithGenre: 93.
	
	self assert: tag genreCode equals: 93.
	self assert: tag genre equals: 'Psychedelic Rock'
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> testShouldParseTheSongTitle [

	| tag |
	tag := self tagTitled: 'Confesiones de invierno'.
	
	self assert: tag title equals: 'Confesiones de invierno'
]

{ #category : #'delete test as unnecessary' }
ID3v1TagTest >> testShouldParseTheSongYear [

	| tag |
	tag := self tagWithYear: 2005.
	
	self assert: tag year equals: 2005
]

{ #category : #helpers }
ID3v1TagTest >> testTagTitledArtistAlbumYearCommentGenre [

	| tag |

	tag := self tagTitled: 'what can I say' 
					artist: 'boz sKaggs' 
					album: 'silK degreeS' 
					year: 1976	
					comment: 'what a great album!' 
					genre: 0.

"change this IF we run it through normalization for first capitals"
	self 
		assert: tag title 			equals: 'what can I say'; 
		assert: tag artist 		equals: 'boz sKaggs'; 
		assert: tag album 			equals: 'silK degreeS'; 
		assert: tag year 			equals: 1976;
		assert: tag comment 		equals: 'what a great album!';
		assert: tag genreCode 	equals: 0;
		assert: tag genre 			equals: 'Blues'. 

"ID3v1Tag withBytes: 'TAG' asByteArray , title , artist , album , year , comment , genre"
]
