require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:list) { List.create!(title: "New List Title", body: "New list body") }
  let(:item) { Item.create!(body: "Item body", list: list ) }

  describe "attributes" do
    it "has a body attribute" do
      expect(item).to have_attributes(body: "Item body")
    end
  end
end
