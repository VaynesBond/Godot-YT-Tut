class_name State extends Node

## Stores ref to player
static var player: PlayerUpdated

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

## What happens when the player enters this state
func Enter() -> void:
	pass

func Exit() -> void:
	pass

func Process( _delta : float) -> State:
	return null

func Physics( _delta : float) -> State:
	return null

func HandleInput( _event: InputEvent ) -> State:
	return null
