private - initialization
initializeRegexpressionTextInput
	regexpression := self newTextInput.
	regexpression
		ghostText: 'Enter a regular expression...';
		autoAccept: true;
		whenTextChanged: [ self updateMatches ]