actions
editMatchItem
		| oldItem newItem |
	oldItem := matchList selectedItem.
	oldItem ifNil: [^self].

	newItem := UIManager default 
		request: 'Edit sample that should match the regular expression.' 
		initialAnswer: oldItem title: 'Edit match test'.
	newItem ifNil: [ ^self ].
	
	matchList listItems at: matchList selectedIndex put: newItem.
	matchList updateList 
