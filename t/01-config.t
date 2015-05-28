use v6;

use Test;
use lib 'lib';

plan 3;

use-ok "Beppo::Config", "can use Beppo::Config";
use Beppo::Config;  # update Test.pm to load this after successful "use"!

ok Beppo::Config.new, "can instantiate Config object";

subtest {
    plan 1;

    my $config = Beppo::Config.new;
    is $config.config-file, "beppo.config",
        "config-file default value";
}, "default configuration options";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
