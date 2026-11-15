extends Control

@onready var game_over_rect: ColorRect = $GameOverRect

func _unhandled_input(event: InputEvent) -> void:
	pass


func _ready() -> void:
	SignalHub.game_over.connect(on_game_over)

func on_game_over() -> void:
	game_over_rect.show()
