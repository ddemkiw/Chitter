require 'spec_helper'

describe Peep do 
  
  context 'Demonstration of how datamapper works for peeps' do 
    
    it 'should be created and then retrieved from the db' do 
      expect(Peep.count).to eq(0)
      Peep.create(  text: 'This is My Peep')
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.text).to eq('This is My Peep')   
    end
    
  end     
end 
