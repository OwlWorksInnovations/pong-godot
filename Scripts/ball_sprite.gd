extends Sprite2D

var speed: float = 500
var velocity: Vector2 = Vector2(speed, 100)
var player_1_score: int = 0
var player_2_score: int = 0
@onready var player_1_score_label: Label = $"../ScoreUI/Player1Score"
@onready var player_2_score_label: Label = $"../ScoreUI/Player2Score"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _process(delta: float) -> void:
	position += velocity * delta
	
	if position.y <= 15:
		velocity.y = -velocity.y
	elif position.y >= 633:
		velocity.y = -velocity.y
	
	if position.x >= 1167:
		player_1_score += 1
		player_1_score_label.text = str(player_1_score)
		position = Vector2(576.0, 324.0)
		velocity = Vector2(speed, randi_range(-500, 500))
	if position.x <= -30:
		player_2_score += 1
		player_2_score_label.text = str(player_2_score)
		position = Vector2(576.0, 324.0)
		velocity = Vector2(speed, randi_range(-500, 500))

func _on_ball_area_body_entered(body: Node2D) -> void:
	velocity.x = -velocity.x
	audio_stream_player_2d.play()
