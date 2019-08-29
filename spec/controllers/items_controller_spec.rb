require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:my_list) { List.create!(title: "My List Title", body: "My list body") }
  let(:my_item) { Item.create!(body: "My item body", list: my_list ) }


  describe "POST #create" do
    it "increases the number of items by 1" do
      expect{ post :create, params: { list_id: my_list.id, item: { body: "My item body"} } }.to change(Item,:count).by(1)
    end

    it "redirects to the list show view" do
      post :create, params: { list_id: my_list.id, item: { body: "My item body"} }
      expect(response).to redirect_to [my_list]
    end
  end


#  describe "PUT #update" do
#    it "updates item with expected attributes" do
#      new_body = "My new item body"
#      put :update, params: { list_id: my_list.id, id: my_item.id, item: { body: new_body } }
#      updated_item = assigns(:item)
#      expect(updated_item.id).to eq my_item.id
#      expect(updated_item.body).to eq new_body
#    end
#
#    it "redirects to the list show view" do
#      new_body = "My new item body"
#      put :update, params: { list_id: my_list.id, id: my_item.id, item: { body: new_body } }
#      expect(response).to redirect_to [my_list]
#    end
#  end


  describe "DELETE #destroy" do
    it "deletes the item" do
      delete :destroy, params: { list_id: my_list.id, id: my_item.id }
      count = Item.where({id: my_item.id}).count
      expect(count).to eq 0
    end

    it "redirects to the list show view" do
      delete :destroy, params: { list_id: my_list.id, id: my_item.id }
      expect(response).to redirect_to [my_list]
    end
  end

end
