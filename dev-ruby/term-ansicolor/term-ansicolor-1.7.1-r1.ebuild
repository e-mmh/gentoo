# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_EXTRADOC="CHANGES README.md"

RUBY_FAKEGEM_GEMSPEC="term-ansicolor.gemspec"

inherit ruby-fakegem

DESCRIPTION="Small Ruby library that colors strings using ANSI escape sequences"
HOMEPAGE="https://flori.github.io/term-ansicolor/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ppc ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

ruby_add_rdepend ">=dev-ruby/tins-1.0"

each_ruby_test() {
	${RUBY} -Ilib:.:tests -e 'Dir["tests/*_test.rb"].each{|f| require f}' || die
}

all_ruby_install() {
	all_fakegem_install

	docinto examples
	dodoc examples/*
}
