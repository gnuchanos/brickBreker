extends Window

var randomeMinute = randi_range(1, 5)

func _ready() -> void:
	GlovalVAR.RewardedAdEnded.connect(RewardedAdEnded)
	$"VBoxContainer/ziglotConvert/ziglot_Input".grab_focus()

func _process(delta: float) -> void:
	if GlovalVAR.AdIsOn:
		if randomeMinute > 0:
			randomeMinute -= delta
		else:
			GlovalVAR.AdIsOn = false
			randomeMinute = randi_range(1, 5)
			$"VBoxContainer/ziglotGold/ziglotGold_STR".visible = true

func RewardedAdEnded(Successful):
	$"VBoxContainer/ziglot/ziglot_STR".text = str(GlovalVAR.DATA["Money"]) + " > Zigrot"
	$"VBoxContainer/ziglotGold/ziglotGold_STR".text = str(GlovalVAR.DATA["Gold"])  + " > Zigrot Gold"
	GlovalVAR.AdIsOn = true
	$"VBoxContainer/ziglotGold/getZiglotGold_ad".visible = false

func _on_get_ziglot_ad_pressed() -> void:
	GlovalVAR.rewordState = 1
	GlovalVAR._AdReward()
	GlovalVAR.PlayGama_Save()

func _on_get_ziglot_gold_ad_pressed() -> void:
	GlovalVAR.rewordState = 2
	GlovalVAR._AdReward()
	GlovalVAR.PlayGama_Save()


func _on_get_ziglot_convert_pressed() -> void:
	var input_ziglot := int($"VBoxContainer/ziglotConvert/ziglot_Input".text)

	var ziglot_to_convert := min(input_ziglot, GlovalVAR.DATA["Money"])

	var gold_to_add : int = ziglot_to_convert / 10
	gold_to_add = int(gold_to_add)  # kesin integer

	var used_ziglot : int = gold_to_add * 10
	var remaining_ziglot : int = ziglot_to_convert - used_ziglot

	GlovalVAR.DATA["Money"] -= used_ziglot
	GlovalVAR.DATA["Gold"] += gold_to_add
	$"VBoxContainer/ziglot/ziglot_STR".text = str(GlovalVAR.DATA["Money"]) + " > Zigrot"
	$"VBoxContainer/ziglotGold/ziglotGold_STR".text = str(GlovalVAR.DATA["Gold"])  + " > Zigrot Gold"
	GlovalVAR.PlayGama_Save()

func _on_get_ziglot_gold_convert_pressed() -> void:
	var input_gold := int($"VBoxContainer/ziglotGoldConvert/ziglotGold_Input".text)

	var gold_to_convert := min(input_gold, GlovalVAR.DATA["Gold"])
	var ziglot_to_add : int = gold_to_convert * 10

	GlovalVAR.DATA["Gold"] -= gold_to_convert
	GlovalVAR.DATA["Money"] += ziglot_to_add
	$"VBoxContainer/ziglot/ziglot_STR".text = str(GlovalVAR.DATA["Money"]) + " > Zigrot"
	$"VBoxContainer/ziglotGold/ziglotGold_STR".text = str(GlovalVAR.DATA["Gold"])  + " > Zigrot Gold"
	GlovalVAR.PlayGama_Save()

func _on_close_requested() -> void:
	self.visible = false
