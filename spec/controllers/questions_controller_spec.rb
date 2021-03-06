require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:question) { create(:question) }

  describe 'GET #index' do
    let(:questions) { create_list(:question, 2) }

    before { get :index }

    it 'assigns @questions' do
      expect(assigns(:questions)).to eq(questions)
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:answer) { create(:answer, question: question) }

    before { get :show, params: { id: question.id } }

    it 'assigns  question to @question' do
      expect(assigns(:question)).to eq(question)
    end

    it 'renders the show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do

    before { get :new }

    it 'assigns  question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'renders the new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    context 'valid' do
      it 'save question' do
        expect { process :create, method: :post, params: { question: attributes_for(:question) } }
            .to change(Question, :count).by(1)
      end

      it 'redirects to show view' do
        process :create, method: :post, params: { question: attributes_for(:question) }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'invalid' do
      it 'is not save question' do
        expect { process :create, method: :post, params: { question: attributes_for(:invalid_question) } }
            .to_not change(Question, :count)
      end

      it 'render new view' do
        process :create, method: :post, params: { question: attributes_for(:invalid_question) }
        expect(response).to render_template :new
      end
    end
  end

end
