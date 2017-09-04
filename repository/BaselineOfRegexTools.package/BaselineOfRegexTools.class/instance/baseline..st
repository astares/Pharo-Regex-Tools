baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec package: #'Regex-Tools'.
			"Groups"
			spec
				group: 'all' with: #(#'Regex-Tools');
				group: 'default' with: #('all') ]