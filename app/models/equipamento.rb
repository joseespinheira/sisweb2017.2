class Equipamento < ApplicationRecord
    
    #belongs_to :arduino
    has_many :arduinos
    
    #has_many :comandos
    belongs_to :comando
        
    validates_presence_of :nome, message: " - deve ser preenchido!"
    validates_presence_of :comando_id, message: " - deve ser preenchido!"
    validates_numericality_of :comando_id, message: " - formato invalido!"
end
