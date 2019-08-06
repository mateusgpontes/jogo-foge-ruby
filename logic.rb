require_relative "ui.rb"
require "pry"

def le_mapa(numero)
    texto = File.read("mapa#{numero}.txt")
    mapa = texto.split("\n")
    mapa
end

def encontra_heroi(mapa)
   hero = "H"
   for line in 0..(mapa.size - 1) 
       line_current = mapa[line] 
       if line_current.include?("H")
           for collum in 0..(line_current.size - 1)
               position = line_current[collum]
               if position == hero
                   return [line, collum]
               end
           end
       end
   end
end

#Outro jeito
#def encontra_heroi2(mapa)
#   hero = "H"
#   mapa.each_with_index do |line_current, line|
#       collum_hero = line_current.index(hero)
#       if collum_hero
#           return [line, collum_hero]
#       end
#   end
#   #não achei!
#end

def movimenta(direcao, perso)
    case direcao
        when "W"
            perso[0] -= 1
        when "S"
            perso[0] += 1
        when "A"
            perso[1] -= 1
        when "D"
            perso[1] += 1
    end
    perso
end

def jogo
    boas_vindas
    mapa = le_mapa(2)

    while(true)
        aparece_mapa(mapa)
        direcao = onde_ir
        heroi = encontra_heroi(mapa)
        mapa[heroi[0]][heroi[1]] = " "
        new_position = movimenta(direcao, heroi)
        mapa[new_position[0]][new_position[1]] = "H"
        #binding.pry
    end
end