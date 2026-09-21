extends Control

# Variaveis do game
@onready var tela_game_over = $TelaGameOver

@onready var tela_vitoria = $TelaVitoria
@onready var label_nome_time = $TelaVitoria/LabelNomeTime
@onready var label_tempo_vitoria = $TelaVitoria/LabelTempoVitoria

# Variaveis de tempo
@onready var label_relogio = $LabelRelogio
@onready var timer_jogo = $TimerJogo
var tempo_maximo_sala = 1200.0 # Caso trocar o tempo de game tenho que lembrar de trocar aqui também

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

#Desktop Email

@onready var abrirOutlookDesktop = $PopupPC/MonitorUI/AppEmailDesktop

@onready var msgPadraoEmail = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/MensagemPadrao
@onready var conteudoEmail1 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email1Conteudo
@onready var conteudoEmail2 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email2Conteudo
@onready var conteudoEmail3 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email3Conteudo
@onready var conteudoEmail4 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email4Conteudo
@onready var conteudoEmail5 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email5Conteudo
@onready var conteudoEmail6 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email6Conteudo
@onready var conteudoEmail7 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email7Conteudo
@onready var conteudoEmail8 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email8Conteudo
@onready var conteudoEmail9 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email9Conteudo

@onready var alertaPhishingEmail = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/AlertaPhishing

@onready var btn_phishing_email_1 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email1Conteudo/panelazul/Button
@onready var btn_phishing_email_5 = $PopupPC/MonitorUI/AppEmailDesktop/DivisaoTela/ConteudoDireita/Email5Conteudo/Button

# Desktop Blocos de Notas
@onready var BlocoNotas = $PopupPC/MonitorUI/AppLogsDesktop
@onready var texto_logs = $PopupPC/MonitorUI/AppLogsDesktop/TextEdit
var texto_original_logs = "" # Variável vazia que vai guardar o textão

# Desktop Terminal
@onready var app_terminal_desktop = $PopupPC/MonitorUI/AppTerminalDesktop
@onready var historico_terminal = $PopupPC/MonitorUI/AppTerminalDesktop/MargemInterna/OrganizadorVertical/HistoricoTerminal
@onready var input_terminal = $PopupPC/MonitorUI/AppTerminalDesktop/MargemInterna/OrganizadorVertical/LinhaDeComando/InputTerminal

# Desktop Ransomware
@onready var app_ransomware = $PopupPC/MonitorUI/AppRansomware
@onready var input_chave_ransomware = $PopupPC/MonitorUI/AppRansomware/MargemGeral/DivisaoColunas/ColunaDireita/AreaDesbloqueio/InputChaveAES
@onready var relogio_ransomware = $PopupPC/MonitorUI/AppRansomware/MargemGeral/DivisaoColunas/ColunaEsquerda/FundoCronometro/RelogioTexto

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
	
	# Salva o texto do log do desktop caso o usuário faça caquinha
	texto_original_logs = texto_logs.text

	# Boas vindas do terminal
	historico_terminal.text = "[color=#00FF00]Terminal v1.0.4 - Sistema de Recuperacao de Emergencia\nDigite 'help' para ver os comandos disponiveis.\n\n[/color]"

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
	
	if senha_digitada == "CyberSec!26":
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
	
func _process(delta):
	# Pega o tempo que falta no timer e converte pra número inteiro (corta os milissegundos)
	var tempo_restante = int(timer_jogo.time_left)
	
	# Matemática básica para extrair os minutos e os segundos
	var minutos = tempo_restante / 60
	var segundos = tempo_restante % 60
	
	# Salva a formatação em uma variável para podermos distribuir para vários relógios
	var tempo_formatado = "%02d:%02d" % [minutos, segundos]
	
	# Formata a string para sempre ter 2 dígitos. Ex: em vez de "5:9", fica "05:09"
	label_relogio.text = tempo_formatado
	
	# ATUALIZAÇÃO RANSOMWARE: Espelha o mesmo tempo. 
	# Adicionei "00:" na frente para imitar o formato (Horas:Minutos:Segundos) da imagem de referência
	relogio_ransomware.text = "00:" + tempo_formatado
	
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
	# 1. Troque o timer_jogo.wait_time pelo valor fixo da sala (20 min = 1200 seg)
	var tempo_total = tempo_maximo_sala
	var tempo_restante = timer_jogo.time_left
	
	# 2. Para o cronômetro
	timer_jogo.stop()
	
	# 3. Calcula o tempo exato (Tempo fixo - O que sobrou na tela)
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

func _on_email_button_pressed() -> void:
	abrirOutlookDesktop.show()
	
func _on_fecharEmail_pressed() -> void:
	abrirOutlookDesktop.hide()

func _on_button_email_1_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.show()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_2_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.show()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_3_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.show()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_4_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.show()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_5_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.show()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_6_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.show()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_7_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.show()
	conteudoEmail8.hide()
	conteudoEmail9.hide()


func _on_button_email_8_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.show()
	conteudoEmail9.hide()


func _on_button_email_9_pressed() -> void:
	alertaPhishingEmail.hide()
	msgPadraoEmail.hide()
	conteudoEmail1.hide()
	conteudoEmail2.hide()
	conteudoEmail3.hide()
	conteudoEmail4.hide()
	conteudoEmail5.hide()
	conteudoEmail6.hide()
	conteudoEmail7.hide()
	conteudoEmail8.hide()
	conteudoEmail9.show()


func _on_sair_aviso_phishing_pressed() -> void:
	alertaPhishingEmail.hide()


func _on_button_phishing1email() -> void:
	# 1. Desativa o botão e muda a cor da fonte para cinza
	btn_phishing_email_1.disabled = true
	btn_phishing_email_1.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	
	# 2. Exibe o alerta vermelho gigante
	alertaPhishingEmail.show()
	
	# 3. Aplica a penalidade de tempo
	var tempo_atual = timer_jogo.time_left
	var tempo_perdido = 150 
	
	if tempo_atual > tempo_perdido:
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		timer_jogo.start(0.01)


func _on_button_phishing2email() -> void:
	# 1. Desativa o botão e muda a cor da fonte para cinza
	btn_phishing_email_5.disabled = true
	btn_phishing_email_5.add_theme_color_override("font_color", Color(0.5, 0.5, 0.5))
	
	# 2. Exibe o alerta vermelho gigante
	alertaPhishingEmail.show()
	
	# 3. Aplica a penalidade de tempo
	var tempo_atual = timer_jogo.time_left
	var tempo_perdido = 150 
	
	if tempo_atual > tempo_perdido:
		timer_jogo.start(tempo_atual - tempo_perdido)
	else:
		timer_jogo.start(0.01)

func _on_logs_button_pressed() -> void:
	BlocoNotas.show()

func _on_sair_bloco_notas_pressed() -> void:
	BlocoNotas.hide()
	# Restaura o texto para o estado original
	texto_logs.text = texto_original_logs
	
	# Zera o histórico do Ctrl+Z para o novo texto
	texto_logs.clear_undo_history()

func _on_sair_terminal_pressed() -> void:
	app_terminal_desktop.hide()

func _on_terminal_button_pressed() -> void:
	app_terminal_desktop.show()
	input_terminal.call_deferred("grab_focus")
	

# Quando o jogador aperta ENTER no terminal
func _on_input_terminal_text_submitted(new_text: String) -> void:
	var comando = new_text.strip_edges()
	
	# Exibe o que o usuário digitou no histórico
	historico_terminal.text += "[color=#FFFFFF]C:\\> " + comando + "[/color]\n"
	
	# Limpa o input imediatamente para a próxima digitação
	input_terminal.text = ""
	
	# Lógica dos comandos
	if comando == "help":
		historico_terminal.text += "[color=#FFFF00]Comandos disponiveis:\n - decode <chave_base64>\n - cls (limpa a tela)\n - exit (fecha o terminal)[/color]\n\n"
		
	elif comando == "cls":
		historico_terminal.text = ""
		
	elif comando == "exit":
		app_terminal_desktop.hide()
		return
		
	elif comando.begins_with("decode "):
		var chave = comando.substr(7).strip_edges()
		
		if chave == "VDBUVlNfU2F2ZXI=":
			historico_terminal.text += "[color=#00FF00]SUCESSO: Hash quebrado com sucesso.[/color]\n"
			historico_terminal.text += "[color=#00FF00]CHAVE DE DESCRIPTOGRAFIA (AES-256): 4F8A-9B22-C37D[/color]\n\n"
		else:
			historico_terminal.text += "[color=#FF0000]ERRO: Chave invalida ou corrompida.[/color]\n\n"
	else:
		historico_terminal.text += "[color=#FF0000]Comando desconhecido. Digite 'help'.[/color]\n\n"
	

# Ransomware - Etapa final
func _on_protheus_button_pressed():
	app_ransomware.show()
	input_chave_ransomware.grab_focus()
	
func _on_botao_sair_ransomware_pressed() -> void:
	app_ransomware.hide()
	
func _on_botao_desbloquear_pressed() -> void:
	# Pega o texto diretamente da propriedade .text do nó de input
	var chave_digitada = input_chave_ransomware.text.strip_edges().to_upper()
	
	if chave_digitada == "4F8A-9B22-C37D":
		# 1. Limpa a tela vermelha do ransomware
		app_ransomware.hide()
		# Aqui você coloca a lógica de vitória:
		# 1. Tocar um som de sucesso.
		# 2. Esconder a tela vermelha.
		# 3. Parar o relógio do jogo.
		# 4. Mostrar a tela final de "Parabéns, você salvou a empresa!".
		# 2. Dispara a sua função que finaliza o jogo!
		vencer_jogo()
	else:
		print("Chave incorreta!")
		# Pode adicionar uma tremedeira na tela ou som de erro
		input_chave_ransomware.text = ""
