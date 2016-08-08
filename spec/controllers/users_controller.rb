require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let{:valid_params} {{email: "my_email@gmail.com", passowrd: "1234567890"}}
	let{:valid_params} {{email: "my_emailgmail.com", passowrd: "1234567890"}}


end