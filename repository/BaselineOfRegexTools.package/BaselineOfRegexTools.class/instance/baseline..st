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
        group: 'all'
        with: #('Regex-Tools').
		spec
			group: 'default'
			with: #('all').
   ]
