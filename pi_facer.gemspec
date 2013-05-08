# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
	s.name = "pi_facer"
	s.version = "0.0.1"

	s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
	s.authors = ["Arthur Silva"]
	s.date = Time.now.strftime("%Y-%m-%d")
	s.description = "Event driven Raspberry Pi Piface library based on pi_piper lib"
	s.email = "awls99@gmail.com"
	s.extra_rdoc_files = ["README.md", "lib/pi_piper.rb", "lib/pi_piper/bcm2835.rb", "lib/pi_piper/libbcm2835.img", "lib/pi_piper/pin.rb", "lib/pi_piper/spi.rb"]
	s.files = ["Manifest", "README.md", "Rakefile", "lib/pi_piper.rb", "lib/pi_piper/bcm2835.rb", "lib/pi_piper/libbcm2835.img", "lib/pi_piper/pin.rb", "lib/pi_piper/spi.rb", "pi_piper.gemspec"]
	s.homepage = "https://github.com/awls99/pi_piper"
	s.require_paths = ["lib"]
	s.rubygems_version = "1.8.23"
	s.summary = "Event driven Raspberry Pi Piface library based on pi_piper lib"
	s.add_dependency(%q<piface>, [">= 0"])

end
