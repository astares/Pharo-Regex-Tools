private - accessing
matchListMenu: aMenu  
 
	aMenu addTitle: 'Samples'.
	aMenu add: 'Add new sample' target: self selector: #addMatchItem. 
	^ aMenu