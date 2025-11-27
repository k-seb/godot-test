extends Node

@onready var admob: Admob = $Admob as Admob

var _is_banner_loaded: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Initializing - ready() called")
	admob.initialize()

func _on_admob_initialization_completed(status_data: InitializationStatus) -> void:
	print("Initializing admob - completed")
	_load_banner()

func _load_banner() -> void:
	print("load_banner")
	if admob == null:
		print("load_banner - admob is null - returning")
		return

	print("load_banner - calling admob.load_banner_ad()")
	admob.load_banner_ad()

func _on_admob_banner_ad_loaded(ad_id: String, response_info: ResponseInfo, is_collapsible: bool) -> void:
	_is_banner_loaded = true
	print("Banner loaded!")
	print("ad_id " + ad_id)
	admob.show_banner_ad()
