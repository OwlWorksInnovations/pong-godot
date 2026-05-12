extends CharacterBody2D

var speed: float = 300

func _process(delta: float) -> void:
	if Input.is_action_pressed("player_1_up"):
		if position.y <= 90:
			pass
		else:
			position.y -= speed * delta
	
	if Input.is_action_pressed("player_1_down"):
		if position.y >= 558:
			pass
		else:
			position.y += speed * delta
