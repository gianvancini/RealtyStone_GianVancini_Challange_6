require 'faker'

module Factory

    # Massa de dados dinamica
    class Dynamic

        # Retorna um Hash com dados para registro
        def self.valid_register
            {
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                address: Faker::Address.street_address,
                city: Faker::Address.city,
                state: Faker::Address.state,
                zip_code: Faker::Address.zip_code,
                phone: Faker::PhoneNumber.cell_phone,
                ssn: Faker::IDNumber.valid,
                account: Faker::Bank.account_number(digits: 5),
                amount: Faker::Number.number(digits: 3),
                down_p: Faker::Number.number(digits: 2)
            }
        end
    end
end