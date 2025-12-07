extends Window


var _Music1 = preload("res://Template/Musics/1.ogg")
var _Music2 = preload("res://Template/Musics/2.ogg")
var _Music3 = preload("res://Template/Musics/3.ogg")
var _Music4 = preload("res://Template/Musics/4.ogg")
var _Music5 = preload("res://Template/Musics/5.ogg")
var _Music6 = preload("res://Template/Musics/6.ogg")
var _Music7 = preload("res://Template/Musics/7.ogg")
var _Music8 = preload("res://Template/Musics/8.ogg")
var _Music9 = preload("res://Template/Musics/9.ogg")
var _Music10 = preload("res://Template/Musics/10.ogg")
var _Music11 = preload("res://Template/Musics/11.ogg")
var _Music12 = preload("res://Template/Musics/12.ogg")
var _Music13 = preload("res://Template/Musics/13.ogg")



@onready var AudioPlayer = $"AudioStreamPlayer"

var alarmSoundActive = false

var second = 0
var minute = 0
var hour = 0
var alarmReady = false
var alarmFinish = false

func _process(delta: float) -> void:
	if alarmReady:
		if second < 60 and minute != 0:
			second += 1 * delta
		else:
			second = 0
			if minute == 0:
				if hour > 0:
					hour -= 1
					minute = 60
				else:
					alarmFinish = true
					alarmReady = false
			else:
				minute -= 1
		$HBoxContainer/VBoxContainer/time.text = str(hour) + " : " + str(minute) + " : " + str(int(second))
	else:
		if alarmFinish:
			if not AudioPlayer.playing:
				AudioPlayer.play()
				$HBoxContainer/VBoxContainer/time.text = str(hour) + " : " + str(minute) + " : " + str(int(second)) + " Alarm Finish"




func _on_close_requested() -> void:
	self.visible = false


func _on_start_pressed() -> void:
	if alarmSoundActive:
		alarmReady = true
		hour = int($HBoxContainer/VBoxContainer/HBoxContainer2/hour.text)
		minute = int($HBoxContainer/VBoxContainer/HBoxContainer2/minute.text)

		if len($HBoxContainer/VBoxContainer/HBoxContainer2/second.text) > 0:
			second = int($HBoxContainer/VBoxContainer/HBoxContainer2/second.text)
		else:
			second = 0

	else:
		$HBoxContainer/VBoxContainer/time.text = "Select Audio"

func _on_stop_pressed() -> void:
	alarmReady = false
	alarmFinish = false
	AudioPlayer.stop() 

func _on_clear_pressed() -> void:
	alarmFinish = false
	alarmReady = false
	second = 0
	minute = 0
	hour = 0
	$HBoxContainer/VBoxContainer/time.text = ""
	AudioPlayer.stop() 


func _on_cyber_ware_1_pressed() -> void:
	AudioPlayer.stream = _Music1
	alarmSoundActive = true
func _on_cyber_ware_2_pressed() -> void:
	AudioPlayer.stream = _Music2
	alarmSoundActive = true
func _on_cyber_ware_3_pressed() -> void:
	AudioPlayer.stream = _Music3
	alarmSoundActive = true
func _on_cyber_ware_4_pressed() -> void:
	AudioPlayer.stream = _Music4
	alarmSoundActive = true
func _on_cyber_ware_5_pressed() -> void:
	AudioPlayer.stream = _Music5
	alarmSoundActive = true
func _on_cyber_ware_6_pressed() -> void:
	AudioPlayer.stream = _Music6
	alarmSoundActive = true
func _on_cyber_ware_7_pressed() -> void:
	AudioPlayer.stream = _Music7
	alarmSoundActive = true
func _on_cyber_ware_8_pressed() -> void:
	AudioPlayer.stream = _Music8
	alarmSoundActive = true
func _on_cyber_ware_9_pressed() -> void:
	AudioPlayer.stream = _Music9
	alarmSoundActive = true
func _on_cyber_ware_10_pressed() -> void:
	AudioPlayer.stream = _Music10
	alarmSoundActive = true
func _on_cyber_ware_11_pressed() -> void:
	AudioPlayer.stream = _Music11
	alarmSoundActive = true
func _on_cyber_ware_12_pressed() -> void:
	AudioPlayer.stream = _Music12
	alarmSoundActive = true
func _on_cyber_ware_13_pressed() -> void:
	alarmSoundActive = true
	AudioPlayer.stream = _Music13
