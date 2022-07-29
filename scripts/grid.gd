extends Node2D

export (int) var width;
export (int) var heigth;
export (int) var x_start;
export (int) var y_start;
export (int) var offset;

var all_pieces = [];

func _ready():
	all_pieces = make_2d_array();
	print(all_pieces);

func make_2d_array():
	var array = [];
	for index in width:
		array.append([]);
		for index_aux in heigth:
			array[index].append(null);
	return array;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
