examples
exampleGitHTTPAndHTTPSURLs

	| t |
	t := self new.
	t expression: '((http|https)\://)(([\w]+)@)*([\w.]+)(\:([\d]+))*(/[\w]+)*/([\w\-]+)/([\w\-]+(.git)?)'.
	t matches: #('https://github.com/owner/repo.git' 'http://github.com/owner/repo.git' 'https://localhost/owner/repo.git' 'http://localhost/owner/repo.git' 'https://localhost/owner/repo').
	t openWithSpec 