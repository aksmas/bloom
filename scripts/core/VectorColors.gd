class_name VectorColors

var WHITE: int
var RED: int
var PINK: int
var PURPLE: int
var YELLOW: int

func _init(
	white: int = 0,
	red: int = 0,
	pink: int = 0,
	purple: int = 0,
	yellow: int = 0,
) -> void:
	WHITE = white
	RED = red
	PINK = pink
	PURPLE = purple
	YELLOW = yellow


func read(color: CoreConstants.BloomColor) -> int:
	match color:
		CoreConstants.BloomColor.WHITE: return WHITE
		CoreConstants.BloomColor.RED: return RED
		CoreConstants.BloomColor.PINK: return PINK
		CoreConstants.BloomColor.PURPLE: return PURPLE
		CoreConstants.BloomColor.YELLOW: return YELLOW
	push_error("VectorColors: invalid color %d" % color)
	return 0


func write(color: CoreConstants.BloomColor, value: int) -> void:
	match color:
		CoreConstants.BloomColor.WHITE: WHITE = value
		CoreConstants.BloomColor.RED: RED = value
		CoreConstants.BloomColor.PINK: PINK = value
		CoreConstants.BloomColor.PURPLE: PURPLE = value
		CoreConstants.BloomColor.YELLOW: YELLOW = value
		_: push_error("VectorColors: invalid color %d" % color)


func increment(color: CoreConstants.BloomColor, value: int = 1) -> void:
	write(color, read(color) + value)


func add(o: VectorColors) -> VectorColors:
	return VectorColors.new(
		WHITE + o.WHITE,
		RED + o.RED,
		PINK + o.PINK,
		PURPLE + o.PURPLE,
		YELLOW + o.YELLOW,
	)


func sub(o: VectorColors) -> VectorColors:
	return VectorColors.new(
		WHITE - o.WHITE,
		RED - o.RED,
		PINK - o.PINK,
		PURPLE - o.PURPLE,
		YELLOW - o.YELLOW,
	)


func minima(o: VectorColors) -> VectorColors:
	return VectorColors.new(
		min(WHITE, o.WHITE),
		min(RED, o.RED),
		min(PINK, o.PINK),
		min(PURPLE, o.PURPLE),
		min(YELLOW, o.YELLOW),
	)


func maxima(o: VectorColors) -> VectorColors:
	return VectorColors.new(
		max(WHITE, o.WHITE),
		max(RED, o.RED),
		max(PINK, o.PINK),
		max(PURPLE, o.PURPLE),
		max(YELLOW, o.YELLOW),
	)


func equals(o: VectorColors) -> bool:
	return o != null \
		and WHITE == o.WHITE \
		and RED == o.RED \
		and PINK == o.PINK \
		and PURPLE == o.PURPLE \
		and YELLOW == o.YELLOW


func is_positive() -> bool:
	return WHITE >= 0 and RED >= 0 and PINK >= 0 and PURPLE >= 0 and YELLOW >= 0


func count() -> int:
	return WHITE + RED + PINK + PURPLE + YELLOW


func _to_string() -> String:
	return "VectorColors(W=%d, R=%d, P=%d, Pu=%d, Y=%d)" \
		% [WHITE, RED, PINK, PURPLE, YELLOW]
