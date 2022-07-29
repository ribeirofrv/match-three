extends Node2D

export (int) var width;
export (int) var heigth;
export (int) var x_start;
export (int) var y_start;
export (int) var offset;

var possible_pieces = [
preload("res://scenes/blue_piece.tscn"),
preload("res://scenes/yellow_piece.tscn"),
preload("res://scenes/pink_piece.tscn"),
preload("res://scenes/orange_piece.tscn"),
preload("res://scenes/light_green_piece.tscn"),
preload("res://scenes/green_piece.tscn")
];

var all_pieces = [];

func _ready():
	randomize();
	all_pieces = make_2d_array();
	spawn_pieces();

func make_2d_array():
	var array = [];
	for index in width:
		array.append([]);
		for index_aux in heigth:
			array[index].append(null);
	return array;

func spawn_pieces():
	for column in width:
		for row in heigth:
			var random = floor(rand_range(0, possible_pieces.size()));
			var piece  = possible_pieces[random].instance();
			
			var loops = 0;
			while(match_at(column, row, piece.color) && (loops < 100)):
				random = floor(rand_range(0, possible_pieces.size()));
				loops += 1;
				piece  = possible_pieces[random].instance();
			
			add_child(piece);
			piece.position = grid_to_pixel(column, row);
			all_pieces[column][row] = piece;

func match_at(column, row, color):
	if column > 1:
		if all_pieces[column - 1][row] != null && all_pieces[column - 2][row] != null:
			if all_pieces[column - 1][row].color == color && all_pieces[column - 2][row].color == color:
				return true;
	if row > 1:
		if all_pieces[column][row - 1] != null && all_pieces[column][row - 2] != null:
			if all_pieces[column][row - 1].color == color && all_pieces[column][row - 2].color == color:
				return true;
	pass;

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column;
	var new_y = y_start + (-offset) * row;
	return Vector2(new_x, new_y);
