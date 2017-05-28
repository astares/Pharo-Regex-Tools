actions
removeMatchItem
	| oldItem |
	oldItem := matchList selectedItem.
	oldItem ifNil: [ ^ self ].
	matchList listItems remove: oldItem.
	matchList updateList