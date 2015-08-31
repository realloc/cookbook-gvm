require 'spec_helper'

describe 'gvm::default' do
  describe command('gvm version'), sudo: false do
    let(:pre_command) { 'source ~/.bash_profile' }
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /Go Version Manager/ }
  end

  describe command('go version'), sudo: false do
    let(:pre_command) { 'source ~/.bash_profile' }
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /go version go1\.5/ }
  end
end
