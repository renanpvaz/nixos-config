{
  "languageserver" = {
    "haskell" = {
      "command" = "haskell-language-server-wrapper";
      "args" = ["--lsp"];
      "rootPatterns" = [
        "*.cabal"
        "stack.yaml"
        "cabal.project"
        "package.yaml"
        "hie.yaml"
      ];
      "filetypes" = ["haskell" "lhaskell"];
      "initializationOptions" = {
        "languageServerHaskell" = {
          "hlintOn" = true;
        };
      };
    };
    "elmLS" = {
      "command" = "elm-language-server";
      "filetypes" = ["elm"];
      "rootPatterns" = ["elm.json"];
    };
  };
  "codeLens.enable" = true;
  "coc.preferences.codeLens.enable" = true;
  "coc.preferences.jumpCommand" = "drop";
  "coc.preferences.formatOnSaveFiletypes" = ["*"];
  "typescript.referencesCodeLens.enable" = false;
}

