def boas_vindas
    puts "Qual seu nome?"
    nome = gets.strip
    puts "\n"
    puts "Bem vindo ao jogo #{nome}"
    nome
end

def aparece_mapa(mapa)
    puts mapa
end

def onde_ir
    puts "Para onde você deseja andar"
    onde = gets.strip
end