use v6;

use Test;
use lib 'lib';

plan 3;

use-ok "Beppo::Config", "can use Beppo::Config";
use Beppo::Config;  # update Test.pm to load this after successful "use"!

ok Beppo::Config.new, "can instantiate Config object";

subtest {
    plan 3;

    my $config = Beppo::Config.new;
    is $config.config-file, "beppo.config",
        "config-file default value";
    # XXX: this code is also the implementation
    #      should one pass in date info to the constructor so that one could
    #      make this more testable?  Does such info really belong in the
    #      constructor?
    is $config.start-date, Date.today.earlier(years => 1),
        "default start date is one year ago";
    is $config.end-date, Date.today,
        "default end date is today";
}, "default configuration options";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
