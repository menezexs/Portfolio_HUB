local Banco = require("banco")
local banco = Banco:carregarouCriar()

while true do 
    print("\n=== Terminal Bancario ===")
    print("1. Criar Conta")
    print("2. Acessar Conta")
    print("3. Deletar Conta")
    print("4. Sair")
    io.write("Escolha uma opcao: ")
    local resposta = io.read("*n")
    io.read()

    if resposta == 1 then 
        banco:criarConta()
    elseif resposta == 2 then 
        banco:acessarConta()
    elseif resposta == 3 then 
        banco:deletarConta()
    elseif resposta == 4 then 
        banco:salvarContas()
        print("obrigado por utilizar o banco!")
        break
    else 
        print("opcao invalida!")
    end

end