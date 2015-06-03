use v6;

use Test;
use lib 'lib';

plan 3;

subtest {
    plan 1;

    my $status = shell "bin/beppo";
    ok $status.exitcode == 0, "run without options";
}, "plain run";

subtest {
    plan 1;

    my $status = shell "bin/beppo --verbose";
    ok $status.exitcode == 0, "accept --verbose option";
}, "--verbose option";

subtest {
    plan 3;

    my $status = shell "bin/beppo --start-date=2014-04-03";
    ok $status.exitcode == 0, "specify start date";

    $status = shell "bin/beppo --end-date=2014-04-03";
    ok $status.exitcode == 0, "specify end date";

    $status = shell "bin/beppo --start-date=2014-04-02 --end-date=2014-04-03";
    ok $status.exitcode == 0, "specify start and end date";
}, "--start-date and --end-date options";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
