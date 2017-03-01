private - testing
hasValidRegularExpression
	"Return true if the text keyed in is a valid regular expression"
	
	| reg |
	[ reg := regexpression text asRegex ]
			on: RegexError
			do: [^false ].
	^true		