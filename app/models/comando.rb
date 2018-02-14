class Comando < ApplicationRecord
    
    has_many :equipamentos
    #belongs_to :equipamento
    
    validates_presence_of :nome, message: " - deve ser preenchido!"
    validates_presence_of :comando, message: " - deve ser preenchido!"
end
