HOMEBREW_GOLL_VERSION='0.0.1'
class Goll < Formula
  homepage 'https://github.com/b4b4r07/goll'
  url 'https://github.com/b4b4r07/goll.git', :tag => "v#{HOMEBREW_GOLL_VERSION}"
  version HOMEBREW_GOLL_VERSION
  head 'https://github.com/b4b4r07/goll.git', :branch => 'master'

  depends_on 'go' => :build
  depends_on 'hg' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/BurntSushi/toml'
    system 'go', 'get', 'github.com/mitchellh/colorstring'
    mkdir_p buildpath/'src/github.com/b4b4r07/goll'
    ln_s buildpath/'search', buildpath/'src/github.com/b4b4r07/goll/.'
    system 'go', 'build', '-o', 'goll'
    bin.install 'goll'
  end
end
