# ~/.config/fish/functions/run_upgrade_awk.fish

function run_upgrade_awk --description 'Execute upgrade AWK script'
    if test (count $argv) -lt 1
        echo "Erro: Por favor forneça o arquivo de entrada"
        echo "Uso: run_upgrade_awk <arquivo_entrada> [arquivo_saida]"
        return 1
    end

    # Caminho do script AWK
    set -l awk_script "/home/wrp/scripts/awk/upgrade_awk.awk"

    # Verifica se o script existe
    if not test -f $awk_script
        echo "Erro: Script AWK não encontrado em $awk_script"
        return 1
    end

    # Verifica se o arquivo de entrada existe
    if not test -f $argv[1]
        echo "Erro: Arquivo de entrada '$argv[1]' não encontrado"
        return 1
    end

    # Se arquivo de saída foi especificado
    if test (count $argv) -eq 2
        awk -f $awk_script $argv[1] > $argv[2]
    else
        # Se não, imprime na saída padrão
        awk -f $awk_script $argv[1]
    end
end

# Para instalar a função:
# 1. Salve este conteúdo em ~/.config/fish/functions/run_upgrade_awk.fish
# 2. Dê permissão de execução: chmod +x ~/.config/fish/functions/run_upgrade_awk.fish

# Exemplos de uso:
# run_upgrade_awk input.txt                  # Imprime na tela
# run_upgrade_awk input.txt output.txt       # Salva em arquivoinclude <stdlib.h>
