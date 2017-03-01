private - event handling
viewStringFor: subexpressions atIndex: anIndex
	| contents |
	contents := subexpressions size = 1 
						ifTrue: [ subexpressions first ]
						ifFalse: [ subexpressions asString ].
	
	 ^anIndex asString, ' - ', contents
	 