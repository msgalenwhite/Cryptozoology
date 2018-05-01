require 'rails_helper'

describe Sighting do
  it { should have_valid(:location).when("USA") }
  it { should_not have_valid(:location).when(nil, "") }

  it { should have_valid(:description).when("Breathed fire!") }
  it { should_not have_valid(:description).when(nil, "") }

  it { should have_valid(:pic_url).when("www.google.com") }
  it { should_not have_valid(:pic_url).when(nil, "") }

  it { should have_valid(:rating).when(5) }
  it { should_not have_valid(:rating).when(nil, "", 8, -1, 0) }
end
