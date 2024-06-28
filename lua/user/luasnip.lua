
local MacVCodeSnippets = "~/Library/Application Support/Code/User/snippets/python.json"

local VSCode_python_snippets = MacVCodeSnippets

require("luasnip.loaders.from_vscode").load_standalone({path = VSCode_python_snippets})

