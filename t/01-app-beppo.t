use v6;

use Test;
use lib 'lib';

plan 2;

use-ok 'App::beppo';
use App::beppo;

ok App::beppo.new, "Can instantiate beppo application";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
