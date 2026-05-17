local Conta = {}
Conta.__index = Conta

function Conta:new(usuario, senha, saldo)
    local self = setmetatable({},Conta)
    self.usuario = usuario
    self.senha = senha
    self.saldo = saldo or 0
    return self
end

function Conta:verificarsenha(senha)
   return self.senha == senha

end

function Conta:menu()
    while true do 
        print("\n=== Conta de ".. self.usuario .." ===")
        print("1. Ver Saldo")
        print("2. Depositar")
        print("3. Levantar")
        print("4. Sair")
        io.write("Escolha uma opção: ")
        local resposta = io.read("*n")
        io.read()

        if resposta == 1 then 
            self:versaldo()
        elseif resposta == 2 then 
            self:depositar()
        elseif resposta == 3 then
            self:levantar()
        elseif resposta == 4 then
           print("saindo da conta,...")
           break
        else 
            print("opção inválida!")
        end

    end

end

function Conta:versaldo()
    print("saldo atual: "..self.saldo.."$")
end

function Conta:depositar()
    io.write("valor para deposito: ")
    local valor = tonumber(io.read())
    if valor and valor > 0 then
        self.saldo = self.saldo + valor
        print("deposito realizado com sucesso!")
    else 
        print("valor invalido!")
    end
end

function Conta:levantar()
    io.write("valor para levantar: ")
    local valor = tonumber(io.read())
    if valor and valor > 0 and valor <= self.saldo then
        self.saldo = self.saldo - valor
        print("levantamento realizado com sucesso!")
    else 
        print("saldo insuficiente ou valor invalido!")
    end
    
end

return Conta
 