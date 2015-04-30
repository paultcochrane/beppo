use v6;

use Test;

plan 4;

subtest {
    plan 1;

    my $status = shell "bin/beppo";
    ok $status.exitcode == 0, "run without options";
}, "plain run";

subtest {
    plan 2;

    my $status = shell "bin/beppo --config=nonexistent_config 2> /dev/null";
    ok $status.exitcode != 0, "specify nonexistent config file";

    shell "touch existing_config";
    $status = shell "bin/beppo --config=existing_config";
    ok $status.exitcode == 0, "specify existent config file";
    shell "rm existing_config";
}, "--config option";

subtest {
    plan 3;

    my $status = shell "bin/beppo --start-date=2014-04-03";
    ok $status.exitcode == 0, "specify start date";

    $status = shell "bin/beppo --end-date=2014-04-03";
    ok $status.exitcode == 0, "specify end date";

    $status = shell "bin/beppo --start-date=2014-04-02 --end-date=2014-04-03";
    ok $status.exitcode == 0, "specify start and end date";
}, "--start-date and --end-date options";

subtest {
    plan 1;

    my $status = shell "bin/beppo --show-config";
    ok $status.exitcode == 0, "accept --show-config option";
}, "--show-config functionality";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
