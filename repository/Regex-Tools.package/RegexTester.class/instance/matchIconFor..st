private - accessing
matchIconFor: item
	| reg |
	[ reg := regexpression text asRegex ]
			on: RegexError
			do: [^self iconNamed: #testRed ].
 
	^ (reg matches: item)
		ifTrue: [ self iconNamed: #testGreen ]
		ifFalse: [ self iconNamed: #testYellow ]