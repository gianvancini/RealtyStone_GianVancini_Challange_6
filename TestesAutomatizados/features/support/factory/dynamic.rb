require 'faker'

module Factory

    # Geração de massa de dados dinamica
    class Dynamic

        # Retorna um Hash com email e messagem.
        def self.message_for_contact
            {
                email: Faker::Internet.email,
                message: Faker::Lorem.paragraph
            }
        end
    end
end