"
A regular expression tester
"
Class {
	#name : #RegexTester,
	#superclass : #ComposableModel,
	#instVars : [
		'regexpression',
		'matchList',
		'resultList'
	],
	#category : 'Regex-Tools-View'
}

{ #category : #spec }
RegexTester class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newRow: #regexpression bottom: 0.85;
		addHSplitter;
		newRow: #matchList top: 0.15 bottom: 0.4;
		addHSplitter;
		newRow: #resultList top: 0.6;
		yourself
]

{ #category : #examples }
RegexTester class >> exampleBadRegExpression [

	| t |
	t := self new.
	t expression: '[unfinishedregex'.
	t matches: #('simple_test@pharo.org' 'abc@def.com').
	t openWithSpec.
 
]

{ #category : #examples }
RegexTester class >> exampleGitHTTPAndHTTPSURLs [

	| t |
	t := self new.
	t expression: '((http|https)\://)(([\w]+)@)*([\w.]+)(\:([\d]+))*(/[\w]+)*/([\w\-]+)/([\w\-]+(.git)?)'.
	t matches: #('https://github.com/owner/repo.git' 'http://github.com/owner/repo.git' 'https://localhost/owner/repo.git' 'http://localhost/owner/repo.git' 'https://localhost/owner/repo'
	'https://local_gogs/path/subpath/some-owner/repo').
	t openWithSpec 
]

{ #category : #examples }
RegexTester class >> exampleSimplifiedMail [

	| t |
	t := self new.
	t expression: '([\w]+)@([\w.]+)'.
	t matches: #('simple_test@pharo.org' 'abc@def.com' 'notMatching').
	t openWithSpec
]

{ #category : #'world menu' }
RegexTester class >> icon [

	^Smalltalk ui icons iconNamed: #testRunnerIcon
]

{ #category : #'world menu' }
RegexTester class >> menuCommandOn: aBuilder [ 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Regex Tester')
		order: 3.0; 
		icon: self icon;  
		parent: #'Tools';
		action: [ self open ].

]

{ #category : #'user interface' }
RegexTester class >> open [
	<script>
	
	^(self new)
		openWithSpec;
		updateMatches;
		yourself
]

{ #category : #actions }
RegexTester >> addMatchItem [
	| n |
	n := 
	UIManager default request: 'Please provide a sample that should match the regular expression.' initialAnswer: '' title: 'Add match test'.
	n ifNil: [ ^self ].
	matchList items: (matchList listItems asOrderedCollection add: n; yourself).
	matchList updateList. 
]

{ #category : #actions }
RegexTester >> editMatchItem [
		| oldItem newItem |
	oldItem := matchList selectedItem.
	oldItem ifNil: [^self].

	newItem := UIManager default 
		request: 'Edit sample that should match the regular expression.' 
		initialAnswer: oldItem title: 'Edit match test'.
	newItem ifNil: [ ^self ].
	
	matchList listItems at: matchList selectedIndex put: newItem.
	matchList updateList 

]

{ #category : #accessing }
RegexTester >> expression: aString [

	self regexpression text: aString
]

{ #category : #'private - testing' }
RegexTester >> hasValidRegularExpression [
	"Return true if the text keyed in is a valid regular expression"
	
	| reg |
	[ reg := regexpression text asRegex ]
			on: RegexError
			do: [^false ].
	^true		
]

{ #category : #initialization }
RegexTester >> initialExtent [

	^400@600
]

{ #category : #'private - initialization' }
RegexTester >> initializeMatchList [
	matchList := self instantiate: FastTableModel.
	matchList
		icons: [ :item | self matchIconFor: item ];
		menu: [ :menu | self matchListMenu: menu ];
		whenSelectionChanged: [:item | self processMatchItemSelectionChanged: item ]
]

{ #category : #'private - initialization' }
RegexTester >> initializeRegexpressionTextInput [
	regexpression := self newTextInput.
	regexpression
		ghostText: 'Enter a regular expression...';
		autoAccept: true;
		whenTextChanged: [ self updateMatches ]
]

{ #category : #'private - initialization' }
RegexTester >> initializeResultList [
	resultList := self instantiate: ListModel 
]

{ #category : #initialization }
RegexTester >> initializeWidgets [
	self 
		initializeRegexpressionTextInput;
	   initializeMatchList;
		initializeResultList
]

{ #category : #'private - accessing' }
RegexTester >> matchIconFor: item [
	| reg |
	[ reg := regexpression text asRegex ]
			on: RegexError
			do: [^self iconNamed: #testRed ].
 
	^ (reg matches: item)
		ifTrue: [ self iconNamed: #testGreen ]
		ifFalse: [ self iconNamed: #testYellow ]
]

{ #category : #'private - accessing' }
RegexTester >> matchList [
	^ matchList
]

{ #category : #'private - accessing' }
RegexTester >> matchList: anObject [
	matchList := anObject
]

{ #category : #'private - accessing' }
RegexTester >> matchListMenu: aMenu [  
 
	aMenu 
		addTitle: 'Samples';
		add: 'Add new sample' target: self selector: #addMatchItem; 
		add: 'Edit sample' target: self selector: #editMatchItem; 
		addLine;
		add: 'Remove sample' target: self selector: #removeMatchItem. 
	^ aMenu
]

{ #category : #accessing }
RegexTester >> matches: aCollection [

	self matchList items: aCollection
]

{ #category : #actions }
RegexTester >> openWithSpec [
	super openWithSpec.
	self updateMatches 
]

{ #category : #'private - event handling' }
RegexTester >> processMatchItemSelectionChanged: item [
	self hasValidRegularExpression ifFalse: [ resultList items: #('INVALID REGULAR EXPRESSION'). ^self ].
	matchList selectedItem 
		ifNil: [ resultList items: #('NO SAMPLE SELECTED') ]
		ifNotNil: [:selection | 
			|rx matches|
			rx := regexpression text asRegex.
			rx matches: selection.
			matches := OrderedCollection new.
			1 to: rx subexpressionCount do: [:idx | matches add: (self viewStringFor: (rx subexpressions: idx) atIndex: idx) ].
			resultList items: matches.
	] 
]

{ #category : #'private - accessing' }
RegexTester >> regexpression [
	^ regexpression
]

{ #category : #'private - accessing' }
RegexTester >> regexpression: anObject [
	regexpression := anObject
]

{ #category : #actions }
RegexTester >> removeMatchItem [
	| oldItem |
	oldItem := matchList selectedItem.
	oldItem ifNil: [ ^ self ].
	matchList listItems remove: oldItem.
	matchList updateList
]

{ #category : #accessing }
RegexTester >> resultList [
	^ resultList
]

{ #category : #accessing }
RegexTester >> resultList: anObject [
	resultList := anObject
]

{ #category : #accessing }
RegexTester >> title [

	^'Regular expression tester'
]

{ #category : #'private - updating' }
RegexTester >> updateMatches [
	 
	self regexpression widget ifNil: [ ^self ].
		self regexpression textArea textColor: (self hasValidRegularExpression 
							ifTrue: [ Smalltalk ui theme textColor ]
							ifFalse: [ Color red ]).
	matchList updateList 
	
 
]

{ #category : #'private - event handling' }
RegexTester >> viewStringFor: x [

	^x
]

{ #category : #'private - event handling' }
RegexTester >> viewStringFor: subexpressions atIndex: anIndex [
	| contents |
	contents := subexpressions size = 1 
						ifTrue: [ subexpressions first ]
						ifFalse: [ subexpressions asString ].
	
	 ^anIndex asString, ' - ', contents
	 
]
