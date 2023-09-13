extends CharacterBody2D

var speed = 150.0
var jump_speed = -600.0
var push_force = 80.0
var direction = 0
var gravity = 981
var anim_tree : AnimationNodeStateMachinePlayback

func _ready():
	anim_tree = $AnimationTree.get("parameters/playback")
	
func _physics_process(delta):
	velocity.y += gravity * delta
	if is_on_floor():
		if velocity.x != 0:
			anim_tree.travel("walk")
		else:
			anim_tree.travel("idle")
		
	if velocity.y < 0:
		anim_tree.travel("jump")
	else:
		if not is_on_floor():
			anim_tree.travel("fall")
	
	if Input.is_action_pressed("left"):
		direction = -1
		$Sprite2D.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		$Sprite2D.flip_h = false
	else:
		direction = 0
	velocity.x = direction * speed
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_speed
	
	move_and_slide()

	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	
