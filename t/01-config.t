use v6;

use Test;
use lib 'lib';

plan 2;

use-ok "Beppo::Config", "can use Beppo::Config";
use Beppo::Config;  # update Test.pm to load this after successful "use"!

ok Beppo::Config.new, "can instantiate Config object";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
