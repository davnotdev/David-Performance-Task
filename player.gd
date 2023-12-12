extends Area2D


@export var speed = 400
@onready var bg_music = $"../BGMusic"
@onready var enemy_hit = $"../EnemyHit"


func _process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_left"):
		velocity.x += -1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y += -1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	position += velocity.normalized() * speed * delta

	pass


func _on_body_entered(body):
	enemy_hit.play()
	bg_music.stop()
	print("Goodbye World!")
	hide()
