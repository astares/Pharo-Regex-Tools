actions
addMatchItem
	| n |
	n := 
	UIManager default request: 'Please provide a sample that should match the regular expression.' initialAnswer: '' title: 'Add match test'.
	n ifNil: [ ^self ].
	matchList items: (matchList listItems asOrderedCollection add: n; yourself).
	matchList updateList. 