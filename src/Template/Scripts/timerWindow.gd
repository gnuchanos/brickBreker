extends Window

@onready var timeSTR = $"HBoxContainer/VBoxContainer/time"

var TimerStart = false
var second = 0
var minute = 0
var hour = 0

func _process(delta: float) -> void:
	if TimerStart:
		if second < 60:
			second += 1 * delta
		else:
			second = 0
			minute += 1
			if minute == 60:
				minute = 0
				hour += 1

		timeSTR.text = str(hour) + " : " + str(minute) + " : " + str(int(second))

func _on_start_pressed() -> void:
	TimerStart = true

func _on_stop_pressed() -> void:
	TimerStart = false

func _on_clear_pressed() -> void:
	TimerStart = false
	second = 0
	minute = 0
	hour = 0
	timeSTR.text = str(hour) + " : " + str(minute) + " : " + str(int(second))


func _on_close_requested() -> void:
	self.visible = false
