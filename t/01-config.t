use v6;

use Test;
use lib 'lib';

plan 4;

use-ok "Beppo::Config", "can use Beppo::Config";
use Beppo::Config;  # update Test.pm to load this after successful "use"!

ok Beppo::Config.new, "can instantiate Config object";

subtest {
    plan 4;

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
    is $config.verbose, False, "default verbose option";
}, "default configuration options";

subtest {
    plan 1;

    my $config = Beppo::Config.new;
    ok $config.show-config, "show-config runs without error";

}, "show-config method functionality"

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
