require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostController, type: :controller do

   describe "GET new" do
    it "returns http success" do
      get :new, sponsored_id: my_sponsored.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, sponsored_id: my_sponsored.id
      expect(response).to render_template :new
    end
 
    it "initializes @sponsored" do
      get :new, sponsored_id: my_sponsored.id
      expect(assigns(:sponsored)).not_to be_nil
    end
  end
  
  describe "GET show" do
    it "returns http success" do
        get :show, sponsored_id: my_sponsored.id, id: my_sponsored.id
        expect(response).to have_http_status(:success)
    end
     
    it "renders the #show view" do
      get :show, sponsored_id: my_sponsored.id, id: my_post.id
      expect(response).to render_template :show
     end
 
     it "assigns my_sponsored to @sponsored" do
       get :show, {id: my_sponsored.id}
       expect(assigns(:sponsored)).to eq(my_sponsored)
     end
   end

  describe "GET edit" do
    it "returns http success" do
      get :edit, sponsored_id: my_sponsored.id, id: mysponsored.id
      expect(response).to have_http_status(:success)
    end
 
    it "renders the #edit view" do
      get :edit, sponsored_id: my_sponsored.id, id: my_post.id
      expect(response).to render_template :edit
    end
     
    it "assigns post to be updated to @post" do
      get :edit, sponsored_id: my_sponsored.id, id: my_post.id
      post_instance = assigns(:sponsored)

      expect(sponsored_instance.id).to eq my_sponsored.id
      expect(sponsored_instance.title).to eq my_sponsored.title
      expect(sponsored_instance.body).to eq my_sponsored.body
      expect(sponsored_instance.price).to eq my_sponsored.price
    end
  end

end
