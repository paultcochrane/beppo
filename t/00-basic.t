use v6;

use Test;

plan 6;

{
    my $status = shell "bin/beppo";
    ok $status.exitcode == 0, "run without options";
}

{
    my $status = shell "bin/beppo --config=nonexistent_config 2> /dev/null";
    ok $status.exitcode != 0, "specify nonexistent config file";
}

{
    shell "touch existing_config";
    my $status = shell "bin/beppo --config=existing_config";
    ok $status.exitcode == 0, "specify existent config file";
    shell "rm existing_config";
}

{
    my $status = shell "bin/beppo --start-date=2014-04-03";
    ok $status.exitcode == 0, "specify start date";
}

{
    my $status = shell "bin/beppo --end-date=2014-04-03";
    ok $status.exitcode == 0, "specify end date";
}

{
    my $status = shell "bin/beppo --start-date=2014-04-02 --end-date=2014-04-03";
    ok $status.exitcode == 0, "specify start and end date";
}

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
