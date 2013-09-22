require 'spec_helper'

describe HomeController do
  include Devise::TestHelpers

  describe "GET index" do
    subject { get :index }
    context "with a non logged user" do
      it "should redirect to sign in" do
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context "with a logged user" do
      it "should render index page" do
        sign_in(create :user)
        expect(subject).to render_template("index")
      end
    end
  end

  describe "GET users" do
    subject { get :users }
    context "with a non logged user" do
      it "should render users page" do
        expect(subject).to render_template("users")
      end
    end

    context "with a logged user" do
      it "should render users page" do
        sign_in(create :user)
        expect(subject).to render_template("users")
      end
    end
  end

end
