versions
v0_0_2: spec
	<version: '0.0.2'>

	spec for: #'common' do: [ 
		spec blessing: #'stable'.
		spec
			baseline: 'RegexTools' with: [ 
				spec 
					className: 'BaselineOfRegexTools';
					repository: 'github://astares/Pharo-Regex-Tools:0.0.2/repository' ]]