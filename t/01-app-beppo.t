use v6;

use Test;
use lib 'lib';

plan 4;

use-ok 'App::beppo';
use App::beppo;

subtest {
    plan 4;
    my $beppo = App::beppo.new;
    ok $beppo.start-date, "application has a start date";
    ok $beppo.end-date, "application has an end date";

    ok $beppo.start-date ~~ (Date), "start date is a Date";
    ok $beppo.end-date ~~ (Date), "end date is a Date";
}, "default start and end dates";

subtest {
    plan 5;

    my $start-date = '2014-06-03';
    my $end-date = '2015-06-03';
    ok App::beppo.new(:$start-date, :$end-date),
        "application accepts start and end dates";

    my $beppo = App::beppo.new(start-date => '2014-01-01',
                               end-date => '2014-06-30');
    is $beppo.start-date, Date.new('2014-01-01'),
        "start date set correctly";
    is $beppo.end-date, Date.new('2014-06-30'),
        "end date set correctly";
    ok $beppo.start-date ~~ (Date), "start date from arg is Date";
    ok $beppo.end-date ~~ (Date), "end date from arg is Date";
}, "setting start and end date values";

subtest {
    plan 1;

    my $beppo = App::beppo.new;
    ok $beppo.run, "application runs";
}, "run the program";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
