# Guia Essencial Bash / Unix

## 1. Navegação & Diretórios
```bash
pwd                       # Caminho absoluto atual
cd /caminho               # Mudar de diretório
cd ..                     # Subir um nível
cd ~                      # Ir para a home
cd -                      # Voltar ao diretório anterior
mkdir -p dir/sub/pasta    # Criar diretórios recursivamente
```

## 2. Listagem & Inspeção
```bash
ls -la                    # Listar tudo (incluindo ocultos), formato longo
ls -lh                    # Tamanhos legíveis (KB, MB, GB)
ls -lt                    # Ordenar por data de modificação (mais recente primeiro)
ls -lS                    # Ordenar por tamanho
file arquivo.ext          # Identificar tipo real do ficheiro
stat arquivo.ext          # Metadados completos (inodo, permissões, timestamps)
du -sh *                    # mostra os kbs das pastas sem arquivos ocultos
du -sh * -sort              # sort by 
sudo du -sh * | sort -h     # sudo admin mode mostra arquivos com permissões de admin 
```



## 3. Gestão de Ficheiros
```bash
cp arquivo.txt copia.txt  # Copiar ficheiro
cp -r pasta/ destino/     # Copiar diretório recursivo
mv origem.txt destino.txt # Mover ou renomear
rm arquivo.txt            # Remover ficheiro
rm -rf pasta/             # Remover pasta e conteúdo forçadamente (cuidado)
touch novo.txt            # Criar ficheiro vazio ou atualizar timestamp
ln -s /origem link_nome   # Criar link simbólico
```

## 4. Leitura & Filtragem de Texto
```bash
cat arquivo.txt                   # Imprimir ficheiro completo no terminal
head -n 20 arquivo.txt            # Exibir as primeiras 20 linhas
tail -n 20 arquivo.txt            # Exibir as últimas 20 linhas
tail -f log.txt                   # Acompanhar atualizações de ficheiro em tempo real (streaming)
less arquivo.txt                  # Navegar no ficheiro com scroll (tecla q para sair)
grep -rnI "termo" .               # Pesquisar termo recursivo ignorando binários (-r recursivo, -n linha, -I texto)
grep -i "termo" arq.txt           # Busca insensível a maiúsculas/minúsculas (case-insensitive)
grep -v "ignorar" arq.txt         # Inverter correspondência: exibe todas as linhas que NÃO contêm o termo
wc -l arquivo.txt                 # Contar número total de linhas
wc -w arquivo.txt                 # Contar número total de palavras
```

## 5. Pesquisa de Ficheiros (find & Globbing)
```bash
find . -name "relatorio.txt"       # Busca exata sensível a maiúsculas a partir da pasta atual
find . -iname "relatorio.txt"      # Busca insensível a maiúsculas/minúsculas (case-insensitive)
find . -iname "file?.txt"          # '?' substitui exatamente 1 caractere qualquer (ex: file1.txt, fileA.txt)
find . -iname "file??.txt"         # '??' substitui exatamente 2 caracteres quaisquer (ex: file10.txt)
find . -iname "file???.txt"        # '???' substitui exatamente 3 caracteres quaisquer (ex: file156.txt)
find . -iname "file[156].txt"      # '[]' casa exatamente 1 caractere dentro do conjunto (1, 5 ou 6)
find . -iname "file[0-9].txt"      # Intervalo: casa qualquer dígito numérico único de 0 a 9
find . -iname "file[!0-9].txt"     # Negação: casa qualquer caractere único que NÃO seja número
find . -type f -name "*.csv"       # Filtrar apenas ficheiros regulares (-type f) terminados em .csv
find . -type d -name "dados*"      # Filtrar apenas diretórios (-type d) cujo nome inicia por "dados"
find . -size +100M                 # Localizar ficheiros com tamanho superior a 100 Megabytes
find . -size -10k                  # Localizar ficheiros menores que 10 Kilobytes
find . -mtime -7                   # Ficheiros modificados nos últimos 7 dias (-mtime)
find . -mtime +30                  # Ficheiros sem modificação há mais de 30 dias
find . -empty                      # Localizar ficheiros ou diretórios completamente vazios
find . -name "*.tmp" -delete       # Buscar e apagar diretamente os ficheiros correspondentes
find . -name "*.log" -exec gzip {} \;  # Executar comando (ex: compactar) sobre cada resultado encontrado
```

## 6. Manipulação & Extração de Dados em Texto
```bash
sort arquivo.txt                   # Ordenar linhas em ordem alfabética ascendente
sort -n -r valores.txt             # Ordenar numericamente (-n) em ordem reversa decrescente (-r)
sort -u dados.txt                  # Ordenar e remover linhas duplicadas (-u de unique)
uniq -c dados_ordenados.txt        # Contar repetições consecutivas de cada linha (requer sort prévio)
cut -d',' -f1 dados.csv            # Extrair apenas a 1ª coluna de um ficheiro delimitado por vírgula (-d',')
cut -d';' -f1,3 dados.csv          # Extrair colunas 1 e 3 de um ficheiro delimitado por ponto e vírgula
cut -c 1-10 arquivo.txt            # Extrair do 1º ao 10º caractere de cada linha
sed 's/antigo/novo/g' arq.txt      # Substituir texto no stream e exibir na tela sem alterar original
sed -i '' 's/antigo/novo/g' arq.txt # Substituir texto gravando diretamente no ficheiro (inplace no macOS)
awk -F',' '{print $1, $3}' dados.csv           # Imprimir colunas 1 e 3 delimitadas por vírgula (-F',')
awk -F',' '$3 > 100 {print $1, $3}' dados.csv  # Filtrar e imprimir apenas linhas onde a coluna 3 > 100
awk '{s+=$1} END {print s}' numeros.txt        # Calcular e imprimir o somatório total da coluna 1
```

## 7. Pipes & Redirecionamento
```bash
comando > arq.txt         # Sobrescrever saída padrão para ficheiro
comando >> arq.txt        # Anexar (append) saída padrão ao ficheiro
comando 2>&1              # Redirecionar erros (stderr) para saída (stdout)
cmd1 | cmd2               # Pipe: saída do cmd1 vira entrada do cmd2
cmd1 && cmd2              # Executar cmd2 apenas se cmd1 suceder
cmd1 || cmd2              # Executar cmd2 apenas se cmd1 falhar
xargs                     # Converter entrada padrão em argumentos de comando
```

## 8. Processos, Rede & Diagnóstico de Sistema
```bash
# Processos
ps aux                    # Listar todos os processos em execução no sistema
pgrep -l nome             # Procurar identificador de processo (PID) pelo nome
kill PID                  # Terminar processo graciosamente (SIGTERM)
kill -9 PID               # Forçar terminação imediata e irrecuperável (SIGKILL)
killall nome_processo     # Matar todos os processos associados a esse nome
lsof -i :1433             # Identificar qual processo está a escutar na porta 1433

# Rede
ip a                      # Exibir interfaces de rede, IPs (v4/v6) e estados no Linux (ip address)
ifconfig                  # Exibir configurações de interfaces de rede (padrão macOS / BSD)
ping -c 4 8.8.8.8         # Testar conectividade de rede enviando exatamente 4 pacotes ICMP
curl -I https://site.com  # Consultar apenas cabeçalhos HTTP de resposta (código status, servidor)
curl -O https://site.com/dados.csv  # Descarregar ficheiro remoto mantendo o nome de origem
wget https://site.com/arquivo.zip   # Descarregar ficheiro diretamente da web via terminal

# Armazenamento & Hardware
df -h                     # Espaço livre e ocupado de todas as partições em formato legível (GB/TB)
du -sh pasta/             # Tamanho total do espaço ocupado em disco por uma pasta específica
top                       # Painel dinâmico em tempo real de consumo de CPU, memória e processos
uptime                    # Tempo de atividade contínua da máquina e média de carga (load average)
uname -a                  # Informações completas do sistema operacional e versão do kernel
```

## 9. Permissões
```bash
chmod +x script.sh        # Tornar executável
chmod 644 arquivo.txt     # Leitura/escrita para dono, leitura para outros
chmod 755 pasta/          # Total para dono, leitura/execução para outros
chown utilizador:grupo f  # Alterar dono e grupo do ficheiro
```

## 10. Atalhos de Teclado
```text
Ctrl + C    Cancela o comando em execução
Ctrl + D    Fecha a sessão / envia EOF
Ctrl + L    Limpa o ecrã (equivalente a clear)
Ctrl + R    Pesquisa reversa no histórico de comandos
Ctrl + A    Move o cursor para o início da linha
Ctrl + E    Move o cursor para o final da linha
Ctrl + U    Apaga do cursor até o início da linha
Ctrl + K    Apaga do cursor até o final da linha
!!          Executa o último comando digitado
!$          Pega o último argumento do comando anterior
```

## 11. Git Básico
```bash
git init                  # Inicializar novo repositório local
git clone <url>           # Clonar repositório existente
git status -s             # Estado do repositório em formato compacto
git add .                 # Adicionar todas as alterações à staging area
git commit -m "mensagem"  # Gravar alterações com mensagem descritiva
git log --oneline -n 10   # Ver últimos 10 commits de forma resumida
git diff                  # Ver alterações pendentes antes do commit
git branch                # Listar branches locais
git checkout -b nova-feat # Criar e mudar para nova branch
git switch <branch>       # Alternar entre branches existentes
git pull origin main      # Puxar atualizações do repositório remoto
git push origin main      # Enviar commits locais para o repositório remoto
git restore arquivo.txt   # Descartar alterações não commitadas de um ficheiro
```

## 12. Operações Customizadas do Ambiente (Fish Shell)

Atalhos, aliases e funções customizadas ativas no ambiente local (`~/.config/fish/`).

### 10.1 Navegação Inteligente & Listagem Moderna
```bash
ls                        # eza enriquecido com cores, ícones e estado do Git
ll                        # eza -la (listagem completa detalhada incluindo ocultos)
l                         # Atalho rápido para ls -la
cat arquivo.txt           # bat com syntax highlighting (sem paginação forçada)
cd pasta                  # zoxide (navegação preditiva pelo histórico de diretórios)
Ctrl + T                  # Pesquisa fuzzy (fzf) de ficheiros com preview em tempo real (bat)
```

### 10.2 Painel de Controlo & Menus
```bash
menu                      # Exibe o painel visual DEEHLUSA DEV STACK (ou 'h')
sub                       # Exibe matriz completa de subcomandos de IA e LifeOPS
```

### 10.3 Runtimes de IA & Assistentes
```bash
# Claude Code
claude                    # Execução interativa padrão
claude-skip               # Permissões automáticas ativadas com integração Chrome
claude-clean              # Sessão isolada sem MCPs (~/clean)
claude-l                  # Perfil isolado Laura (~/.claude-laura)
c-carrousel               # Execução rápida com modelo Haiku
yolo-carrousel            # Haiku com auto-aprovação de comandos (-y)

# Codex CLI
codex                     # Execução padrão do Codex CLI
codex-clean-home          # Sandbox temporária em /tmp com acesso total descartável
codex-omni                # Execução via perfil Omni do ChatGPT Desktop
codex-free                # Execução via modelo local hydra-free-best

# Google Antigravity CLI (AGY)
agy / agy-p1              # Ativa e executa perfil principal (p1)
agy-p2 / agy-p3           # Alternar para perfis secundários
agy-status                # Verificar quotas e estado do perfil ativo
agy-oauth / agy-apikey    # Alternar método de autenticação (OAuth vs API Key)
agy-login-p1              # Reautenticar perfil p1

# OpenCode CLI
oc / oc-i                 # Execução interativa padrão (opencode --auto)
o-pro                     # Execução com DeepSeek-v4 Pro
o-flash                   # Execução rápida com DeepSeek-v4 Flash
o-glm                     # Execução com GLM-5.2
o-kimi                    # Execução com Kimi K2.7 Code

# OmniRoute (Proxy Local de Modelos)
omni                      # Iniciar daemon OmniRoute (porta 20128 / endpoint /v1)
omnistatus                # Verificar se o endpoint está ativo (UP/DOWN)
omnistop                  # Encerrar processo do OmniRoute
```

### 10.4 Atalhos de Diretórios (Workspace Jumps)
```bash
hydra                     # cd ~/Documents/DEV FILES/hydra
autoshorts                # cd ~/dev/AutoShorts
cs50                      # cd ~/dev/cs50-python
lifeos-run                # cd ~/dev/lifeos-run
lifeops                   # cd ~/Documents/DEV FILES/LifeOPS
contentflow               # cd ~/dev/contentflow
luxflow                   # cd ~/dev/luxundone-flow
deerflow                  # cd ~/dev/deer-flow
mosaico                   # cd ~/Documents/mosaico
megathread                # Iniciar documentação local (~/.local/share/megathread_pirata)
```

### 10.5 DeerFlow Engine
```bash
df-start                  # Iniciar daemon do DeerFlow (make dev-daemon)
df-stop                   # Parar processos do DeerFlow (make stop)
df-status                 # Relatório de status dos serviços (./scripts/status.sh)
```

### 10.6 LifeOPS & Gestão Financeira
```bash
modelo                    # Executar modelo financeiro interativo (uv run --with rich)
caixa / financas / plano  # Atalhos equivalentes para modelo
snapshot                  # Snapshot analítico de métricas de negócio
puxar-caixa               # Backup local automático e pull do Google Sheets (via rclone)
subir-caixa               # Backup na nuvem e push da versão local para o Drive
```

### 10.7 Utilidades & Ferramentas Locais
```bash
vagas                     # CLI de monitorização e triagem de vagas de emprego
diligencia                # Script de diligências e relatórios IEFP/PAE
turbo                     # Ativar modo de desempenho do sistema (~/turbo.sh)
ollama-cli                # Lançador do cliente local Ollama
gsd                       # Get Stuff Done CLI (npx gsd-cc)
```

