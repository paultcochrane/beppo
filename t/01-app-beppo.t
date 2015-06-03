use v6;

use Test;
use lib 'lib';

plan 4;

use-ok 'App::beppo';
use App::beppo;

ok App::beppo.new, "can instantiate beppo application";

subtest {
    plan 4;
    my $beppo = App::beppo.new;
    ok $beppo.start-date, "application has a start date";
    ok $beppo.end-date, "application has an end date";

    ok $beppo.start-date ~~ Date, "start date is a Date";
    ok $beppo.end-date ~~ Date, "end date is a Date";
}, "default start and end dates";

subtest {
    plan 1;

    my $start-date = '2014-06-03';
    my $end-date = '2015-06-03';
    ok App::beppo.new(:$start-date, :$end-date),
        "application accepts start and end dates";
}, "setting start and end date values";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
