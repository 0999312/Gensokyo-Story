extends Entity

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const A = 500
var MAX_SPEED = 128
const Ff = 500

onready var animationPlayer = get_node("AnimationPlayer")
onready var animationTree = get_node("AnimationTree")
onready var animationState = animationTree.get("parameters/playback")

var velocity = Vector2.ZERO

func _physics_process(delta) :
	if Input.get_action_strength("Dash"):
		MAX_SPEED = 256
	else :
		MAX_SPEED = 128
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input_vector.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO :
		animationTree.set("parameters/chara_standby/blend_position", input_vector)
		animationTree.set("parameters/chara_move/blend_position", input_vector)
		animationState.travel("chara_move")
		velocity = velocity.move_toward(input_vector * MAX_SPEED , A * delta)
	else :
		animationState.travel("chara_standby")
		velocity = velocity.move_toward(Vector2.ZERO, Ff * delta)
		
	velocity = move_and_slide(velocity)


