# Configuração Personalizada do Neovim
<!--YOUTUBE: agora sim icone do youtube OK!!! -->
<!--FIX: Minhas configurações personalizadas.-->
Este repositório contém minha configuração personalizada do Neovim, baseada no NvChad e estendida com plugins adicionais para melhorar minha  e experiência de codificação.
___
## Pré-requisitos

- Neovim (versão 0.9.0 ou superior)
- [NvChad](https://nvchad.github.io/) instalado
- Git
- Lua 
- [ ] LuaSnip


## Plugins Utilizados

1. [Codeium](https://github.com/Exafunction/codeium.vim): Autocompleção de código alimentada por IA.
2. [Dashboard](https://github.com/glepnir/dashboard-nvim): Uma página inicial bonita para o Neovim.
3. [Lint](https://github.com/mfussenegger/nvim-lint): Linting assíncrono para Neovim.
4. [LSP Config](https://github.com/neovim/nvim-lspconfig): Configurações padrão para vários servidores de linguagem.
5. [Mason](https://github.com/williamboman/mason.nvim): Gerenciador de instalação de LSP, DAP, linter e formatador.
6. [Oil](https://github.com/stevearc/oil.nvim): Um gerenciador de arquivos para Neovim.
7. [Todo Comments](https://github.com/folke/todo-comments.nvim): Destaca e pesquisa comentários TODO no código.
8. [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Parsing de código aprimorado.
9. [Zen Mode](https://github.com/folke/zen-mode.nvim): Modo de foco para escrita ou codificação sem distrações.

## Instalação

1. Clone este repositório:
   ```
   git clone https://github.com/wanderlei2583/neovim.git ~/.config/nvim
   ```

## Uso

### Mapas de teclas:
1. 'Control+s' para salvar.
2. 'Espaço+q' para fechar o NeoVim.
3. '-' para abrir o Oil

## Personalização

Para personalizar ainda mais sua configuração:

1. Edite o arquivo `~/.config/nvim/lua/plugins/init.lua` para adicionar ou remover plugins.
2. Modifique `~/.config/nvim/lua/init.lua` para ajustar configurações gerais.
3. Use `~/.config/nvim/lua/configs/` para configurações específicas de plugins.


## Contribuição

Sinta-se à vontade para abrir issues ou pull requests se tiver sugestões de melhorias.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
