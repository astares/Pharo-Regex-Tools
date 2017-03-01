examples
exampleBadRegExpression

	| t |
	t := self new.
	t expression: '[unfinishedregex'.
	t matches: #('simple_test@pharo.org' 'abc@def.com').
	t openWithSpec.
 