require 'rails_helper'
require 'rspec'

RSpec.describe ListingsController, type: :controller do
	let{:user} {{email: "my_email@gmail.com", passowrd: "1234567890"}}
	let{:valid_params} {{name: "room", address: "kl", property_type: "house", description: "nice", no_of_beds: "2", price: "30", user_id: user.id}}

describe "GET #new" do
	before do
		session[:user_id] = user.id
		get :new
	end

	it "returns http success" do
      expect(response).to have_http_status(:success)
    end

	it "renders the form" do
		expect(response).to render_template("_form")
	end
end

end