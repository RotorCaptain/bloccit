require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostController, type: :controller do
  
  let (:my_topic) { 
    Topic.create( name: RandomData.random_sentence, 
                  description: RandomData.random_paragraph) }
  
  let (:my_sponsored) { 
    SponsoredPost.create!( title:  RandomData.random_sentence, 
                           body:   RandomData.random_paragraph,
                           price:  rand(10..40) ) }

  describe "GET new" do
    it "returns http success" do
      get :new, id: my_sponsored.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, id: my_sponsored.id
      expect(response).to render_template :new
    end
 
    it "initializes @sponsored" do
      get :new, id: my_sponsored.id
      expect(assigns(:sponsored)).not_to be_nil
    end
  end
  
  describe "GET show" do
    it "returns http success" do
        get :show, id: my_sponsored.id, topic_id: my_topic.id
        expect(response).to have_http_status(:success)
    end
     
    it "renders the #show view" do
      get :show, id: my_sponsored.id, topic_id: my_topic.id
      expect(response).to render_template :show
     end
 
     it "assigns my_sponsored to @sponsored" do
       get :show, {id: my_sponsored.id, topic_id: my_topic.id}
       expect(assigns(:sponsored)).to eq(my_sponsored)
     end
   end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: my_sponsored.id, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
 
    it "renders the #edit view" do
      get :edit, id: my_sponsored.id, topic_id: my_topic.id
      expect(response).to render_template :edit
    end
     
    it "assigns post to be updated to @sponsored" do
      get :edit, id: my_sponsored.id, topic_id: my_topic.id
      sponsored_instance = assigns(:sponsored)

      expect(sponsored_instance.id).to eq my_sponsored.id
      expect(sponsored_instance.title).to eq my_sponsored.title
      expect(sponsored_instance.body).to eq my_sponsored.body
      expect(sponsored_instance.price).to eq my_sponsored.price
    end
  end

end
