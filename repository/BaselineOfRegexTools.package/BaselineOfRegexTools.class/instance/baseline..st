baseline
baseline: spec
  <baseline>
  spec
    for: #(common)
    do: [ 
		spec blessing: #baseline.
      spec
        package: 'Regex-Tools'.
      spec
        group: 'default'
        with: #('Regex-Tools').
		spec
			group: 'development'
			with: #('default').
   ]
