class Arduino < ApplicationRecord
    
    belongs_to :equipamento
    #has_many :equipamentos
    
    validates_presence_of :ip, message: " - deve ser preenchido!"
    validates_presence_of :equipamento_id, message: " - deve ser preenchido!"
end
