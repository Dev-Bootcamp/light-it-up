require 'spec_helper'

describe ElementsController do

  before(:each) do
    @slide = Slide.create!(title: 'Slide 1', slideshow_id: 1, creator_id: 1, sort_order: 1)
    @user = User.create!(email: 'user2@user2.com', password: 'password', password_confirmation: 'password')
    controller.stub(:current_user).and_return(@user)
  end

  describe '#index' do

    it 'should access all elements' do
      get 'index'
      elements = Element.all
      expect(elements).to eq Element.all
    end

  end

  describe '#create' do

    it 'should create a new element' do
      expect { post 'create' , :element => {"content" => "hello world",
                                   "slide_id" => "1",
                                   "element_type_id" => "1" } }.to change(Element, :count).by(1)
    end

  end

  describe '#new' do

    it 'should open a new element object' do
      get 'new'
      element = Element.new
      expect(element.class).to be Element
    end

    it 'should not save an Element object' do
      get 'new'
      expect{ Element.new }.to_not change(Element, :count).by(1)
    end

  end

  describe '#show' do

    before do

      controller.stub(:current_user).and_return(@user)
      @element = Element.create!(content: 'Hello, world!', slide_id: 1, element_type_id: 1)

    end

    it "should show the element view" do
      get :show, :id => @element.id

      response.should render_template(:show)
    end

  end



end
