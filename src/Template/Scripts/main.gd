extends Control

@onready var DesktopInput = $"desktopInput"

@onready var WindowList = [
	$"TerminalWindow",
	$"OptionsWindow",
	$"calculatorWindow",
	$"textEditorWindow",
	$"AlarmWindow",
	$"CreditWindow",
	$"timerWindow",
	$"musicPlayerWindow",
	$"wallpaperManager",
	$"ziglotWalletWindow"
]


func _ready() -> void:
	GlovalVAR.DATA["currentLang"] = Bridge.platform.language
	Bridge.platform.send_message(Bridge.PlatformMessage.GAME_READY)
	Bridge.advertisement.set_minimum_delay_between_interstitial(60)
	Bridge.advertisement.check_adblock(Callable(_on_check_adblock_completed))
	GlovalVAR.bg2D.connect(_bg2D)
	$"2D_Screen/bg".texture = load(GlovalVAR.DATA["CurrentImage"])

	GlovalVAR._Load()

	$"lang".text = Bridge.platform.language

func _bg2D():
	$"2D_Screen/bg".texture = load(GlovalVAR.DATA["CurrentImage"])
	
var _t = ""
var _d = ""
var _Input = ""
func _process(delta: float) -> void:
	_t = str(Time.get_datetime_dict_from_system().hour) + " : " + str(Time.get_datetime_dict_from_system().minute) + " : "  + str(Time.get_datetime_dict_from_system().second)
	_d = str(Time.get_datetime_dict_from_system().year) + " : " + str(Time.get_datetime_dict_from_system().month) + " : " + str(Time.get_datetime_dict_from_system().day)
	$"time".text = _d + " / " + _t

	if Input.is_action_just_pressed("altEnter"):
		$"TerminalWindow".visible = true
		$"TerminalWindow".position = Vector2(104, 136)
	elif Input.is_action_just_pressed("tab"):
		$"OptionsWindow".visible = true
		$"OptionsWindow".position = Vector2(85, 111)
	elif Input.is_action_just_pressed("credit"):
		$"CreditWindow".visible = true
		$"CreditWindow".position = Vector2(275, 81)
	elif Input.is_action_just_pressed("close3D"):
		if GlovalVAR.DATA["Disable3D"]:
			GlovalVAR.DATA["Disable3D"] = false
			$"3D_Screen".visible = false
			$"2D_Screen/bg".visible = true
		else: 
			GlovalVAR.DATA["Disable3D"] = true
			$"3D_Screen".visible = true
			$"2D_Screen/bg".visible = false
	elif Input.is_action_just_pressed("calculator"):
		$"calculatorWindow".visible = true
		$"calculatorWindow".position = Vector2(140, 36)
	elif Input.is_action_just_pressed("textEditor"):
		$"textEditorWindow".visible = true
		$"textEditorWindow".position = Vector2(85, 71)
	elif Input.is_action_just_pressed("timer"):
		$"timerWindow".visible = true
		$"timerWindow".position = Vector2(85, 71)
	elif Input.is_action_just_pressed("alarm"):
		$"AlarmWindow".visible = true
		$"AlarmWindow".position = Vector2(155, 131)
	elif Input.is_action_just_pressed("music"):
		$"musicPlayerWindow".visible = true
		$"musicPlayerWindow".position = Vector2(110, 91)
	elif Input.is_action_just_pressed("windowmanager"):
		$"wallpaperManager".visible = true
		$"wallpaperManager".position = Vector2(0, 36)
	elif Input.is_action_just_pressed("reset"):
		for i in WindowList:
			if i.visible:
				i.visible = false
	elif Input.is_action_just_pressed("wallet"):
		$"ziglotWalletWindow".visible = true
		$"ziglotWalletWindow".position = Vector2(90, 461)
		$"ziglotWalletWindow/VBoxContainer/ziglot/ziglot_STR".text = str(GlovalVAR.DATA["Money"])  + " > Zigrot"
		$"ziglotWalletWindow/VBoxContainer/ziglotGold/ziglotGold_STR".text = str(GlovalVAR.DATA["Gold"])  + " > Zigrot Gold"

	# desktop Input
	if Input.is_action_just_pressed("enter"):
		if len($"TerminalWindow/VBoxContainer/HBoxContainer/input".text) == 0:
			_Input = DesktopInput.text

			if "terminal" == _Input:
				$"TerminalWindow".visible = true
				$"TerminalWindow".position = Vector2(104, 136)
			elif "pavucontrol" == _Input:
				$"OptionsWindow".visible = true
				$"OptionsWindow".position = Vector2(85, 111)
			elif "calculator" == _Input:
				$"calculatorWindow".visible = true
				$"calculatorWindow".position = Vector2(140, 36)
			elif "timer" == _Input:
				$"timerWindow".visible = true
				$"timerWindow".position = Vector2(85, 71)
			elif "textedit" == _Input:
				$"textEditorWindow".visible = true
				$"textEditorWindow".position = Vector2(85, 71)
			elif "credit" == _Input:
				$"CreditWindow".visible = true
				$"CreditWindow".position = Vector2(275, 81)
			elif "alarm" == _Input:
				$"AlarmWindow".visible = true
				$"AlarmWindow".position = Vector2(155, 131)
			elif "music" == _Input:
				$"musicPlayerWindow".visible = true
				$"musicPlayerWindow".position = Vector2(110, 91)
			elif "wallpaper" == _Input:
				$"wallpaperManager".visible = true
				$"wallpaperManager".position = Vector2(0, 36)
			elif "wallet" == _Input:
				$"ziglotWalletWindow".visible = true
				$"ziglotWalletWindow".position = Vector2(90, 461)
				$"ziglotWalletWindow/VBoxContainer/ziglot/ziglot_STR".text = str(GlovalVAR.DATA["Money"])
				$"ziglotWalletWindow/VBoxContainer/ziglotGold/ziglotGold_STR".text = str(GlovalVAR.DATA["Gold"])

			DesktopInput.text = ""

	# Check Terminal Command
	if Input.is_action_just_released("enter"):
		# extra
		if GlovalVAR.pavucontrol:
			$"OptionsWindow".visible  = true
			$"OptionsWindow".position = Vector2(85, 111)
			GlovalVAR.pavucontrol = false
		elif GlovalVAR.calculator:
			$"calculatorWindow".visible = true
			$"calculatorWindow".position = Vector2(140, 36)
			GlovalVAR.calculator = false
		elif GlovalVAR.timer:
			$"timerWindow".visible = true
			$"timerWindow".position = Vector2(85, 71)
			GlovalVAR.timer = false
		elif GlovalVAR.textEditor:
			$"textEditorWindow".visible = true
			$"textEditorWindow".position = Vector2(85, 71)
			GlovalVAR.textEditor = false
		elif GlovalVAR.creditWindow:
			$"CreditWindow".visible   = true
			$"CreditWindow".position = Vector2(275, 81)
			GlovalVAR.creditWindow = false
		elif GlovalVAR.musicWindow:
			$"musicPlayerWindow".visible = true
			$"musicPlayerWindow".position = Vector2(110, 91)
			GlovalVAR.musicWindow = false
		elif GlovalVAR.alarmWindow:
			$"AlarmWindow".visible = true
			$"AlarmWindow".position = Vector2(155, 131)
			GlovalVAR.alarmWindow = false
		elif GlovalVAR.windowManagerWindow:
			$"wallpaperManager".visible = true
			$"wallpaperManager".position = Vector2(0, 36)
			GlovalVAR.windowManagerWindow = false
		elif GlovalVAR.walletWindow:
			$"ziglotWalletWindow".visible = true
			$"ziglotWalletWindow".position = Vector2(90, 461)
			GlovalVAR.walletWindow = false
			$"ziglotWalletWindow/VBoxContainer/ziglot/ziglot_STR".text = str(GlovalVAR.DATA["Money"])
			$"ziglotWalletWindow/VBoxContainer/ziglotGold/ziglotGold_STR".text = str(GlovalVAR.DATA["Gold"])



func _on_check_adblock_completed(result):
	if result == true:
		GlovalVAR.AdblockDetected = true
	else:
		GlovalVAR.AdblockDetected = false


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://BaseGame/Scenes/gameScene.tscn")
