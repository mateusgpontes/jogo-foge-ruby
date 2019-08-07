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
  char = perso.dup
  case direcao.upcase
    when "W"
        char[0] -= 1
    when "S"
        char[0] += 1
    when "A"
        char[1] -= 1
    when "D"
        char[1] += 1
  end
  char
end

def validar_mapa?(mapa, new_position)
  
  if new_position[0] < 0 || new_position[1] < 0
    puts "\n"
    puts "Você não pode sair do mapa"
    puts "\n"
    return false
  elsif new_position[0] >= mapa.size || new_position[1] >= mapa[0].size
    puts "\n"
    puts "Você não pode sair do mapa"
    puts "\n" 
    return false
  end

  case mapa[new_position[0]][new_position[1]]
  when "X"
    puts "\n"
    puts "Bateu na parede"
    puts "\n"
    return false
  when "F"
    puts "\n"
    puts "Um fantasma te matou"
    puts "\n"
    return true
  when "B"
    puts "\n"
    puts "Parabens você pegou o baú. Venceu a fase :D"
    puts "\n"
    return true
  end

end

def jogo
  boas_vindas
  mapa = le_mapa(2)

  while(true)
    aparece_mapa(mapa)
    direcao = onde_ir
    heroi = encontra_heroi(mapa)
    new_position = movimenta(direcao, heroi)
    limita = validar_mapa?(mapa, new_position)
    #puts "#{heroi}"
    #puts "#{new_position}"


    if limita
      break
    elsif limita == false
      next
    else
      nil
    end

    mapa[heroi[0]][heroi[1]] = " "
    mapa[new_position[0]][new_position[1]] = "H"

    #binding.pry
  end
end