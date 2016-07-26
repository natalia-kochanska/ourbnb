Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['4wgdnq3fy6szrfrf']
Braintree::Configuration.public_key = ENV['pjy33bp9ch2mkhvy']
Braintree::Configuration.private_key = ENV['f9f6ea4a65833107cba4c2d13a77300f']