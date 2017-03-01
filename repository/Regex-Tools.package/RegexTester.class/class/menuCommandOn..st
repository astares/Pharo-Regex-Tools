world menu
menuCommandOn: aBuilder 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Regex Tester')
		order: 3.0; 
		icon: self icon;  
		parent: #'Tools';
		action: [ self open ].
