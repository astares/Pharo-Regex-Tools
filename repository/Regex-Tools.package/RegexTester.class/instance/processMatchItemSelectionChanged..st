private - event handling
processMatchItemSelectionChanged: item
	self hasValidRegularExpression ifFalse: [ resultList items: #('INVALID REGULAR EXPRESSION'). ^self ].
	matchList selectedItem 
		ifNil: [ resultList items: #('NO SAMPLE SELECTED') ]
		ifNotNil: [:selection | 
			|rx matches|
			rx := regexpression text asRegex.
			rx matches: selection.
			matches := OrderedCollection new.
			1 to: rx subexpressionCount do: [:idx | matches add: (rx subexpression: idx) ].
			resultList items: matches.
	] 