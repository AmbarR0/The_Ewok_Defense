extends CharacterBody2D
var timer : Timer

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var picked = false
var waiting = false
var waitingLife = 5

func _ready():
	timer = $Timer
	
func _physics_process(delta):
	# Add the gravity.
	if not picked:
		if not is_on_floor():
			velocity.y += gravity * delta
		else:
			if(!waiting):
				waiting = true
				timer.start()
			if(waitingLife == 0):
				die()
	move_and_slide()

signal item_picked
func sum_to_ewok_items():
	emit_signal("item_picked")

func die():
	var tween = create_tween()
	timer.stop()
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	tween.tween_callback(self.queue_free)

func _on_area_2d_body_entered(body):
	var tween = create_tween()
	picked = true
	timer.stop()
	tween.tween_property(self, "position", position + Vector2(0,-30), 0.3)
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	tween.tween_callback(self.sum_to_ewok_items)
	tween.tween_callback(self.queue_free)


func _on_timer_timeout():
	waitingLife -= 1
