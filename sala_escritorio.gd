extends Control

func _ready():
	# Garante que o modal sempre inicie escondido quando a sala carregar
	$PopupPC.hide()

func _on_botao_pc_pressed():
	# Torna o modal visível
	$PopupPC.show()

func _on_botao_fechar_pc_pressed():
	# Esconde o modal
	$PopupPC.hide()
