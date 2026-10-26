# 🔐 Escape Room: Cibersegurança Corporativa (Ameaça Ransomware)

Este projeto é um simulador interativo desenvolvido para treinamentos e eventos corporativos de conscientização em Segurança da Informação. Criado originalmente para a **AMG Brasil**, o jogo coloca uma equipe em um cenário de crise: a rede foi infectada por um Ransomware e o banco de dados principal (Protheus) será formatado em exatos 20 minutos. 

A dinâmica mistura mecânicas de **Point and Click**, simulação de SO e **Integração Físico-Digital**, exigindo que os jogadores investiguem o ambiente real (a sala física) e o ambiente virtual (o jogo) para conter o ataque.

## 💻 Tecnologias Utilizadas
* **Engine:** Godot Engine 4
* **Linguagem:** GDScript
* **Renderização:** Modo *Compatibility* (garante execução fluida em máquinas corporativas sem GPU dedicada).

## ⚙️ Mecânicas Principais
* **Cronômetro de Tensão:** Contagem regressiva de 20 minutos com alteração de trilha sonora nos 3 minutos finais.
* **Sistema de Penalidade:** O sistema contém iscas de Phishing (e-mail) e Smishing (SMS). Cliques em links maliciosos descontam tempo do relógio imediatamente.
* **Simulação de SO:** Interface imitando um desktop corporativo com sistema de Login, E-mail, Celular Virtual (App Telefone e SMS), Logs de Sistema e Terminal de Comando.
* **Validação Flexível:** Inputs de senha utilizam `.to_lower()` para aceitar variações de maiúsculas/minúsculas, melhorando a usabilidade.

## 🗺️ Fluxo de Resolução (As 6 Fases)

O jogo exige colaboração e comunicação constante. O caminho crítico para a vitória segue estas etapas:

1. **Investigação Física:** A equipe vasculha a sala física e encontra uma "Política de Segurança da Informação" impressa contendo uma falha humana que revela o PIN de acesso: `3007`.
2. **Acesso ao Celular Corporativo:** No jogo, a equipe usa o PIN `3007` para desbloquear o celular virtual, abre o App Telefone e liga para o ramal fictício `#127001`, ouvindo um áudio com a senha do PC.
3. **E-mail e Triagem:** Ao logar no PC, os jogadores evitam armadilhas de phishing, leem o Plano de Contenção no e-mail do CEO/TI e são direcionados aos arquivos de log.
4. **Análise de Sistema:** A equipe rola o arquivo `Logs.txt` até o momento do ataque (14:22) e intercepta a chave temporária do malware em formato Base64: `VDBUVlNfU2F2ZXI=`.
5. **Descriptografia (Terminal):** Inserem o comando técnico `decode VDBUVlNfU2F2ZXI=` no Terminal virtual, que processa a string e devolve a Senha Mestra.
6. **Contenção do Ransomware:** A equipe digita a Senha Mestra (`4F8A-9B22-C37D`) no painel do sistema ERP para abortar a formatação e vencer o jogo.

## 📦 Material de Apoio Administrativo
Para a execução perfeita do evento, o projeto é acompanhado de documentação externa (não inclusa no código-fonte):
* **Manual do Mediador:** Roteiro completo e regras de engajamento lidas antes do cronômetro iniciar.
* **Lista de Chamada e Controle:** Planilha para registro de tempo e taxa de vitória/derrota (capacidade para até 20+ equipes de 4 pessoas).
* **Política Fake:** O arquivo PDF/Word impresso e deixado fisicamente na mesa contendo a primeira pista.

## 🚀 Como Executar
1. Clone o repositório.
2. Importe o projeto no Godot 4.x.
3. Execute a cena principal `main.tscn`.
4. (Opcional) Exporte o projeto para Windows/Web usando o preset de *Compatibility*.

## 📄 Licença

Este projeto está sob a licença [MIT](https://choosealicense.com/licenses/mit/).

Você tem total liberdade para clonar, modificar e utilizar este simulador para treinamentos de cibersegurança em sua própria empresa ou evento, desde que mantenha os avisos de direitos autorais originais. O software é fornecido "no estado em que se encontra" (as is), sem garantias de qualquer tipo.
