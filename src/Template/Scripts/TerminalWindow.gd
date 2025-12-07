extends Window


@onready var InputNODE = $VBoxContainer/HBoxContainer/input
@onready var OutputNODE = $VBoxContainer/log
var _Input = ""
var splitInput = []
var finishText = ""
var help = """
	> GnuChanOS Simple Terminal
	/clear - you know what this is
	/echo "text"

	/openPavucontrol  - Sound Settings
	/openCredit       - Credit Window
	/openCalculator   - Calculator Window
	/openTimer        - Simple Timer Window
	/openAlarm        - Simple Alarm Window
	/openTextEditor   - Simple Text Editor Window
	/openMusicPlayer  - Simple Music Player Window
	/wallpaperManager - Simple Window Wallpaper Manager 
	/wallet           - Simple Wallet \n
"""

func _ready() -> void:
	InputNODE.grab_focus()
	OutputNODE.text = help

func _process(delta: float) -> void:
	if self.visible:
		if Input.is_action_just_pressed("enter") and len(InputNODE.text) > 0:
			_Input = InputNODE.text
			OutputNODE.text += "> " + _Input + '\n'

			if "/clear" == _Input.to_lower():
				OutputNODE.text = ""
			elif "/echo" in _Input.to_lower():
				splitInput = _Input.split(" ")
				finishText = ""
				for i in splitInput:
					if "/echo" != i:
						finishText += i + " "
				OutputNODE.text += finishText.replace("\"", "") + '\n'
			elif "/help" in _Input.to_lower():
				OutputNODE.text += help



			# extra programs
			elif "/openpavucontrol" == _Input.to_lower():
				GlovalVAR.pavucontrol = true
			elif "/opencalculator" == _Input.to_lower():
				GlovalVAR.calculator = true
			elif "/opentimer" == _Input.to_lower():
				GlovalVAR.timer = true
			elif "/opentexteditor" == _Input.to_lower():
				GlovalVAR.textEditor = true
			elif "/opencredit" == _Input.to_lower():
				GlovalVAR.creditWindow = true
			elif "/openmusicplayer" == _Input.to_lower():
				GlovalVAR.musicWindow = true
			elif "/openalarm" == _Input.to_lower():
				GlovalVAR.alarmWindow = true
			elif "/wallpapermanager" == _Input.to_lower():
				GlovalVAR.windowManagerWindow = true
			elif "/wallet" == _Input.to_lower():
				GlovalVAR.walletWindow = true

			OutputNODE.scroll_vertical = OutputNODE.get_line_count()
			InputNODE.text = ""

	elif Input.is_action_just_released("enter"):
		InputNODE.grab_focus()


func _on_close_requested() -> void:
	self.visible = false
