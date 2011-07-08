Factory.sequence(:email) { |n| "person#{n}@example.com" }
Factory.sequence(:username) { |n| "username#{n}" }

Factory.define :user do |u|
  u.email                 { |_| Factory.next(:email) }
  u.username              { |_| Factory.next(:username) }
  u.password              'my password'
  u.password_confirmation { |a| a.password }
  u.full_name             'Samnang Chhun'
end
