spec
defaultSpec
	<spec>
	
	^ SpecLayout composed
		newRow: #regexpression bottom: 0.85;
		addHSplitter;
		newRow: #matchList top: 0.15 bottom: 0.4;
		addHSplitter;
		newRow: #resultList top: 0.6;
		yourself