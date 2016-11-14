FactoryGirl.define do
  factory :question, class: 'Question' do
    title "factory_tytle"
    body "factory_body"
  end

  factory :invalid_question, class: 'Question' do
    title nil
    body  nil
  end
end