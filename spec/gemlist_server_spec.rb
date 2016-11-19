require 'spec_helper'

describe GemListServer do
  let(:packages) do
    {
      dependencies: ['nvim-pkg', 'tmux-pkg', 'docker-pkg'],
      unknown: ['xyz']
    }
  end

  before do
    allow(GemListServer).to receive(:get).with(any_args).and_return(packages)
  end

  context '#dependencies' do
    it 'should return correct dependencies as array' do
      expect(GemListServer.new(['my_dev_setup']).dependencies).to eq(packages[:dependencies])
    end

    it 'should return only not installed dependencies' do
      allow_any_instance_of(GemListServer).to receive(:pkg_exists?).with(packages[:dependencies][0]).and_return(false)
      allow_any_instance_of(GemListServer).to receive(:pkg_exists?).with(packages[:dependencies][1]).and_return(true)
      allow_any_instance_of(GemListServer).to receive(:pkg_exists?).with(packages[:dependencies][2]).and_return(true)

      expect(GemListServer.new(['my_dev_setup']).dependencies).to eq([packages[:dependencies][0]])
    end
  end

  context '#unknown_gems' do
    it 'should only return unknown_gems' do
      expect(GemListServer.new(['my_dev_setup']).unknown_gems).to eq(packages[:unknown])
    end
  end
end
