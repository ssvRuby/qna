FactoryGirl.define do
  factory :answer, class: 'Answer' do
    body "answerbody"
  end

  factory :invalid_answer, class: 'Answer' do
    body nil
    question nil
  end
end