extends Window

var MusicList = [
	preload("res://Template/Musics/1.ogg"),
	preload("res://Template/Musics/2.ogg"),
	preload("res://Template/Musics/3.ogg"),
	preload("res://Template/Musics/4.ogg"),
	preload("res://Template/Musics/5.ogg"),
	preload("res://Template/Musics/6.ogg"),
	preload("res://Template/Musics/7.ogg"),
	preload("res://Template/Musics/8.ogg"),
	preload("res://Template/Musics/9.ogg"),
	preload("res://Template/Musics/10.ogg"),
	preload("res://Template/Musics/11.ogg"),
	preload("res://Template/Musics/12.ogg"),
	preload("res://Template/Musics/13.ogg"), ]
var MusicIndex = 0
var MusicStart = false
@onready var MusicPlayer = $AudioStreamPlayer

func _ready() -> void:
	print(MusicList.size())

func _process(_delta: float) -> void:
	if MusicStart:
		if not MusicPlayer.playing:
			MusicPlayer.play()


func _on_close_requested() -> void:
	self.visible = false


func _on_before_pressed() -> void:
	if MusicIndex > 0:
		MusicIndex -= 1
		MusicPlayer.stop()
		MusicPlayer.stream = MusicList[MusicIndex]
func _on_play_pressed() -> void:
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_stop_pressed() -> void:
	MusicPlayer.stop()
	MusicStart = false
func _on_after_pressed() -> void:
	if MusicIndex < MusicList.size()-1:
		MusicIndex += 1
		MusicPlayer.stop()
		MusicPlayer.stream = MusicList[MusicIndex]

# buttons 1



func _on_music_1_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 1
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_2_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 2
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_3_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 3
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_4_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 4
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_5_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 5
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_6_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 6
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_7_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 7
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_8_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 8
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_9_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 9
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_10_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 10
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_11_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 11
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_12_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 12
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
func _on_music_13_pressed() -> void:
	MusicPlayer.stop()
	MusicIndex = 13
	MusicPlayer.stream = MusicList[MusicIndex]
	MusicStart = true
