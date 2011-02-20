Factory.define :pair_request do |p|
  p.subject       'my subject'
  p.pair_date     Date.today
  p.description   'my description'
  p.sender        { |u| u.association(:user) }
  p.partner       { |u| u.association(:user) }
end
