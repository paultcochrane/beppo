use v6;

use Test;

plan 4;

{
    my $status = shell "bin/beppo";
    ok $status.exitcode == 0;
}

{
    my $status = shell "bin/beppo --config=nonexistent_config 2> /dev/null";
    ok $status.exitcode != 0;
}

{
    shell "touch existing_config";
    my $status = shell "bin/beppo --config=existing_config";
    ok $status.exitcode == 0;
    shell "rm existing_config";
}

{
    my $status = shell "bin/beppo --start-date=2014-04-03";
    ok $status.exitcode == 0, "specify start date";
}

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
