examples
exampleSimplifiedMail

	| t |
	t := self new.
	t expression: '([\w]+)@([\w.]+)'.
	t matches: #('simple_test@pharo.org' 'abc@def.com' 'notMatching').
	t openWithSpec