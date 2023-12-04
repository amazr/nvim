# Setup
1. Install Neovim.
2. Clone this repo where ever the env var `XDG_CONFIG_HOME` points to. If it's not set
then export it in your bashrc or zshrc. I have mine set to `~/.config/nvim`
3. I'm using [packer](https://github.com/wbthomason/packer.nvim) as a package manager, 
so make sure to install that.
4. You might need to install some other CLI tools like ripgrip, node, etc.
4. I like to set a couple aliases like `alias vim='nvim'` and `alias v='nvim`
5. Now comes the Java LSP stuff. I like LSP zero, which uses Mason to manage LSP's.
So open nvim anywhere and run `:Mason`. Install jdtls (and gradle_ls) from this page.
If you look at my packer file you'll notice that it installs coc.nvim, another LSP tool.
We need it installed, but do **not** install coc-java! I have no idea why this works.
Now, all your Java projects will be managed with jdtls using LSP zero keybinds and auto-complete.
You'll notice in Java projects that a bunch of `.classpath`, `.project`, etc files will be generated.
If you add something new to your classpath, like a test directory, then head to the command line
and use the [gradle eclipse plugin](https://github.com/wbthomason/packer.nvim) to regenerate those files.
6. To run Java JUnit tests you'll need to install [vscode-java-test](https://github.com/mfussenegger/nvim-jdtls#vscode-java-test-installation)
somewhere and point the `jdtls.lua` file at it.


