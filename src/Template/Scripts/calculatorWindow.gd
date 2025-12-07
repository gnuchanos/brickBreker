extends Window


var num1 = ""
var num2 = ""
var num1_typing = true
var mathEnd = false
var mathType = ""
var math = 0

func _on__1_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "1"
			$VBoxContainer/output.text = num1
		else:
			num2 += "1"
			$VBoxContainer/output.text = num2
func _on__2_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "2"
			$VBoxContainer/output.text = num1
		else:
			num2 += "2"
			$VBoxContainer/output.text = num2

func _on__3_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "3"
			$VBoxContainer/output.text = num1
		else:
			num2 += "3"
			$VBoxContainer/output.text = num2

func _on__4_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "4"
			$VBoxContainer/output.text = num1
		else:
			num2 += "4"
			$VBoxContainer/output.text = num2
func _on__5_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "5"
			$VBoxContainer/output.text = num1
		else:
			num2 += "5"
			$VBoxContainer/output.text = num2
func _on__6_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "6"
			$VBoxContainer/output.text = num1
		else:
			num2 += "6"
			$VBoxContainer/output.text = num2
func _on__7_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "7"
			$VBoxContainer/output.text = num1
		else:
			num2 += "7"
			$VBoxContainer/output.text = num2
func _on__8_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "8"
			$VBoxContainer/output.text = num1
		else:
			num2 += "8"
			$VBoxContainer/output.text = num2
func _on__9_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "9"
			$VBoxContainer/output.text = num1
		else:
			num2 += "9"
			$VBoxContainer/output.text = num2
func _on__0_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "0"
			$VBoxContainer/output.text = num1
		else:
			num2 += "0"
			$VBoxContainer/output.text = num2
func _on_dot_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 += "."
			$VBoxContainer/output.text = num1
		else:
			num2 += "."
			$VBoxContainer/output.text = num2
func _on_del_pressed() -> void:
	if not mathEnd:
		if num1_typing:
			num1 = num1.erase(num1.length() - 1)
			$VBoxContainer/output.text = num1
		else:
			num2 = num2.erase(num2.length() - 1)
			$VBoxContainer/output.text = num2

func _on_plus_pressed() -> void:
	if num1_typing and not mathEnd:
		num1_typing = false
		mathType = '+'
func _on_minus_pressed() -> void:
	if num1_typing and not mathEnd:
		num1_typing = false
		mathType = '-'
func _on_multi_pressed() -> void:
	if num1_typing and not mathEnd:
		num1_typing = false
		mathType = '*'
func _on_divide_pressed() -> void:
	if num1_typing and not mathEnd:
		num1_typing = false
		mathType = '/'

func _on_clean_pressed() -> void:
	mathType = ''
	num1_typing = true
	num1 = ''
	num2 = ''
	$VBoxContainer/output.text = ''
	math = 0
	mathEnd = false
func _on_go_pressed() -> void:
	if mathEnd:
		num1 = str(float(math))
		num1_typing = true
		$VBoxContainer/output.text = str(float(math))
		math = 0
		num2 = ''
		mathEnd = false
func _on_clearlog_pressed() -> void:
	$VBoxContainer/log.text = ''

func _on_end_pressed() -> void:
	if not mathEnd:
		if '+' == mathType:
			math = float(num1) + float(num2)
			$VBoxContainer/log.text += str(num1) + " + " + str(num1) + " = " + str(math) + '\n'
		if '-' == mathType:
			math = float(num1) - float(num2)
			$VBoxContainer/log.text += str(num1) + " - " + str(num1) + " = " + str(math) + '\n'
		if '*' == mathType:
			math = float(num1) * float(num2)
			$VBoxContainer/log.text += str(num1) + " * " + str(num1) + " = " + str(math) + '\n'
		if '/' == mathType:
			math = float(num1) / float(num2)
			$VBoxContainer/log.text += str(num1) + " / " + str(num1) + " = " + str(math) + '\n'

		$VBoxContainer/output.text = str(math)
		mathEnd = true

func _on_close_requested() -> void:
	self.visible = false
