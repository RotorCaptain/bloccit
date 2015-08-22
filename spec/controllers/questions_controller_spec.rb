require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
  
let (:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_boolean) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns my_question to @questions" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
  end

   describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
      it "instantiates @questions" do
        get :new
        expect(assigns(:question)).not_to be_nil
      end
    end
  
  
  describe "GET show" do
     it "returns http success" do

       get :show, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do

       get :show, {id: my_question.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_question to @question" do
       get :show, {id: my_question.id}

       expect(assigns(:question)).to eq(my_question)
     end
   end
   
   
  describe "QUESTION create" do
      it "increases the number of question by 1" do
        expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_boolean}}.to change(Question,:count).by(1)
      end
 
      it "assigns the new question to @questions" do
        post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph,  resolved: RandomData.random_boolean}
        expect(assigns(:question)).to eq Question.last
      end
 
      it "redirects to the new question" do
        post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_boolean}
        expect(response).to redirect_to Question.last
      end
  end
  
  
  describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_question.id}

       expect(response).to render_template :edit
     end
    end


  describe "GET #resolved" do
    it "returns http success" do
      get :resolved
      expect(response).to have_http_status(:success)
    end
  end


  describe "DELETE destroy" do
     it "deletes the question" do
       delete :destroy, {id: my_question.id}
 
       count = Question.where({id: my_question.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to question index" do
       delete :destroy, {id: my_question.id}
 
       expect(response).to redirect_to posts_path
     end
   end
end
