extends Control


func _ready() -> void:
	$Grass.value = $"../../terraingen".grass_height
	$Water.value = $"../../terraingen".water_height
	$Forest.value = $"../../terraingen".forest_height
	$Sand.value = $"../../terraingen".sand_height



func _on_grass_value_changed(value: float) -> void:
	if $Grass.value < $Sand.value:
		$Sand.value = $Grass.value - 0.01
	if $Grass.value > $Forest.value:
		$Forest.value = $Grass.value + 0.01
	$Grass/GL.text = "Grass: %f" % $Grass.value
	$"../../terraingen".grass_height = $Grass.value
	$"../../terraingen".generate_terrain()


func _on_water_value_changed(value: float) -> void:
	if $Water.value > $Sand.value:
		$Sand.value = $Water.value + 0.01
	$Water/WL.text = "Water: %f" % $Water.value
	$"../../terraingen".water_height = $Water.value
	$"../../terraingen".generate_terrain()


func _on_sand_value_changed(value: float) -> void:
	if $Sand.value < $Water.value:
		$Water.value = $Sand.value - 0.01
	if $Sand.value > $Grass.value:
		$Grass.value = $Sand.value + 0.01
	$Sand/SL.text = "Sand: %f" % $Sand.value
	$"../../terraingen".sand_height = $Sand.value
	$"../../terraingen".generate_terrain()


func _on_forest_value_changed(value: float) -> void:
	if $Forest.value < $Grass.value:
		$Grass.value = $Forest.value - 0.01
	$Forest/FL.text = "Forest: %f" % $Forest.value
	$"../../terraingen".forest_height = $Forest.value
	$"../../terraingen".generate_terrain()
