require "cpf_cnpj"
i = 0
c = 0
info_cliente = { }
respostas_positivas = ["Sim", "sim, por favor", "sim" "claro", "por favor", "s", "yes"]
respostas_negativas = ["Não, obrigado", "Não", "Nao", "n", "nao", "não", "no"]
    
def get_cpf(info_cliente)
    loop do 
        print "Digite seu CPF: "
        info_cliente["cpf"] = gets.chomp.to_i
        unless CPF.valid?(info_cliente["cpf"])
            system ("cls")
            puts "CPF inválido."
        else
            break
        end
    end
    system ("cls")
end

def get_nome(info_cliente)
    print "Digite seu nome: "
    info_cliente["nome"] = gets.chomp
    system ("cls")
end

def get_idade(info_cliente)
    print "Digite sua idade: "
    info_cliente["idade"] = gets.chomp.to_i
    system ("cls")
end

def get_email(info_cliente)
    print "Digite seu email: "
    info_cliente["email"] = gets.chomp
    system ("cls")
end

puts "\nBem-vindo ao nosso site!"
puts " "

get_cpf(info_cliente)
    cpf = CPF.new(info_cliente["cpf"])
get_nome(info_cliente)
get_idade(info_cliente)
get_email(info_cliente)

puts "Parabéns, cadastro completo."

loop do
    if c == 0
        print "\nDeseja conferir seus dados?  "
        resposta = gets.chomp
    else 
        print "\nDeseja conferir seus dados novamente?  "
        resposta = gets.chomp
    end
    
    if respostas_positivas.include?(resposta)
        system ("cls")
        puts "Dados de #{info_cliente["nome"]}:"
        puts "\nCPF: #{cpf.formatted}"
        puts "Nome: #{info_cliente["nome"]}"
        puts "Idade: #{info_cliente["idade"]}"
        puts "Email: #{info_cliente["email"]}"
        puts " "
        c =+ 1
        
        if i == 0
            puts "Deseja alterar algo? "
            print "Se sim, digite a informação que deseja alterar.  "
            alteracao = gets.chomp
            system ("cls")
        else 
            puts "Deseja alterar algo a mais? "
            print "Se sim, digite a informação que deseja alterar. "
            alteracao = gets.chomp
            system ("cls")
        end
        case alteracao
        when "cpf", "CPF"
            get_cpf(info_cliente)
            cpf = CPF.new(info_cliente["cpf"])
            system ("cls")
            puts "Certo, alteração realizada com sucesso."
            i += 1
        when "nome", "Nome"
            get_name(info_cliente)
            system ("cls")
            puts "Certo, alteração realizada com sucesso."
            i += 1
        when "idade", "Idade"
            get_idade(info_cliente)
            system ("cls")
            puts "Certo, alteração realizada com sucesso."
            i += 1
        when "email", "Email"
            get_email(info_cliente)
            system ("cls")
            puts "Correto, alteração realizada com sucesso."
            i += 1
        else  respostas_negativas.include?(alteracao)
            system ("cls")
            puts "Ok"
        end
    else
        system ("cls")
        puts "Certo, obrigado por se inscrever em nosso site, tenha um bom dia :)"
        puts " "
        break
    end
end