require 'rails_helper'

RSpec.describe Question, :type => :model do

  it {should have_many :ansvers}

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:title).is_at_least(1).is_at_most(255) }


end