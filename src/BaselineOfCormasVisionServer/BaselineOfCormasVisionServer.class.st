Class {
	#name : 'BaselineOfCormasVisionServer',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfCormasVisionServer',
	#package : 'BaselineOfCormasVisionServer'
}

{ #category : 'baselines' }
BaselineOfCormasVisionServer >> baseline: spec [

	<baseline>
	spec for: #common do: [
			self specForBaselines: spec.
			"Packages"
			spec
				package: 'Cormas-VisionServer'
				with: [ spec requires: #( CormasGameServer ) ] ]
]

{ #category : 'specs' }
BaselineOfCormasVisionServer >> specForBaselines: spec [

	spec
		baseline: 'CormasGameServer'
		with: [ spec repository: 'github://cormas/cormas-game-server:main' ].
]
