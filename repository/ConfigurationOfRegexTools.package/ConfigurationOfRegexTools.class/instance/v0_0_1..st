versions
v0_0_1: spec
	<version: '0.0.1'>

	spec for: #'common' do: [ 
		spec blessing: #'stable'.
		spec
			baseline: 'RegexTools' with: [ 
				spec 
					className: 'BaselineOfRegexTools';
					repository: 'github://astares/Pharo-Regex-Tools:0.0.1/repository' ]]