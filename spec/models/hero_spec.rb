require 'rails_helper'

RSpec.describe Hero, type: :model do
  
  describe 'Should validate presence of name' do
    it { should validate_presence_of(:name) } 
  end
end
