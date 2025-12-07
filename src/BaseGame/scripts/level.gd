extends Node2D

#block scene used to instantiate
@onready var brickObject = preload("res://BaseGame/scenes/brick.tscn")

var columns = 32 # number of columns of blocks
var rows = 7 # number of rows of blocks
var margin = 50 # distance from edge of screen

func _ready() -> void:
	setupLevel()


func setupLevel():
	rows = min(2 + GameManager.level, 9)

	var total_width = columns * 34
	var total_height = rows * 34

	var center_offset = Vector2(
		(get_viewport_rect().size.x - total_width) / 2,
		100 # (get_viewport_rect().size.y - total_height) / 2
	)

	for r in range(rows):
		for c in range(columns):

			if randi_range(0, 2) == 0:
				continue

			var newBrick = brickObject.instantiate()
			add_child(newBrick)

			var pos = Vector2(34 * c, 34 * r) + center_offset
			newBrick.position = pos




func _process(delta: float) -> void:
	$"CanvasLayer/ScoreLabel".text = "Score: " + str(GameManager.score)
	$"CanvasLayer/LevelLabel".text = "Level: " + str(GameManager.level)
	$"CanvasLayer/LifeLabel".text = "Life: " + str(GameManager.life)



func getColors():
	var colors = [
		Color(0.699, 0.354, 1.0, 1.0),
		Color(0.549, 0.003, 0.858, 1.0),
		Color(0.419, 0.002, 0.663, 1.0),
		Color(0.252, 0.001, 0.408, 1.0)
	]
	
	return colors


# this is not finish yet
func _on_mute_sound_pressed() -> void:
	if GlovalVAR.stopmusic:
		GlovalVAR.stopmusic = false
		AudioServer.set_bus_volume_db(0, 0)
		$"CanvasLayer/MuteSound".text = "Mute the Music"
		$"CanvasLayer/Pause/ScrollContainer/VBoxContainer/muteSounds".text = "Mute the Music"
	else:
		GlovalVAR.stopmusic = true
		AudioServer.set_bus_volume_db(0, -80)
		$"CanvasLayer/MuteSound".text = "Unmute The Music"
		$"CanvasLayer/Pause/ScrollContainer/VBoxContainer/muteSounds".text = "Unmute The Music"


func _on_pause_game_pressed() -> void:
	if GlovalVAR.GameContinue:
		GlovalVAR.GameContinue = false
		GameManager.stopmusic = true
		AudioServer.set_bus_volume_db(0, -80)
		$"CanvasLayer/Pause".visible = true
	else:
		GlovalVAR.GameContinue = true
		GameManager.stopmusic = false
		AudioServer.set_bus_volume_db(0, 0)


func _on_exit_pressed() -> void:
	GameManager.score = 0
	GameManager.level = 1
	$"CanvasLayer/exit".position = Vector2(807, 556)
	get_tree().change_scene_to_file("res://Template/Scenes/Main.tscn")
