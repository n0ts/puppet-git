require 'spec_helper'

describe 'git' do
  let(:boxenhome) { '/opt/boxen' }
  let(:configdir) { "#{boxenhome}/config/git" }
  let(:repodir) { "#{boxenhome}/repo" }
  let(:facts) do
    default_test_facts.merge({
      :boxen_home    => boxenhome,
      :boxen_repodir => repodir,
      :boxen_repo_url_template => "https://github.com/%s",
      :boxen_srcdir  => '~/src',
      :homebrew_root => "#{boxenhome}/homebrew",
    })
  end

  let(:default_params) do
    {
      :configdir               => configdir,
      :package                 => 'boxen/brews/git',
      :version                 => '2.15.0-boxen2',
      :global_credentialhelper => "#{boxenhome}/bin/boxen-git-credential",
      :credentialhelper        => "#{repodir}/script/boxen-git-credential",
      :global_excludesfile     => '/opt/boxen/config/git/gitignore',
      :manage_gitignore        => true
    }
  end

  let(:params) { default_params }

  it do
    should contain_class('homebrew')
  end
end
