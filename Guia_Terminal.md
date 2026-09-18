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
cat arquivo.txt           # Imprimir ficheiro completo
head -n 20 arquivo.txt    # Primeiras 20 linhas
tail -n 20 arquivo.txt    # Últimas 20 linhas
tail -f log.txt           # Seguir alterações em tempo real
less arquivo.txt          # Navegar no ficheiro (q para sair)
grep -rnI "termo" .       # Pesquisar termo recursivo ignorando binários
wc -l arquivo.txt         # Contar linhas
```

## 5. Pipes & Redirecionamento
```bash
comando > arq.txt         # Sobrescrever saída padrão para ficheiro
comando >> arq.txt        # Anexar (append) saída padrão ao ficheiro
comando 2>&1              # Redirecionar erros (stderr) para saída (stdout)
cmd1 | cmd2               # Pipe: saída do cmd1 vira entrada do cmd2
cmd1 && cmd2              # Executar cmd2 apenas se cmd1 suceder
cmd1 || cmd2              # Executar cmd2 apenas se cmd1 falhar
xargs                     # Converter entrada padrão em argumentos de comando
```

## 6. Processos & Portas
```bash
ps aux                    # Listar todos os processos do sistema
pgrep -l nome             # Procurar PID por nome
kill PID                  # Terminar processo graciosamente (SIGTERM)
kill -9 PID               # Forçar terminação imediata (SIGKILL)
killall nome_processo     # Matar todos os processos com esse nome
lsof -i :1433             # Identificar processo a usar a porta 1433
```

## 7. Permissões
```bash
chmod +x script.sh        # Tornar executável
chmod 644 arquivo.txt     # Leitura/escrita para dono, leitura para outros
chmod 755 pasta/          # Total para dono, leitura/execução para outros
chown utilizador:grupo f  # Alterar dono e grupo do ficheiro
```

## 8. Atalhos de Teclado
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

## 9. Git Básico
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
