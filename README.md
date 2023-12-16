# Why? (What is wrong with me?)
Idk

# Setup
1. Install Neovim.
2. Clone this repo where ever the env var `XDG_CONFIG_HOME` points to. If it's not set
then export it in your bashrc or zshrc. I have mine set to `~/.config/nvim`
3. I'm using [packer](https://github.com/wbthomason/packer.nvim) as a package manager, 
so make sure to install that.
4. You might need to install some other tools like ripgrip, node, etc.
4. I like to set a couple aliases like `alias vim='nvim'` and `alias v='nvim`
5. I'm using LSP zero, nvim-cmp, and Mason for LSP stuff. For Java specifically I'm using nvim-jdtls
which uses eclipse.jd.tls. Jdtls has it's own config file (jdtls.lua), unlike other LSP's that are setup
in lsp.lua. Since the underlying LSP is eclipse you have to manage your classpath (and such) files
using the [gradle eclipse plugin](https://github.com/wbthomason/packer.nvim) to regenerate those files.
6. To debug Java JUnit tests you'll need to install [vscode-java-test](https://github.com/mfussenegger/nvim-jdtls#vscode-java-test-installation)
somewhere and point the `jdtls.lua` file at it. Then you can debug tests using nvim-dap and nvim-dap-ui. Otherwise
I have some lua scripts for running tests using gradlew. The mapping '<leader>gtwc' will open a vsplit and test
the class in the active buffer, and '<leader>gwtm' will test the method under the cursor.
