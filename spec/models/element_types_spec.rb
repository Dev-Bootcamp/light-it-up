require 'spec_helper'


  describe ElementType do

    context "Validations and Associations" do

        it "should belong to a slide" do
          element_type = ElementType.reflect_on_association(:elements)
          element_type.macro.should == :has_many
        end

        it "should belong to an element_type" do
          element_type = ElementType.reflect_on_association(:slides)
          element_type.macro.should == :has_many
        end

        it "should not have users" do
          ElementType.reflect_on_association(:user).should be_nil
        end

        it "should be valid with a name before tag and after tag" do
          FactoryGirl.create(:element_type).should be_valid
        end

        it "should be valid with a name before tag and after tag" do
          FactoryGirl.build(:element_type, name: nil).should_not be_valid
        end
    end
  end



