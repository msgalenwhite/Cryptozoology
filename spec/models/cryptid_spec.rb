require 'rails_helper'

describe Cryptid do
  it { should have_valid(:name).when("Dragon") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:description).when("Breathes fire") }
  it { should_not have_valid(:description).when(nil, "") }
end
