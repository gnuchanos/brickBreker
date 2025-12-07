extends Window


func _ready() -> void:
	$Panel/credit.text = """
Design:=========|
---: ME
Code:===========|
---: ME
Script:=========|
---: ME
Art:============|
---: ME
Animation:======|
---: ME
UI / UX:========|
---: ME
Music:==========|
---: ME
Sound Design:===|
---: ME
Game Design:====|
---: ME
Level Design:===|
---: ME
Testing:========|
---: ME
Localization:===|
---: ME
"""



func _on_close_requested() -> void:
	self.visible = false
