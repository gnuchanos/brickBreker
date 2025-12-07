extends Node

signal bg2D

var GameContinue = true
var DATA = {
	"currentLang" : "en",
	"CurrentBG" : "Default",
	"Background3D" : true,
	"Money" : 0,
	"Gold" : 0,
	"CurrentImage" : "res://Template/Images/screen_logo.png",
	"Disable3D" : false,
	"all2D_Images" : {
		"img0" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_0.jpeg",
			"price" : 5,
		},
		"img1" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_1.jpeg",
			"price" : 5,
		},
		"img2" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_2.jpeg",
			"price" : 5,
		},
		"img3" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_3.jpeg",
			"price" : 5,
		},
		"img4" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_4.jpeg",
			"price" : 5,
		},
		"img5" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_5.jpeg",
			"price" : 5,
		},
		"img6" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_6.jpeg",
			"price" : 5,
		},
		"img7" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_7.jpeg",
			"price" : 5,
		},
		"img8" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_8.jpeg",
			"price" : 5,
		},
		"img9" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_9.jpeg",
			"price" : 5,
		},
		"img10" : {
			"buy?" : false,
			"path" : "res://Template/Images/wallpapers/image_10.jpeg",
			"price" : 5,
		},
		
	},

	"TextSaves" : {
		
	},

	

	"Language" : {
		"en" : {
			
		}
	}
	
}








var debug0 = ""

var AdIsOn = false
var AdblockDetected = false
var Platform = 'PlayGama'
var _3DScreenActive = false

var pavucontrol = false
var calculator  = false
var timer       = false
var textEditor  = false
var creditWindow = false
var musicWindow = false
var alarmWindow = false
var windowManagerWindow = false
var walletWindow = false

signal InterstitialAdEnded # Geçiş reklamı bittikten sonra çalışır
signal RewardedAdEnded(Successful:bool) # ödüllü reklam bittikten sonra çalışır

# false = reklam yapılmıyorsa oyun sekmesinden çıkıp girince ses işlemlerini yap | true = reklam yapılıyor ise yapma
func _notification(what: int) -> void:
	if GameContinue:
		if what == NOTIFICATION_WM_WINDOW_FOCUS_OUT:
			AudioServer.set_bus_volume_db(0, -80)
		elif what == NOTIFICATION_WM_WINDOW_FOCUS_IN:
			AudioServer.set_bus_volume_db(0, 0)

func _on_storage_get_completed(success, data):
	if success:
		debug0 = str(data[0])

func _on_storage_set_completed(success):
	pass

func PlayGama_Save():
	if GlovalVAR.Platform == 'PlayGama':
		Bridge.storage.set('GameData', JSON.stringify(GlovalVAR.DATA), Callable(_on_storage_set_completed), Bridge.StorageType.PLATFORM_INTERNAL)
		_Save()

func PlayGama_Load():
	if GlovalVAR.Platform == "PlayGama":
		if Bridge.storage.is_available(Bridge.StorageType.PLATFORM_INTERNAL):
			Bridge.storage.get("GameData", Callable(_on_storage_get_completed), Bridge.StorageType.PLATFORM_INTERNAL)

func _Save():
	var File = FileAccess.open('user://GameData.save',FileAccess.WRITE)
	File.store_line(JSON.stringify(DATA))
	File.close()

func _Load():
	if not FileAccess.file_exists('user://GameData.save'):
		return

	var File = FileAccess.open('user://GameData.save',FileAccess.READ)
	DATA=JSON.parse_string(File.get_line())
	File.close()

var rewordState = 0

func _ShowAD():
	Bridge.advertisement.show_interstitial()

func _AdReward():
	Bridge.advertisement.show_rewarded()
