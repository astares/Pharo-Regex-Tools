private - accessing
matchListMenu: aMenu  
 
	aMenu 
		addTitle: 'Samples';
		add: 'Add new sample' target: self selector: #addMatchItem; 
		add: 'Edit sample' target: self selector: #editMatchItem; 
		addLine;
		add: 'Remove sample' target: self selector: #removeMatchItem. 
	^ aMenu