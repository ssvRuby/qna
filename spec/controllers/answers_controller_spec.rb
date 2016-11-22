require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  let(:question) { create(:question) }
  let(:answer) { create(:answer,  question: question) }

  describe 'POST #create' do

    context 'valid' do
      it 'save answer' do
        expect { process :create, method: :post, params: { answer: attributes_for(:answer), question_id: question } }
            .to change(question.answers, :count).by(1)
      end

      it 'redirects to show' do
        process :create, method: :post, params: { answer: attributes_for(:answer), question_id: question }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'invalid' do
      it 'is  not save answer' do
        expect { process :create, method: :post, params: { answer: attributes_for(:invalid_answer), question_id: question } }
            .to_not change(Answer, :count)
      end

      it 'renders invalid to new ' do
        process :create, method: :post, params: { answer: attributes_for(:invalid_answer), question_id: question }
        expect(response).to render_template :new
      end
    end
  end
end
