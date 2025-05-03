class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1,20,0.5) var decelerate_speed : float = 5

@onready var walk: State = $"../walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@onready var idle: State = $"../idle"
@onready var attack_anim: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"

## What happens when the player enters this state
func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_anim.play( "attack_" + player.AnimDirection() )
	animation_player.animation_finished.connect( EndAttack )
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	
	#change true to false for different effects
	attacking = true
	pass
 
func Process( _delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

func Physics( _delta : float) -> State:
	return null

func HandleInput( _event: InputEvent ) -> State:
	return null

func EndAttack( _newAnimName : String ) -> void:
	attacking = false

## When the player exits the state
func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	pass
