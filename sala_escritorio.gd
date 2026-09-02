extends Control

# Variaveis do game
@onready var tela_game_over = $TelaGameOver

@onready var tela_vitoria = $TelaVitoria
@onready var label_nome_time = $TelaVitoria/LabelNomeTime
@onready var label_tempo_vitoria = $TelaVitoria/LabelTempoVitoria

# Variaveis de tempo
@onready var label_relogio = $LabelRelogio
@onready var timer_jogo = $TimerJogo

# Variaveis PC
@onready var input_pc = $PopupPC/MonitorUI/TelaLogin/SenhaPC
@onready var mensagem_pc = $PopupPC/MonitorUI/TelaLogin/MensagemPC
@onready var tela_login = $PopupPC/MonitorUI/TelaLogin
@onready var tela_desktop = $PopupPC/MonitorUI/TelaDesktop
@onready var alerta_protheus = $PopupPC/MonitorUI/TelaDesktop/AlertaProtheus

# Variaveis Celular
@onready var tela_login_celular = $PopupCelular/CelularUI/TelaLoginCelular
@onready var tela_home_celular = $PopupCelular/CelularUI/TelaHomeCelular
@onready var app_mensagens = $PopupCelular/CelularUI/TelaHomeCelular/AppMensagens

@onready var input_pin = $PopupCelular/CelularUI/TelaLoginCelular/LineEdit
@onready var teclado = $PopupCelular/CelularUI/TelaLoginCelular/GridContainer
@onready var mensagem_pin = $PopupCelular/CelularUI/TelaLoginCelular/MensagemPIN
@onready var label_hora_celular = $PopupCelular/CelularUI/StatusCelular/LabelHoraCelular

# APPS Celular
@onready var appNoticias = $PopupCelular/CelularUI/TelaNoticias
@onready var appNotas = $PopupCelular/CelularUI/TelaNotas
@onready var appCalendario = $PopupCelular/CelularUI/TelaCalendario
@onready var appFotos = $PopupCelular/CelularUI/TelaFotos
@onready var appEmail = $PopupCelular/CelularUI/TelaEmail
@onready var appMensagens = $PopupCelular/CelularUI/TelaMensagens
@onready var appTelefone = $PopupCelular/CelularUI/TelaTelefone

# App Fotos
@onready var tela_ampliada = $PopupCelular/CelularUI/TelaFotos/TelaAmpliada
@onready var foto_gigante = $PopupCelular/CelularUI/TelaFotos/TelaAmpliada/FotoGigante

# App Mensagens
@onready var TelaChat1 = $PopupCelular/CelularUI/TelaMensagens/TelaChat1
@onready var TelaChat2 = $PopupCelular/CelularUI/TelaMensagens/TelaChat2
@onready var TelaChat3 = $PopupCelular/CelularUI/TelaMensagens/TelaChat3
@onready var TelaChat4 = $PopupCelular/CelularUI/TelaMensagens/TelaChat4

@onready var phishingCelMsg1 = $PopupCelular/CelularUI/TelaMensagens/TelaChat2/Panel/phishingMsg1
@onready var phishingCelMsg2 = $PopupCelular/CelularUI/TelaMensagens/TelaChat4/Panel/phishingMsg2
@onready var avisoPhisingCel = $PopupCelular/CelularUI/TelaMensagens/AvisoPhishing

# App Telefone
@onready var visor_numerico = $PopupCelular/CelularUI/TelaTelefone/VisorNumero
@onready var audio_senha = $PopupCelular/CelularUI/TelaTelefone/AudioSenha
@onready var audio_erro = $PopupCelular/CelularUI/TelaTelefone/AudioErro

var numero_digitado = ""


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
		
		await get_tree().create_timer(1.5).timeout
		
		tela_login_celular.hide()
		tela_home_celular.show()
		
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
	
	# 1. Pega a hora exata do Windows/Mac/Linux do usuário
	var tempo_real = Time.get_time_dict_from_system()
	
	# 2. Formata para colocar o zero na frente (ex: 09:05 em vez de 9:5)
	var hora_formatada = "%02d:%02d" % [tempo_real.hour, tempo_real.minute]
	
	# 3. Atualiza o relógio do Celular
	label_hora_celular.text = hora_formatada


func _on_timer_jogo_timeout():
	
	Global.salvar_log_partida("PERDEU", "20:00")
	
	# Mostra a tela de derrota por cima de tudo
	tela_game_over.show()
	
	#Trava o resto do jogo para a pessoa não continuar clicando nas coisas por trás
	get_tree().paused = true


func _on_reiniciar_escape_room_pressed():
	get_tree().paused = false
	
	# Limpa o nome para a próxima equipe não herdar (útil para ambas as telas)
	Global.nome_equipe = "" 
	
	# Volta para a tela inicial
	get_tree().change_scene_to_file("res://sala_principal.tscn")


func _on_sair_game_pressed():
	# Fecha o aplicativo/jogo instantaneamente
	get_tree().quit()
	
func vencer_jogo():
	# 1. Pega os valores ANTES de parar o cronômetro para evitar que venha zerado
	var tempo_total = timer_jogo.wait_time # Os 20 minutos originais (1200)
	var tempo_restante = timer_jogo.time_left # O que sobrou agora
	
	# 2. Agora sim, para o cronômetro
	timer_jogo.stop()
	
	# 3. Calcula o tempo exato que a equipe levou (Tempo Total - Tempo Restante)
	var tempo_gasto = int(tempo_total - tempo_restante)
	
	# Matemática para minutos e segundos
	var minutos = tempo_gasto / 60
	var segundos = tempo_gasto % 60
	var tempo_formatado = "%02d:%02d" % [minutos, segundos]
	
	# 4. Atualiza os textos na tela de vitória
	label_nome_time.text = "Equipe: " + Global.nome_equipe
	label_tempo_vitoria.text = "Tempo de Escape: " + tempo_formatado
	
	# SALVA NO EXCEL!
	Global.salvar_log_partida("VENCEU", tempo_formatado)
	
	# 5. Mostra a tela de vitória e pausa o jogo
	tela_vitoria.show()
	get_tree().paused = true

# Função universal para fechar qualquer app e voltar para a Home
func _on_botao_home_universal_pressed():
	# Esconde as telas dos aplicativos
	appNoticias.hide()
	appNotas.hide()
	appCalendario.hide()
	appFotos.hide()
	appEmail.hide()
	appMensagens.hide()
	appTelefone.hide()


func _on_app_notas_pressed():
	appNotas.show()
	
func _on_app_noticias_pressed():
	appNoticias.show()

func _on_app_calendario_pressed():
	appCalendario.show()
	
func _on_app_galeria_pressed():
	appFotos.show()

func _on_botao_fechar_x_pressed():
	# Apenas esconde a tela de ampliação, voltando para a galeria
	tela_ampliada.hide()

func _on_miniatura_1_pressed():
	# 1. Carrega a imagem da pista para dentro do quadro gigante
	foto_gigante.texture = preload("res://appfotos1.jpg")

#   2. Mostra a tela ampliada por cima de tudo
	tela_ampliada.show()

func _on_miniatura_2_pressed():
	foto_gigante.texture = preload("res://appfotos2.jpg")
	tela_ampliada.show()

func _on_miniatura_3_pressed():
	foto_gigante.texture = preload("res://appfotos3.jpg")
	tela_ampliada.show()

func _on_miniatura_4_pressed():
	foto_gigante.texture = preload("res://appfotos4.jpg")
	tela_ampliada.show()

func _on_miniatura_5_pressed():
	foto_gigante.texture = preload("res://appfotos5.jpg")
	tela_ampliada.show()

func _on_miniatura_6_pressed():
	foto_gigante.texture = preload("res://appfotos6.jpg")
	tela_ampliada.show()

func _on_app_email_pressed():
	appEmail.show()

func _on_app_mensagens_pressed():
	appMensagens.show()

func _on_voltar_msg_pressed_global():
	TelaChat1.hide()
	TelaChat2.hide()
	TelaChat3.hide()
	TelaChat4.hide()

func _on_btn_mensagem_1_pressed():
	TelaChat1.show()

func _on_btn_mensagem_2_pressed():
	TelaChat2.show()

func _on_btn_mensagem_3_pressed():
	TelaChat3.show()

func _on_btn_mensagem_4_pressed():
	TelaChat4.show()

func phishingMsg1():
	phishingCelMsg1.disabled = true
	phishingCelMsg1.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	avisoPhisingCel.show()
	
	var tempo_atual = timer_jogo.time_left # Quanto tempo tem agora?
	var tempo_perdido = 150 # 150 Segundos = 2 min e 30s
	
	if tempo_atual > tempo_perdido:
		# Se tiver mais de 30s, subtrai 30 e recomeça o timer
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		# Se tiver menos de 30s, o jogador "morre" (Tempo zera)
		# Passamos um tempo ínfimo (0.01) para forçar o sinal de timeout imediatamente
		timer_jogo.start(0.01)
		
func phishingMsg2():
	phishingCelMsg2.disabled = true
	phishingCelMsg2.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	avisoPhisingCel.show()
	
	var tempo_atual = timer_jogo.time_left # Quanto tempo tem agora?
	var tempo_perdido = 150 # 150 Segundos = 2 min e 30s
	
	if tempo_atual > tempo_perdido:
		# Se tiver mais de 30s, subtrai 30 e recomeça o timer
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		# Se tiver menos de 30s, o jogador "morre" (Tempo zera)
		# Passamos um tempo ínfimo (0.01) para forçar o sinal de timeout imediatamente
		timer_jogo.start(0.01)
		
	
func _fechar_aviso_smishing():
	avisoPhisingCel.hide()

func _on_phone_pressed():
	appTelefone.show()
	

# LÓGICA DE DIGITAÇÃO (App telefone)
func adicionar_numero(digito: String):
	# Se o visor estiver mostrando texto de erro/chamada, limpa a tela antes de digitar
	if visor_numerico.text == "Chamando TI..." or visor_numerico.text == "Número Inexistente":
		numero_digitado = ""
		visor_numerico.text = ""
		
	# Limita a 6 caracteres para o texto não vazar da tela
	if numero_digitado.length() < 11:
		numero_digitado += digito
		visor_numerico.text = numero_digitado

# Conecte o sinal 'pressed()' de cada botão numérico a essas funções
func _on_btn_1_pressed(): adicionar_numero("1")
func _on_btn_2_pressed(): adicionar_numero("2")
func _on_btn_3_pressed(): adicionar_numero("3")
func _on_btn_4_pressed(): adicionar_numero("4")
func _on_btn_5_pressed(): adicionar_numero("5")
func _on_btn_6_pressed(): adicionar_numero("6")
func _on_btn_7_pressed(): adicionar_numero("7")
func _on_btn_8_pressed(): adicionar_numero("8")
func _on_btn_9_pressed(): adicionar_numero("9")
func _on_btn_0_pressed(): adicionar_numero("0")
func _on_btn_asterisco_pressed(): adicionar_numero("*")
func _on_btn_hashtag_pressed(): adicionar_numero("#")


# ==========================================
# CONTROLES INFERIORES
# ==========================================

func _on_apagar_txt_pressed():
	# Só apaga se tiver algo escrito e se não for uma mensagem de texto do sistema
	if numero_digitado.length() > 0 and visor_numerico.text != "Chamando TI..." and visor_numerico.text != "Número Inexistente":
		# Corta o último caractere da string
		numero_digitado = numero_digitado.substr(0, numero_digitado.length() - 1)
		visor_numerico.text = numero_digitado

func _on_ligar_pressed():
	
	# PROTEÇÃO: Se qualquer um dos áudios já estiver tocando, o botão não faz nada!
	if audio_senha.playing or audio_erro.playing:
		return
		
	# Impede de tentar ligar com o visor vazio
	if numero_digitado == "":
		return
		
	# Verifica se é o ramal da pista!
	if numero_digitado == "#3550":
		visor_numerico.text = "Chamando TI..."
		# Toca o áudio com a senha do PC
		audio_senha.play()
	else:
		visor_numerico.text = "Número Inexistente"
		# Toca um som de bipe de erro (telefone fora de área)
		audio_erro.play()
		
	# Zera a variável silenciosamente. Assim, quando ele apertar um número de novo, recomeça do zero.
	numero_digitado = ""
