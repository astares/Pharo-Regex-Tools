"
Configuration for GitHub API
"
Class {
	#name : #ConfigurationOfRegexTools,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfRegexTools'
}

{ #category : #'development support' }
ConfigurationOfRegexTools class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>
]

{ #category : #private }
ConfigurationOfRegexTools class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #'ConfigurationOf'
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #'ConfigurationOf' ifAbsent: aBlock ].
]

{ #category : #catalog }
ConfigurationOfRegexTools class >> catalogChangeLog [
	"Returns a paragraph describing the most important changes in the configuration class."
	^ ''
]

{ #category : #catalog }
ConfigurationOfRegexTools class >> catalogContactInfo [
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	^ ''
]

{ #category : #catalog }
ConfigurationOfRegexTools class >> catalogDescription [
	"Returns a paragraph describing the project"
	^ 'A tool to test and verify regular expressions'
]

{ #category : #catalog }
ConfigurationOfRegexTools class >> catalogKeyClassesAndExample [
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ ''
]

{ #category : #catalog }
ConfigurationOfRegexTools class >> catalogKeywords [
	"Returns an array of symbols"
	^ #(regex utilities) 
]

{ #category : #private }
ConfigurationOfRegexTools class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfRegexTools class >> ensureMetacelloBaseConfiguration [
  Smalltalk
    at: #'ConfigurationOf'
    ifAbsent: [ 
      | repository version |
      repository := MCHttpRepository
        location: 'http://smalltalkhub.com/mc/dkh/metacello/main'
        user: ''
        password: ''.
      repository
        versionReaderForFileNamed: 'Metacello-Base-dkh.107'
        do: [ :reader | 
          version := reader version.
          version load.
          version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfRegexTools class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfRegexTools class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfRegexTools class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfRegexTools class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfRegexTools class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfRegexTools class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #accessing }
ConfigurationOfRegexTools >> customProjectAttributes [
    "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes "

    ^ #()
]

{ #category : #versions }
ConfigurationOfRegexTools >> dev: spec [
	<version: 'dev'>

	spec for: #'common' do: [ 
		spec blessing: #'development'.
		spec
			baseline: 'RegexTools' with: [ 
				spec 
					className: 'BaselineOfRegexTools';
					repository: 'github://astares/Pharo-Regex-Tools:master/repository' ]].
]

{ #category : #'symbolic versions' }
ConfigurationOfRegexTools >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: 'dev'.

]

{ #category : #versions }
ConfigurationOfRegexTools >> pharo7: spec [
	<version: '7.0'>

	spec for: #'common' do: [ 
		spec blessing: #'stable'.
		spec
			baseline: 'RegexTools' with: [ 
				spec 
					className: 'BaselineOfRegexTools';
					repository: 'github://astares/Pharo-Regex-Tools:pharo7/repository' ]]
]

{ #category : #accessing }
ConfigurationOfRegexTools >> project [
    ^ project
        ifNil: [ 
            "Bootstrap Metacello if it is not already loaded"
            self class ensureMetacello.
            project := MetacelloMCProject new projectAttributes: self customProjectAttributes.	"Create the Metacello project"
            (Smalltalk at: #'MetacelloVersionConstructor') on: self project: project.	"Construct the project"
            project loadType: #'linear'.	"change to #atomic if desired"
            project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfRegexTools >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'pharo5.x' version: '0.0.2'.
	spec for: #'pharo6.x' version: '0.0.2'.	
	spec for: #'common' version: '7.0'.	
]

{ #category : #versions }
ConfigurationOfRegexTools >> v0_0_1: spec [
	<version: '0.0.1'>

	spec for: #'common' do: [ 
		spec blessing: #'stable'.
		spec
			baseline: 'RegexTools' with: [ 
				spec 
					className: 'BaselineOfRegexTools';
					repository: 'github://astares/Pharo-Regex-Tools:0.0.1/repository' ]]
]

{ #category : #versions }
ConfigurationOfRegexTools >> v0_0_2: spec [
	<version: '0.0.2'>

	spec for: #'common' do: [ 
		spec blessing: #'stable'.
		spec
			baseline: 'RegexTools' with: [ 
				spec 
					className: 'BaselineOfRegexTools';
					repository: 'github://astares/Pharo-Regex-Tools:0.0.2/repository' ]]
]
