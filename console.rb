require('pry-byebug')
require_relative('models/bounty_details.rb')

bounty1 = Bounty.new({
  'name' => 'Boba Fett',
  'species' => 'Human',
  'bounty_value' => '1000000',
  'homeworld' => 'Kamino'
  })

bounty2 = Bounty.new({
  'name' => 'Bossk',
  'species' => 'Trandoshan',
  'bounty_value' => '800000',
  'homeworld' => 'Trandosha'
  })

bounty1.save()
bounty2.save()

bounty1.species = "Dog"
bounty1.update()

bounty_details = Bounty.all()

binding.pry
nil
