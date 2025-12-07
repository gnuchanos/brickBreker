extends Window


var ImgReady = [
	[GlovalVAR.DATA["all2D_Images"]["img0"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_0/VBoxContainer/buy_Img_0")],
	[GlovalVAR.DATA["all2D_Images"]["img1"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_1/VBoxContainer/buy_Img_1")],
	[GlovalVAR.DATA["all2D_Images"]["img2"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_2/VBoxContainer/buy_Img_2")],
	[GlovalVAR.DATA["all2D_Images"]["img3"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_3/VBoxContainer/buy_Img_3")],
	[GlovalVAR.DATA["all2D_Images"]["img4"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_4/VBoxContainer/buy_Img_4")],
	[GlovalVAR.DATA["all2D_Images"]["img5"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_5/VBoxContainer/buy_Img_5")],
	[GlovalVAR.DATA["all2D_Images"]["img6"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_6/VBoxContainer/buy_Img_6")],
	[GlovalVAR.DATA["all2D_Images"]["img7"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_7/VBoxContainer/buy_Img_7")],
	[GlovalVAR.DATA["all2D_Images"]["img8"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_8/VBoxContainer/buy_Img_8")],
	[GlovalVAR.DATA["all2D_Images"]["img9"]["buy?"],  NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_9/VBoxContainer/buy_Img_9")],
	[GlovalVAR.DATA["all2D_Images"]["img10"]["buy?"], NodePath("TabContainer/2DWallpapers/Space/HBoxContainer/VBoxContainer/Img_10/VBoxContainer/buy_Img_10")],
]

func _ready() -> void:
	for i in ImgReady.size():
		var bought = ImgReady[i][0]
		var button = get_node(ImgReady[i][1])

		if bought:
			button.text = "Select This Image"
		else:
			button.text = "Buy Price : 5 - Ziglot"

func _on_close_requested() -> void:
	self.visible = false

func _buyOrSelectWallpaper(ImageName, buttonText):
	if not GlovalVAR.DATA["all2D_Images"][ImageName]["buy?"]:
		if GlovalVAR.DATA["all2D_Images"][ImageName]["price"] <= GlovalVAR.DATA["Money"]:
			GlovalVAR.DATA["Money"] -= GlovalVAR.DATA["all2D_Images"][ImageName]["price"]
			GlovalVAR.DATA["all2D_Images"][ImageName]["buy?"] = true

	if GlovalVAR.DATA["all2D_Images"][ImageName]["buy?"]:
		GlovalVAR.DATA["CurrentImage"] = GlovalVAR.DATA["all2D_Images"][ImageName]["path"]
		GlovalVAR.emit_signal("bg2D")
		get_node(buttonText).text = "Select This Image"

func _on_buy_img_0_pressed() -> void:
	_buyOrSelectWallpaper("img0", ImgReady[0][1])
func _on_buy_img_1_button_up() -> void:
	_buyOrSelectWallpaper("img1", ImgReady[1][1])
func _on_buy_img_2_pressed() -> void:
	_buyOrSelectWallpaper("img2", ImgReady[2][1])
func _on_buy_img_3_pressed() -> void:
	_buyOrSelectWallpaper("img3", ImgReady[3][1])
func _on_buy_img_4_pressed() -> void:
	_buyOrSelectWallpaper("img4", ImgReady[4][1])
func _on_buy_img_5_pressed() -> void:
	_buyOrSelectWallpaper("img5", ImgReady[5][1])
func _on_buy_img_6_pressed() -> void:
	_buyOrSelectWallpaper("img6", ImgReady[6][1])
func _on_buy_img_7_pressed() -> void:
	_buyOrSelectWallpaper("img7", ImgReady[7][1])
func _on_buy_img_8_pressed() -> void:
	_buyOrSelectWallpaper("img8", ImgReady[8][1])
func _on_buy_img_9_pressed() -> void:
	_buyOrSelectWallpaper("img9", ImgReady[9][1])
func _on_buy_img_10_pressed() -> void:
	_buyOrSelectWallpaper("img10", ImgReady[10][1])
