private - initialization
initializeMatchList
	matchList := self instantiate: FastTableModel.
	matchList
		icons: [ :item | self matchIconFor: item ];
		menu: [ :menu | self matchListMenu: menu ];
		whenSelectionChanged: [:item | self processMatchItemSelectionChanged: item ]