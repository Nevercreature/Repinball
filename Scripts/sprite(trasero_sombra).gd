extends Sprite2D

var flipperDeReferencia
var flipperDelantero
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flipperDeReferencia = get_node("../FlipperIzquierdoTraseroFisico2")
	flipperDelantero = get_node("../Sprite(delanteroSombra)")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print('El ángulo del flipper es ',flipperDeReferencia.rotation,'. ')
	#print('El frame del flipper es ',self.frame,'. ')
	
	if flipperDeReferencia.rotation <=0 and flipperDeReferencia.rotation >-0.183:
		frame = 0
		flipperDelantero.frame = 0
	if flipperDeReferencia.rotation <=-0.183 and flipperDeReferencia.rotation >-0.366:
		frame = 1
		flipperDelantero.frame = 1
	if flipperDeReferencia.rotation <=-0.366 and flipperDeReferencia.rotation >-0.549:
		frame = 2
		flipperDelantero.frame = 2
	if flipperDeReferencia.rotation <=-0.549 and flipperDeReferencia.rotation >-0.732:
		frame = 3
		flipperDelantero.frame = 3
	if flipperDeReferencia.rotation <=-0.732 and flipperDeReferencia.rotation >-0.915:
		frame = 4
		flipperDelantero.frame = 4
	if flipperDeReferencia.rotation <=-0.915 and flipperDeReferencia.rotation >-1:
		frame = 5
		flipperDelantero.frame = 5
	if flipperDeReferencia.rotation <=-1 and flipperDeReferencia.rotation >-1.1:
		frame = 6
		flipperDelantero.frame = 6

		
