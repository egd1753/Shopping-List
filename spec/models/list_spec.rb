require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { List.create!(title: "New List Title", body: "New list body") }

  describe "attributes" do
    it "has title and body attributes" do
      expect(list).to have_attributes(title: "New List Title", body: "New list body")
    end
  end
end
