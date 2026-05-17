local Banco = {}
Banco.__index = Banco 

local Conta = require("conta")
local arquivo = "contas.txt"


function Banco:new()
    local self = setmetatable({},Banco)
    self.contas = {}
    return self 
end

function Banco:salvarContas()
    local file = io.open(arquivo, "w")
    if file then 
      for _, conta in pairs(self.contas) do 
        file:write(conta.usuario..","..conta.senha..","..conta.saldo.."\n")
      end
      file:close()
    end
end

function Banco:carregarouCriar()
    local self = Banco:new()
    local file = io.open(arquivo, "r")
    if file then 
        for line in file:lines() do 
            local usuario, senha, saldo = line:match("([^,]+),([^,]+),([^,]+)")
            saldo = tonumber(saldo)
            self.contas[usuario] = Conta:new(usuario, senha, saldo)
        end
        file:close()
    end
    return self
end

function Banco:criarConta()
    io.write("digite o seu nome de usuário: ")
    local usuario = io.read()
    if self.contas[usuario] then 
        print("usuario já existe!")
        return
    end
    io.write("crie uma senha: ")
    local senha = io.read()
    io.write("insira um saldo inicial: ")
    local saldo = tonumber(io.read())

    local conta = Conta:new(usuario, senha, saldo)
    self.contas[usuario] = conta
    self:salvarContas()
    print("Conta criada com Sucesso! Usuario: "..usuario)
end

function Banco:acessarConta()
    io.write("Digite o seu usuario: ")
    local usuario = io.read()
    io.write("Digite a sua senha: ")
    local senha = io.read()

    local conta = self.contas[usuario]
    if conta and Conta:verificarSenha(senha) then 
        print("Login bem sucedido!")
        conta:menu()
        self:salvarContas()
    else
        print("usuario ou senha incorretos!")
    end

end

function Banco:deletarConta()
    io.write("Digite o seu usuario: ")
    local usuario = io.read()
    io.write("Digite a sua senha: ")
    local senha = io.read()

    local conta = self.contas[usuario]
    if conta and Conta:verificarSenha(senha) then 
       self.contas[usuario] = nil
       self:salvarContas()
       print("Conta deletada com sucesso!")
    else
        print("usuario ou senha incorretos!")
    end
end

return Banco