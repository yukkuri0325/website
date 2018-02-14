require 'rails_helper'

describe "MainController" do

  describe "add" do
    it "given 2 and 3, returns 5" do
      main = MainController.new
      expect(main.add(2,3)).to eq(5)
    end
  end



end
