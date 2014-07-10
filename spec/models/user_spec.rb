require 'spec_helper'

describe User do
  subject { User.new() }

  it { is_expected.to validate_presence_of(:password)}
  it { is_expected.to validate_presence_of(:password_confirmation)}
  it { is_expected.to validate_presence_of(:username)}
end
