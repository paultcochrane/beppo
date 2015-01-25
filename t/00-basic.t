use v6;

use Test;

plan 3;

{
    my $status = shell "bin/beppo";
    ok $status.exit == 0;
}

{
    my $status = shell "bin/beppo --config=nonexistent_config";
    ok $status.exit != 0;
}

{
    shell "touch existing_config";
    my $status = shell "bin/beppo --config=existing_config";
    ok $status.exit == 0;
    shell "rm existing_config";
}

# vim: expandtab shiftwidth=4 softtabstop=4 ft=perl6
