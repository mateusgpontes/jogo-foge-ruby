require_relative "ui.rb"

def le_mapa(numero)
    texto = File.read("mapa#{numero}.txt")
    mapa = texto.split("\n")
    mapa
end

def jogo
    boas_vindas
    mapa = le_mapa(1)

    while(true)
        aparece_mapa(mapa)
        direcao = onde_ir
    end
end