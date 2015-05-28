use v6;

class Beppo::Config {
    has $.config-file = "beppo.config";
    has $.start-date = Date.today.earlier(years => 1);
    has $.end-date = Date.today;
};

# vim: expandtab shiftwidth=4 ft=perl6
