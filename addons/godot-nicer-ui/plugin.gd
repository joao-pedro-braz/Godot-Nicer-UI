@tool
extends EditorPlugin


func _enter_tree():
	var interface: EditorInterface = get_editor_interface()
	var settings: EditorSettings = interface.get_editor_settings()
	
	if settings.get("interface/theme/preset") != "Custom":
		settings.set("interface/theme/preset", "Custom")
		var theme_path = ProjectSettings.globalize_path("res://addons/godot-nicer-ui/theme.tres")
		settings.set("interface/theme/custom_theme", theme_path)
		print("Set Custom theme, please restart...")


func _exit_tree() -> void:
	var interface: EditorInterface = get_editor_interface()
	var settings: EditorSettings = interface.get_editor_settings()
	
	if settings.get("interface/theme/preset") != "Custom":
		settings.set("interface/theme/preset", "Default")
		settings.set("interface/theme/custom_theme", null)
		print("Reset theme, please restart...")
