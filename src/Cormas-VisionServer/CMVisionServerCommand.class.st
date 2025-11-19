Class {
	#name : 'CMVisionServerCommand',
	#superclass : 'CMSpacePresenterToggleCommand',
	#classInstVars : [
		'server'
	],
	#category : 'Cormas-VisionServer',
	#package : 'Cormas-VisionServer'
}

{ #category : 'accessing' }
CMVisionServerCommand class >> server [

	^ server ifNil: [ server := CMGameServer new ] 
]

{ #category : 'accessing' }
CMVisionServerCommand >> actionWhenOff [

	self class server stop
]

{ #category : 'accessing' }
CMVisionServerCommand >> actionWhenOn [

	self class server startOn: 8081
]

{ #category : 'accessing' }
CMVisionServerCommand >> iconWhenOff [

	^ CMIcons runIcon
]

{ #category : 'accessing' }
CMVisionServerCommand >> iconWhenOn [
	^self iconNamed: #cancel
]

{ #category : 'accessing' }
CMVisionServerCommand >> initialize [

	super initialize.

	self class server whenDataReceivedDo: [ :data :clientId |
			| occupiedCellIds harvesters |
			1 halt.
			occupiedCellIds := data at: 'occupiedCells'.
			harvesters := owner cormasModel @@ PCHarvester.

			harvesters do: #leave.

			occupiedCellIds
				with: (harvesters first: occupiedCellIds size)
				do: [ :id :harvester |
				harvester moveTo: (owner cormasModel cellAt: id) ].

			owner updateDiagram ]
]

{ #category : 'accessing' }
CMVisionServerCommand >> nameWhenOff [ 
	^'Start Server'
]

{ #category : 'accessing' }
CMVisionServerCommand >> nameWhenOn [ 
	^'Stop Server'
]
