extends Window


var currentTextFilename = ""
@onready var FileNameSTR = $"HBoxContainer/VBoxContainer/HBoxContainer/fileNameSTR"
@onready var TextEditor = $"HBoxContainer/VBoxContainer/HBoxContainer3/TextEditor"

func _ready() -> void:
	FileNameSTR.text = currentTextFilename

func _on_save_button_pressed() -> void:
	if len($HBoxContainer/VBoxContainer/HBoxContainer2/pathInput.text) > 0:
		currentTextFilename = $HBoxContainer/VBoxContainer/HBoxContainer2/pathInput.text
		FileNameSTR.text = currentTextFilename
		if len(currentTextFilename) > 0:
			GlovalVAR.DATA["TextSaves"][currentTextFilename] = TextEditor.text
			GlovalVAR.PlayGama_Save()

func _on_open_button_pressed() -> void:
	if len($HBoxContainer/VBoxContainer/HBoxContainer2/pathInput.text) > 0:
		currentTextFilename = $HBoxContainer/VBoxContainer/HBoxContainer2/pathInput.text
		FileNameSTR.text = currentTextFilename
		GlovalVAR.PlayGama_Load()
		if len(currentTextFilename) > 0:
			TextEditor.text = GlovalVAR.DATA["TextSaves"][currentTextFilename]
			# print(GlovalVAR.DATA["TextSaves"][currentTextFilename])


func _on_close_requested() -> void:
	self.visible = false
