# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

states = ['GO', 'MT', 'MS', 'DF', 'AM', 'AC', 'RO', 'RR', 'AP', 'TO', 'PA', 'MA', 'PI', 'CE', 
  'RN', 'PB', 'PE', 'SE', 'AL', 'BA', 'SP', 'MG', 'RJ', 'ES', 'PR', 'SC', 'RS']


State.create([{ state_id: "AC", state: "Acre" },
              { state_id: "AL", state: "Alagoas" },
              { state_id: "AP", state: "Amapá" },
              { state_id: "AM", state: "Amazonas" },
              { state_id: "BA", state: "Bahia" },
              { state_id: "CE", state: "Ceará" },
              { state_id: "DF", state: "Distrito Federal" },
              { state_id: "ES", state: "Espírito Santo" },
              { state_id: "GO", state: "Goiás" },
              { state_id: "MA", state: "Maranhão" },
              { state_id: "MT", state: "Mato Grosso" },
              { state_id: "MS", state: "Mato Grosso do Sul" },
              { state_id: "MG", state: "Minas Gerais" },
              { state_id: "PA", state: "Pará" },
              { state_id: "PB", state: "Paraíba" },
              { state_id: "PR", state: "Paraná" },
              { state_id: "PE", state: "Pernambuco" },
              { state_id: "PI", state: "Piauí" },
              { state_id: "RJ", state: "Rio de Janeiro" },
              { state_id: "RN", state: "Rio Grande do Norte" },
              { state_id: "RS", state: "Rio Grande do Sul" },
              { state_id: "RO", state: "Rondônia" },
              { state_id: "RR", state: "Roraima" },
              { state_id: "SC", state: "Santa Catarina" },
              { state_id: "SP", state: "São Paulo" },
              { state_id: "SE", state: "Sergipe" },
              { state_id: "TO", state: "Tocantins" },
              ])

99.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  age = Random.rand(10...99)
  state = states[Random.rand(0..26)]
  role = Faker::Company.profession
  Contact.create!(name:  name,
               email: email,
               age: age,
               state: state,
               role: role )
end