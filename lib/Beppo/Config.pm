use v6;

class Beppo::Config {
    has $.config-file = "beppo.config";
    has $.start-date = Date.today.earlier(years => 1);
    has $.end-date = Date.today;
    has $.verbose = False;

    method show-config {
        say "config-file: $.config-file";
        say "start-date: $.start-date";
        say "end-date: $.end-date";

        return True;
    }

    method read-config($config-file) {
        if not $config-file.IO.e {
            die "Config file '$config-file' does not exist";
        }

        return True;
    }
};

# vim: expandtab shiftwidth=4 ft=perl6
