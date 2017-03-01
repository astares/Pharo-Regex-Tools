private - updating
updateMatches
	 
	self regexpression widget ifNil: [ ^self ].
		self regexpression textArea textColor: (self hasValidRegularExpression 
							ifTrue: [ Smalltalk ui theme textColor ]
							ifFalse: [ Color red ]).
	matchList updateList 
	
 