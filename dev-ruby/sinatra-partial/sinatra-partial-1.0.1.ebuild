# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGES.markdown README.markdown"

inherit ruby-fakegem

DESCRIPTION="Just the partials helper in a gem"
HOMEPAGE="https://github.com/yb66/Sinatra-Partial"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/sinatra-1.4"

ruby_add_bdepend "test? ( dev-ruby/haml dev-ruby/rack-test dev-ruby/rspec-its dev-ruby/timecop )"

all_ruby_prepare() {
	# Use a rack version consistent with sinatra
	sed -i -e '2igem "rack", "~>1.0"' \
		-e '/simplecov/,/^end/ s:^:#:' spec/spec_helper.rb || die
}
