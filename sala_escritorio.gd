extends Control

@onready var label_relogio = $LabelRelogio
@onready var timer_jogo = $TimerJogo
@onready var input_pin = $PopupCelular/CelularUI/LineEdit
@onready var teclado = $PopupCelular/CelularUI/GridContainer
@onready var mensagem_pin = $PopupCelular/CelularUI/MensagemPIN
@onready var input_pc = $PopupPC/MonitorUI/TelaLogin/SenhaPC
@onready var mensagem_pc = $PopupPC/MonitorUI/TelaLogin/MensagemPC
@onready var tela_login = $PopupPC/MonitorUI/TelaLogin
@onready var tela_desktop = $PopupPC/MonitorUI/TelaDesktop
@onready var alerta_protheus = $PopupPC/MonitorUI/TelaDesktop/AlertaProtheus

func _ready():
	# Garante que o modal sempre inicie escondido quando a sala carregar
	$PopupPC.hide()
	$PopupCelular.hide()
	
	# Laço para conectar os botões do celular via código (padrão Godot 4)
	for filho in teclado.get_children():
		# Verifica se o nó atual é realmente um botão (ignora os 'Controls' vazios do layout)
		if filho is Button:
			# .bind() passa o texto do botão (ex: "1", "2") como argumento para a função
			filho.pressed.connect(_on_botao_numero_pressed.bind(filho.text))

func _on_botao_pc_pressed():
	# Torna o modal visível
	$PopupPC.show()

func _on_botao_fechar_pc_pressed():
	# Esconde o modal
	$PopupPC.hide()
	
func _on_botao_celular_pressed() -> void:
	$PopupCelular.show()

func _on_botao_fechar_cel_pressed() -> void:
	$PopupCelular.hide()

func _on_botao_numero_pressed(numero_digitado: String):
	# Adiciona o número ao input
	input_pin.text += numero_digitado
	
	# Auto-verificação no 4º dígito
	if input_pin.text.length() == 4:
		validar_pin()

func validar_pin():
	if input_pin.text == "1234": 
		# Feedback de Sucesso
		mensagem_pin.text = "DESBLOQUEADO"
		mensagem_pin.modulate = Color.GREEN # Muda a cor do texto para verde
		
		# Opcional: Aqui também colocaremos um delay pequeno antes de 
		# sumir com essa tela e mostrar a tela dos apps/dicas do celular
		
	else:
		# Feedback de Erro
		mensagem_pin.text = "PIN INCORRETO"
		mensagem_pin.modulate = Color.RED # Muda a cor do texto para vermelho
		
		# O Timer que já havíamos colocado
		await get_tree().create_timer(1.5).timeout 
		
		# Limpa o input e volta a mensagem para o estado original
		input_pin.text = "" 
		mensagem_pin.text = "Aguardando PIN..."
		mensagem_pin.modulate = Color.WHITE # Volta para a cor branca original

func _on_entrar_pc_pressed() -> void:
	var senha_digitada = input_pc.text
	
	if senha_digitada == "Admin@123": # Coloque a sua senha forte aqui
		# Feedback de Sucesso
		mensagem_pc.text = "ACESSO CONCEDIDO"
		mensagem_pc.modulate = Color.GREEN
		
		# Espera 1 segundinho pro jogador ler que acertou
		await get_tree().create_timer(1.5).timeout 
		
		# Mágica da transição: Esconde o login, mostra o desktop
		tela_login.hide()
		tela_desktop.show()
		
	else:
		# Feedback de Erro
		mensagem_pc.text = "ACESSO NEGADO"
		mensagem_pc.modulate = Color.RED
		
		await get_tree().create_timer(1.5).timeout
		
		# Limpa o input e reseta a mensagem para o estado original
		input_pc.text = ""
		mensagem_pc.text = "Digite a Senha"
		mensagem_pc.modulate = Color.WHITE

func _on_senha_pc_text_submitted(new_text: String) -> void:
	_on_entrar_pc_pressed()

func _on_botao_olho_pressed():
	# Inverte o estado atual: se está secreto, revela; se está revelado, oculta.
	input_pc.secret = not input_pc.secret

func _on_protheus_button_pressed():
	alerta_protheus.show()
	
func _on_sair_aviso_pressed():
	alerta_protheus.hide()
	
func _process(delta):
	# Pega o tempo que falta no timer e converte pra número inteiro (corta os milissegundos)
	var tempo_restante = int(timer_jogo.time_left)
	
	# Matemática básica para extrair os minutos e os segundos
	var minutos = tempo_restante / 60
	var segundos = tempo_restante % 60
	
	# Formata a string para sempre ter 2 dígitos. Ex: em vez de "5:9", fica "05:09"
	label_relogio.text = "%02d:%02d" % [minutos, segundos]
