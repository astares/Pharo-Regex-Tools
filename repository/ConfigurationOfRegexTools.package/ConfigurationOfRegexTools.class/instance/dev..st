versions
dev: spec
	<version: 'dev'>

	spec for: #'common' do: [ 
		spec blessing: #'development'.
		spec
			baseline: 'RegexTools' with: [ 
				spec 
					className: 'BaselineOfRegexTools';
					repository: 'github://astares/Pharo-Regex-Tools:master/repository' ]].