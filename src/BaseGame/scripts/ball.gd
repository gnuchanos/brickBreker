extends CharacterBody2D

var speed: float = 300.0
var is_active: bool = true


func _ready():
	speed += (20 * GameManager.level)
	velocity = Vector2(-1, -1).normalized() * speed





func _physics_process(delta):
	if GlovalVAR.GameContinue:
		if !is_active:
			return

		var collision = move_and_collide(velocity * delta)

		if collision:
			velocity = velocity.bounce(collision.get_normal())

			if abs(velocity.x) < 0.1:
				velocity.x = sign(velocity.x) * 0.5
			if abs(velocity.y) < 0.1:
				velocity.y = sign(velocity.y) * 0.5

			velocity = velocity.normalized() * speed

			var col = collision.get_collider()
			if col and col.has_method("hit"):
				col.hit()

func gameOver():
	if GameManager.life > 0:
		GameManager.life -= 1
		self.position = Vector2(807, 556)
		velocity = Vector2(0, -1).normalized() * speed  # repawn yukarı
	else:
		GameManager.score = 0
		GameManager.level = 1
		call_deferred("_reload_scene")

func _reload_scene():
	get_tree().reload_current_scene()


func _on_deathzone_body_entered(body: Node):
	if body == self:
		gameOver()
