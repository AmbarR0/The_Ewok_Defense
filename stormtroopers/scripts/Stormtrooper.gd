extends CharacterBody2D

const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var anim_tree : AnimationNodeStateMachinePlayback
var lifePoints = 5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 0

func _ready():
	$Sprite2D.flip_h = true
	anim_tree = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	velocity.y += gravity * delta
	if not is_on_floor():
		anim_tree.travel("fall")
	else:
		anim_tree.travel("walk") 
		direction = -1
		velocity.x = direction * 2
	move_and_slide()

