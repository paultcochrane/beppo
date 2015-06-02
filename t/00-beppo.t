use v6;

use Test;
use lib 'lib';

plan 5;

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
    plan 2;

    my $status = shell "bin/beppo --config-file=nonexistent_config 2> /dev/null";
    ok $status.exitcode != 0, "specify nonexistent config file";

    shell "touch existing_config";
    $status = shell "bin/beppo --config-file=existing_config";
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
    plan 4;

    my $status = shell "bin/beppo --show-config";
    ok $status.exitcode == 0, "accept --show-config option";

    my $output = qqx{bin/beppo --show-config};
    like $output, rx/'config-file'/, "config-file in show-config output";

    $output = qqx{bin/beppo --show-config};
    like $output, rx/'start-date'/, "start-date in show-config output";

    $output = qqx{bin/beppo --show-config};
    like $output, rx/'end-date'/, "end-date in show-config output";
}, "--show-config functionality";

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
